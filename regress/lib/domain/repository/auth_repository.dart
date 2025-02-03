import 'package:regress/data/models/user_ids.dart';
import 'package:result_dart/result_dart.dart';

abstract class AuthRepository {
  Future<ResultDart<void, String>> login(String registrationNumber, String password);

  Future<void> logout();

  bool isAuthenticated();

  UserIds getUserIds();
}
