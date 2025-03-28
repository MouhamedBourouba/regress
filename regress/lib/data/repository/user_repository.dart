import 'dart:convert';
import 'dart:io';

import 'package:regress/data/constants.dart';
import 'package:regress/data/models/bac_data_response_entity.dart';
import 'package:regress/data/sources/progress_api.dart';
import 'package:regress/domain/models/session_token.dart';
import 'package:regress/domain/models/student.dart';
import 'package:regress/domain/repository/auth_repository.dart';
import 'package:regress/domain/repository/user_data_repository.dart';
import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../sources/local_image_cache.dart';

class UserRepositoryImpl implements UserRepository {
  final ProgressAPI _progressAPI;
  final AuthRepository _authRepository;
  final Base64LocalImageCache _imageCache;
  final SharedPreferences _preferences;

  UserRepositoryImpl(this._progressAPI, this._imageCache, this._authRepository, this._preferences);

  Future<ResultDart<File, Unit>> _fetchAndCacheImage(
    String imageKey,
    Future<ResultDart<String, Unit>> Function() fetch,
  ) async {
    final cachedImage = _imageCache.loadCachedImage(imageKey);
    if (cachedImage.isSuccess()) return cachedImage.getOrThrow().toSuccess();

    // not in cache fetch from progres
    final imageResult = await fetch();
    if (imageResult.isError()) return unit.toFailure();

    final imgFile = await _imageCache.cacheImage(
      imageResult.getOrThrow(),
      imageKey,
    );

    return imgFile.toSuccess();
  }

  @override
  Future<ResultDart<File, Unit>> getUserUniLogo() async => _fetchAndCacheImage(
        StorageKeys.uniLogo,
        () {
          SessionToken sessionToken = _authRepository.getUserSession();
          return _progressAPI.fetchUniversityLogo(
            sessionToken.token,
            sessionToken.etablissementId.toString(),
          );
        },
      );

  @override
  Future<ResultDart<File, Unit>> getUserImage() => _fetchAndCacheImage(
        StorageKeys.studentImage,
        () {
          SessionToken sessionToken = _authRepository.getUserSession();
          return _progressAPI.fetchUserImage(sessionToken.uuid, sessionToken.token);
        },
      );

  @override
  Future<ResultDart<Student, String>> getStudentData() async {
    if (_preferences.containsKey(StorageKeys.studentData)) {
      return BacDataResponseEntity.fromJson(
        jsonDecode(_preferences.getString(StorageKeys.studentData)!),
      ).toStudent().toSuccess();
    }

    final sessionToken = _authRepository.getUserSession();
    final result = _progressAPI.fetchStudentData(sessionToken.token, sessionToken.uuid);

    return result.fold(
      (studentDataResponse) {
        _preferences.setString(StorageKeys.studentData, studentDataResponse.toString());
        return studentDataResponse.last.toStudent().toSuccess();
      },
      (error) => error.toFailure(),
    );
  }
}
