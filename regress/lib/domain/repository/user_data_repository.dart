import 'dart:io';

import 'package:regress/domain/models/exam_notes.dart';
import 'package:regress/domain/models/group.dart';
import 'package:regress/domain/models/student.dart';
import 'package:result_dart/result_dart.dart';

abstract class StudentRepository {
  Future<ResultDart<Unit, String>> login(String registrationNumber, String password);

  Future<void> logout();

  bool isAuthenticated();

  Future<ResultDart<Student, String>> getStudentData();
  
  Future<List<ResultDart<List<ExamNotes>, String>>> getStudentNotes();

  Future<ResultDart<File, Unit>> getUserImage();

  Future<ResultDart<File, Unit>> getUserUniLogo();
  
  Future<ResultDart<List<Group>, String>> getStudentGroups();
}
