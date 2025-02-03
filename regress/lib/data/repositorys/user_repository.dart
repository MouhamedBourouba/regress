import 'dart:convert';
import 'dart:io';

import 'package:regress/data/constants.dart';
import 'package:regress/data/sources/progress_api.dart';
import 'package:regress/domain/repository/auth_repository.dart';
import 'package:regress/domain/repository/user_data_repository.dart';
import 'package:regress/utils/utils.dart';
import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepositoryImpl implements UserRepository {
  final ProgressAPI _progressAPI;
  final AuthRepository _authRepository;
  final SharedPreferences _sp;

  UserRepositoryImpl(this._progressAPI, this._sp, this._authRepository);

  @override
  Future<ResultDart<File, String>> getUserImage() async {
    if (_sp.containsKey(Constants.USER_IMAGE_PATH_KEY)) {
      return File(_sp.getString(Constants.USER_IMAGE_PATH_KEY)!).toSuccess();
    } else {
      final userIds = _authRepository.getUserIds();
      final base64EncodedImage = _progressAPI.getUserImage(userIds.uuid, userIds.token);

      final res = await base64EncodedImage.fold<Future<ResultDart<File, String>>>(
        (success) async {
          final imageData = base64Decode(success);
          final image = await saveImage(imageData, Constants.DEFAULT_USER_IMAGE_FILENAME);
          _sp.setString(Constants.USER_IMAGE_PATH_KEY, image.path);
          return image.toSuccess();
        },
        (error) async {
          return error.toFailure();
        },
      );
      return res;
    }
  }
}
