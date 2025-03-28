import 'package:regress/domain/models/session_token.dart';
import 'package:result_dart/result_dart.dart';

abstract class AuthRepository {
  Future<ResultDart<SessionToken, String>> login(String registrationNumber, String password);

  Future<void> logout();

  bool isAuthenticated();
  SessionToken getUserSession();
}
