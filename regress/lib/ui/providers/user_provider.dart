import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:regress/domain/models/group.dart';
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

  bool get loading => _loading;

  bool get loggedOut => _loggedOut;

  String? get error => _error;

  File? get studentImage => _studentImage;

  File? get universityLogo => _universityLogo;

  Student? get student => _student;

  List<Group>? get studentGroups => _studentGroups;

  Future<void> loadData() async {
    final studentData = _userRepository.getStudentData();
    final userImage = _userRepository.getUserImage();
    final studentGroups = _userRepository.getStudentGroups();
    final uniLogo = _userRepository.getUserUniLogo();

    await userImage;
    await uniLogo;
    await studentData;
    await studentGroups;

    studentData.fold(
      (success) => _student = success,
      (failure) => _error = failure,
    );

    studentGroups.fold(
      (success) => _studentGroups = success,
      (failure) => _error = failure
    );

    userImage.onSuccess(
      (success) {
        _studentImage = success;
      },
    );

    uniLogo.onSuccess(
      (success) {
        _universityLogo = success;
      },
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
