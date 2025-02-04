import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:regress/domain/repository/user_data_repository.dart';

class UserProvider extends ChangeNotifier {
  final UserRepository _userRepository;

  UserProvider(this._userRepository);

  File? _userImage;
  File? _universityLogo;

  File? get userImage => _userImage;

  File? get universityLogo => _universityLogo;

  void loadData() async {
    final userImage = await _userRepository.getUserImage();
    userImage.onSuccess(
      (success) {
        _userImage = success;
      },
    );

    final uniLogo = await _userRepository.getUserUniLogo();
    uniLogo.onSuccess(
      (success) {
        _universityLogo = success;
      },
    );

    notifyListeners();
  }

  void getUniLogo() {}
}
