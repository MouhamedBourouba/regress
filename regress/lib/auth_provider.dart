import 'package:flutter/widgets.dart';
import 'package:regress/progress_api.dart';

import 'models/auth_request_entity.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  String? _errorMessage;
  bool _hasShownError = false;
  bool _loading = false;
  String _password = "";
  String _registrationNumber = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool get isAuthenticated => _isAuthenticated;

  String? get errorMessage => _errorMessage;

  bool get hasShownError => _hasShownError;

  bool get loading => _loading;

  String get password => _password;

  String get registrationNumber => _registrationNumber;

  GlobalKey<FormState> get formKey => _formKey;

  void errorShown() {
    _hasShownError = true;
  }

  void _login() async {
    if (_registrationNumber.isEmpty || _password.isEmpty) {
      return;
    }

    _loading = true;
    notifyListeners();

    final result = await ProgressAPI.authenticate(
      AuthRequestEntity.make(_registrationNumber, _password),
    );

    result.fold(
      (success) {
        _isAuthenticated = true;
      },
      (failure) {
        _isAuthenticated = false;
        _hasShownError = false;
        _errorMessage = failure;
      },
    );

    _loading = false;
    notifyListeners();
  }

  String? validate(String? value) {
    if ((value?.isNotEmpty ?? false) && (value?.length ?? 0) < 5) {
      return 'Please enter your registration number';
    }
    return null;
  }

  void onRegistrationNumberChanged(String value) {
    _registrationNumber = value;
    formKey.currentState?.validate();
    notifyListeners();
  }

  void onPasswordChanged(String value) {
    _password = value;
    formKey.currentState?.validate();
    notifyListeners();
  }

  VoidCallback? onButtonClick() {
    return _password.length >= 5 && _registrationNumber.length >= 5 ? _login : null;
  }

  void logout() {
    _isAuthenticated = false;
    _errorMessage = null;
    notifyListeners();
  }
}
