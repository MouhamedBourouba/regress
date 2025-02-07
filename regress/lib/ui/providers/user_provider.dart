import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:regress/domain/models/Student.dart';
import 'package:regress/domain/repository/user_data_repository.dart';
import 'package:regress/ui/providers/error_mixin.dart';
import 'package:result_dart/result_dart.dart';

class UserProvider extends ChangeNotifier with ErrorProviderMixin {
  final UserRepository _userRepository;

  UserProvider(this._userRepository);

  bool _loading = false;
  Student? _student;
  File? _userImage;
  File? _universityLogo;

  bool get loading => _loading;

  File? get userImage => _userImage;

  File? get universityLogo => _universityLogo;

  Student? get student => _student;

  void loadData() async {
    _loading = true;
    notifyListeners();

    final studentData = _userRepository.getStudentData();
    final userImage = _userRepository.getUserImage();
    final uniLogo = _userRepository.getUserUniLogo();

    await userImage;
    await uniLogo;
    await studentData;

    studentData.fold(
      (success) => _student = success,
      (failure) => setError(failure),
    );

    userImage.onSuccess(
      (success) {
        _userImage = success;
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
}
