import 'dart:convert';
import 'dart:io';

import 'package:regress/data/constants.dart';
import 'package:regress/data/models/student_data_entity.dart';
import 'package:regress/data/models/student_ids_entity.dart';
import 'package:regress/data/sources/progress_api.dart';
import 'package:regress/domain/models/Student.dart';
import 'package:regress/domain/repository/auth_repository.dart';
import 'package:regress/domain/repository/user_data_repository.dart';
import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../sources/local_image_cache.dart';

class UserRepositoryImpl implements UserRepository {
  final ProgressAPI _progressAPI;
  final AuthRepository _authRepository;
  final SharedPreferences _sp;
  final Base64LocalImageCache _imageCache;

  UserRepositoryImpl(this._progressAPI, this._sp, this._authRepository, this._imageCache);

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
        Constants.UNI_LOGO_KEY,
        () {
          StudentIdsEntity userIds = _authRepository.getUserIds();
          return _progressAPI.fetchUniversityLogo(
            userIds.token,
            userIds.etablissementId.toString(),
          );
        },
      );

  @override
  Future<ResultDart<File, Unit>> getUserImage() => _fetchAndCacheImage(
        Constants.STUDENT_IMAGE_KEY,
        () {
          StudentIdsEntity userIds = _authRepository.getUserIds();
          return _progressAPI.fetchUserImage(userIds.uuid, userIds.token);
        },
      );

  @override
  Future<ResultDart<Student, String>> getStudentData() async {
    if (_sp.containsKey(Constants.STUDENT_DATA_KEY)) {
      return Student.fromEntity(
        StudentDataEntity.fromJson(
          jsonDecode(_sp.getString(Constants.STUDENT_DATA_KEY)!),
        ),
      ).toSuccess();
    }

    final studentIds = _authRepository.getUserIds();
    final result = _progressAPI.getStudentData(studentIds.token, studentIds.uuid);

    return result.fold(
      (success) {
        _sp.setString(Constants.STUDENT_DATA_KEY, success.toString());
        return Student.fromEntity(success).toSuccess();
      },
      (error) => error.toFailure(),
    );
  }
}
