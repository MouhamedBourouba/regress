import 'dart:io';
import 'package:result_dart/result_dart.dart';

abstract class UserRepository {
  Future<ResultDart<File, Unit>> getUserImage();
  Future<ResultDart<File, Unit>> getUserUniLogo();
}