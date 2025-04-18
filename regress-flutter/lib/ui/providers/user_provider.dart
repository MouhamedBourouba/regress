import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:regress/domain/models/exam_notes.dart';
import 'package:regress/domain/models/group.dart';
import 'package:regress/domain/models/module_coefficient.dart';
import 'package:regress/domain/models/student.dart';
import 'package:regress/domain/repository/user_data_repository.dart';
import 'package:result_dart/result_dart.dart';

class UserProvider extends ChangeNotifier {
  final StudentRepository _userRepository;

  UserProvider(this._userRepository);

  bool _loading = true;
  bool _loggedOut = false;
  String? _error;
  Student? _student;
  List<Group>? _studentGroups;
  File? _studentImage;
  File? _universityLogo;
  List<List<ExamNotes>>? _studentNotes;
  List<ModuleCoefficient>? _moduleCoefficients;

  bool get loading => _loading;

  bool get loggedOut => _loggedOut;

  String? get error => _error;

  File? get studentImage => _studentImage;

  File? get universityLogo => _universityLogo;

  Student? get student => _student;

  List<Group>? get studentGroups => _studentGroups;

  List<List<ExamNotes>>? get studentNotes => _studentNotes?.reversed.toList();

  List<ModuleCoefficient>? get moduleCoefficients => _moduleCoefficients;

  Future<void> loadData() async {
    final studentData = _userRepository.getStudentData();
    final userImage = _userRepository.getUserImage();
    final studentGroups = _userRepository.getStudentGroups();
    final uniLogo = _userRepository.getUserUniLogo();
    final studentNotes = _userRepository.getStudentNotes();
    final moduleCoefficients = _userRepository.getModuleCoefficients();

    await userImage;
    await uniLogo;
    await studentData;
    await studentGroups;
    await studentNotes;
    await moduleCoefficients;

    userImage.onSuccess(
      (success) => _studentImage = success,
    );

    uniLogo.onSuccess(
      (success) => _universityLogo = success,
    );

    studentData.fold(
      (success) => _student = success,
      (error) => _error = error,
    );

    studentGroups.fold(
      (success) => _studentGroups = success,
      (error) => _error = error,
    );

    studentNotes.fold(
      (success) => _studentNotes = success,
      (error) => _error = error,
    );

    moduleCoefficients.fold(
      (success) => _moduleCoefficients = success,
      (error) => _error = error,
    );

    _loading = false;
    notifyListeners();
  }

  Future<void> logout() async {
    await _userRepository.logout();
    _loggedOut = true;
    notifyListeners();
  }
}
