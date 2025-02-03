import 'package:regress/data/models/auth_request_entity.dart';
import 'package:regress/data/sources/progress_api.dart';
import 'package:regress/domain/repository/auth_repository.dart';
import 'package:result_dart/result_dart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final ProgressAPI progressAPI;

  AuthRepositoryImpl(this.progressAPI);

  @override
  Future<ResultDart<void, String>> login(
    String registrationNumber,
    String password,
  ) async {
    AuthRequestEntity req = AuthRequestEntity();
    req.username = registrationNumber;
    req.password = password;
    final res = progressAPI.login(req);

    res.onSuccess(
      (success) {
        // TODO: cache token
      },
    );

    return res;
  }

  @override
  Future<void> logout() async {}
}
