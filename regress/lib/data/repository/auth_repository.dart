import 'dart:convert';

import 'package:regress/data/constants.dart';
import 'package:regress/data/sources/progress_api.dart';
import 'package:regress/domain/models/session_token.dart';
import 'package:regress/domain/repository/auth_repository.dart';
import 'package:result_dart/result_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ProgressAPI _progressAPI;
  final SharedPreferences _sp;

  AuthRepositoryImpl(this._progressAPI, this._sp);

  @override
  Future<ResultDart<SessionToken, String>> login(
    String registrationNumber,
    String password,
  ) async {
    final res = _progressAPI.login(registrationNumber, password);
    res.onSuccess(
      (success) => _sp.setString(StorageKeys.sessionToken, success.toString()),
    );

    return res;
  }

  @override
  Future<void> logout() async {
    StorageKeys.keys.forEach(_sp.remove);
  }

  @override
  bool isAuthenticated() {
    return _sp.containsKey(StorageKeys.sessionToken);
  }

  @override
  SessionToken getUserSession() {
    assert(isAuthenticated());
    return SessionToken.fromJson(jsonDecode(_sp.getString(StorageKeys.sessionToken)!));
  }
}
