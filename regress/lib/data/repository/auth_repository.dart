import 'dart:convert';

import 'package:regress/data/constants.dart';
import 'package:regress/data/models/auth_request_entity.dart';
import 'package:regress/data/models/student_ids_entity.dart';
import 'package:regress/data/sources/progress_api.dart';
import 'package:regress/domain/repository/auth_repository.dart';
import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ProgressAPI _progressAPI;
  final SharedPreferences _sp;

  AuthRepositoryImpl(this._progressAPI, this._sp);

  @override
  Future<ResultDart<void, String>> login(
    String registrationNumber,
    String password,
  ) async {
    AuthRequestEntity req = AuthRequestEntity();
    req.username = registrationNumber;
    req.password = password;
    final res = _progressAPI.login(req);

    res.onSuccess(
      (success) {
        _sp.setString(Constants.USER_IDS_KEY, success.toString());
      },
    );

    return res;
  }

  @override
  Future<void> logout() async {
    await _sp.remove(Constants.USER_IDS_KEY);
  }

  @override
  bool isAuthenticated() {
    return _sp.containsKey(Constants.USER_IDS_KEY);
  }

  @override
  StudentIdsEntity getUserIds() {
    assert(isAuthenticated());
    return StudentIdsEntity.fromJson(jsonDecode(_sp.getString(Constants.USER_IDS_KEY)!));
  }
}
