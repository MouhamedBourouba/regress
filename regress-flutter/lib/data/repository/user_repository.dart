import 'dart:convert';
import 'dart:io';

import 'package:regress/data/constants.dart';
import 'package:regress/data/models/coefficient_entity.dart';
import 'package:regress/data/models/session_token.dart';
import 'package:regress/data/models/student_bac_info_response_v2_entity.dart';
import 'package:regress/data/models/student_group_entity.dart';
import 'package:regress/data/models/student_notes_entity.dart';
import 'package:regress/data/sources/progress_api.dart';
import 'package:regress/domain/models/exam_notes.dart';
import 'package:regress/domain/models/group.dart';
import 'package:regress/domain/models/module_coefficient.dart';
import 'package:regress/domain/models/student.dart';
import 'package:regress/domain/repository/user_data_repository.dart';
import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../sources/local_image_cache.dart';

class UserRepositoryImpl implements StudentRepository {
  final ProgressAPI _progressAPI;
  final Base64LocalImageCache _imageCache;
  final SharedPreferences _preferences;

  UserRepositoryImpl(this._progressAPI, this._imageCache, this._preferences);

  @override
  Future<ResultDart<Unit, String>> login(String registrationNumber, String password) async {
    final res = _progressAPI.login(registrationNumber, password);
    await res.onSuccess((success) async =>
        await _preferences.setString(StorageKeys.sessionToken, success.toString()));
    return res.fold((success) => unit.toSuccess(), (error) => error.toFailure());
  }

  @override
  Future<void> logout() async {
    _imageCache.removeImage(StorageKeys.studentImage);
    _imageCache.removeImage(StorageKeys.uniLogo);
    StorageKeys.keys.forEach(_preferences.remove);
  }

  @override
  bool isAuthenticated() {
    return _preferences.containsKey(StorageKeys.sessionToken);
  }

  Future<ResultDart<File, Unit>> _fetchAndCacheImage(
      String imageKey, Future<ResultDart<String, Unit>> Function() fetch) async {
    final cachedImage = _imageCache.loadCachedImage(imageKey);
    if (cachedImage.isSuccess()) return cachedImage.getOrThrow().toSuccess();

    // not in cache fetch from progres
    final imageResult = await fetch();
    if (imageResult.isError()) return unit.toFailure();

    final imgFile = await _imageCache.cacheImage(imageResult.getOrThrow(), imageKey);

    return imgFile.toSuccess();
  }

  @override
  Future<ResultDart<File, Unit>> getUserUniLogo() async =>
      _fetchAndCacheImage(StorageKeys.uniLogo, () {
        SessionToken sessionToken = _getUserSession();
        return _progressAPI.fetchUniversityLogo(
            sessionToken.token, sessionToken.etablissementId.toString());
      });

  @override
  Future<ResultDart<File, Unit>> getUserImage() =>
      _fetchAndCacheImage(StorageKeys.studentImage, () {
        SessionToken sessionToken = _getUserSession();
        return _progressAPI.fetchUserImage(sessionToken.uuid, sessionToken.token);
      });

  @override
  Future<ResultDart<Student, String>> getStudentData() async {
    if (_preferences.containsKey(StorageKeys.studentData)) {
      var thejasn = jsonDecode(_preferences.getString(StorageKeys.studentData)!);
      if (thejasn is List) thejasn = thejasn.last;
      return StudentBacInfoResponseV2Entity.fromJson(thejasn).toStudent().toSuccess();
    }

    final sessionToken = _getUserSession();
    final result = _progressAPI.fetchStudentData(sessionToken.token, sessionToken.uuid);

    return await result.fold((studentDataResponse) {
      _preferences.setString(StorageKeys.studentData, studentDataResponse.toString());
      return studentDataResponse.last.toStudent().toSuccess();
    }, (error) => error.toFailure());
  }

  @override
  Future<ResultDart<List<Group>, String>> getStudentGroups() async {
    if (_preferences.containsKey(StorageKeys.studentGroups)) {
      var thejasn = jsonDecode(_preferences.getString(StorageKeys.studentGroups)!);
      return (thejasn as List)
          .map((e) => StudentGroupEntity.fromJson(e).toGroup())
          .toList()
          .toSuccess();
    }
    final theid = await _getStudentSemesterIds();
    if (theid.isError()) return theid.exceptionOrNull()!.toFailure();

    final data = _progressAPI.fetchStudentGroups(_getUserSession().token, theid.getOrThrow().last);

    return data.fold(
      (success) {
        _preferences.setString(StorageKeys.studentGroups, success.toString());
        return success.map((e) => e.toGroup()).toList(growable: false).toSuccess();
      },
      (error) => error.toFailure(),
    );
  }

  Future<ResultDart<Iterable<String>, String>> _getStudentSemesterIds() async {
    if (!_preferences.containsKey(StorageKeys.studentData)) {
      final result = await getStudentData();
      if (result.isError()) {
        return result.exceptionOrNull()!.toFailure();
      }
    }
    var jason = jsonDecode(_preferences.getString(StorageKeys.studentData)!);
    if (jason is! List) jason = [jason];

    return (jason).map((e) => e["id"].toString()).toSuccess();
  }

  SessionToken _getUserSession() {
    assert(isAuthenticated());
    return SessionToken.fromJson(jsonDecode(_preferences.getString(StorageKeys.sessionToken)!));
  }

  @override
  Future<ResultDart<List<List<ExamNotes>>, String>> getStudentNotes() async {
    if (_preferences.containsKey(StorageKeys.studentNotes)) {
      final cachedString = _preferences.getString(StorageKeys.studentNotes)!;

      List<List<ExamNotes>>? tryParseCachedNotes(String notes) {
        try {
          final jason = jsonDecode(cachedString);
          if (jason is List<dynamic>) {
            return (jason as List<List<dynamic>>)
                .map((exams) {
                  return exams.map((exam) {
                    return StudentNotesEntity.fromJson(exam).toNotes();
                  }).toList();
                })
                .toList();
          } else {
            return null;
          }
        } catch (e) {
          return null;
        }
      }

      final parsedNotes = tryParseCachedNotes(cachedString);
      if (parsedNotes != null) return parsedNotes.toSuccess();
    }

    final theid = await _getStudentSemesterIds();
    if (theid.isError()) return theid.exceptionOrNull()!.toFailure();

    final data = await _progressAPI.fetchStudentGrades(_getUserSession().token, theid.getOrThrow());

    return data.fold<ResultDart<List<List<ExamNotes>>, String>>(
      (notes) {
        _preferences.setString(StorageKeys.studentNotes, jsonEncode(notes).toString());
        return notes
            .map<List<ExamNotes>>(
              (notesList) { return notesList.map((note) => note.toNotes()).toList();
              },
            )
            .toList()
            .toSuccess();
      },
      (error) => error.toFailure(),
    );
  }

  @override
  Future<ResultDart<List<ModuleCoefficient>, String>> getModuleCoefficients() async {
    if (_preferences.containsKey(StorageKeys.moduleCoefficients)) {
      final cachedData = _preferences.getString(StorageKeys.moduleCoefficients)!;
      final List<dynamic> jsonList = jsonDecode(cachedData);
      return jsonList
          .map((json) => CoefficientEntity.fromJson(json).toModuleCoefficient())
          .toList()
          .toSuccess();
    }

    if (!_preferences.containsKey(StorageKeys.studentData)) {
      final result = await getStudentData();
      if (result.isError()) {
        return result.exceptionOrNull()!.toFailure();
      }
    }

    final studentData = jsonDecode(_preferences.getString(StorageKeys.studentData)!);
    final data = studentData is List ? studentData.last : studentData;
    
    final formationId = data['ouvertureOffreFormationId'];
    final niveauId = data['niveauId'];
    
    final sessionToken = _getUserSession();
    final result = await _progressAPI.fetchModuleCoefficients(
      sessionToken.token,
      formationId,
      niveauId,
    );

    return result.fold(
      (success) {
        _preferences.setString(StorageKeys.moduleCoefficients, jsonEncode(success));
        return success.map((e) => e.toModuleCoefficient()).toList().toSuccess();
      },
      (error) => error.toFailure(),
    );
  }
}
