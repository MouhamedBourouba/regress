import 'dart:io';

import 'package:regress/domain/models/student.dart';
import 'package:result_dart/result_dart.dart';

abstract class UserRepository {
  Future<ResultDart<Student, String>> getStudentData();

  Future<ResultDart<File, Unit>> getUserImage();

  Future<ResultDart<File, Unit>> getUserUniLogo();
}
