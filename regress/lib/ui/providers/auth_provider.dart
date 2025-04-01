import 'package:flutter/widgets.dart';
import 'package:regress/domain/repository/user_data_repository.dart';
import 'package:regress/ui/providers/error_mixin.dart';
import 'package:regress/utils/utils.dart';

class AuthProvider extends ChangeNotifier with ErrorProviderMixin {
  StudentRepository userRepository;

  AuthProvider(this.userRepository);

  bool _isAuthenticated = false;
  bool _loading = false;
  bool _visibility = false;
  String _password = "";
  String _registrationNumber = "";
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool get isAuthenticated => _isAuthenticated;

  bool get visibility => _visibility;

  bool get loading => _loading;

  String get password => _password;

  String get registrationNumber => _registrationNumber;

  GlobalKey<FormState> get formKey => _formKey;

  void _login() async {
    if (_registrationNumber.isEmpty || _password.isEmpty) {
      return;
    }

    _loading = true;
    notifyListeners();

    final result = await userRepository.login(registrationNumber, password);

    result.fold(
      (success) => _isAuthenticated = true,
      (failure) => setError(failure),
    );

    _loading = false;
    notifyListeners();
  }

  String? validateRegistrationNumber(String? value) {
    if (value == null) return null;

    if (value.isNotEmpty && value.length < 5) {
      return 'registration number too short';
    } else if (!isNumeric(value)) {
      return 'registration number cant have characters';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if ((value?.isNotEmpty ?? false) && (value?.length ?? 0) < 4) {
      return 'Password is too short';
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
    return isNumeric(_registrationNumber) &&
            _password.length >= 4 &&
            _registrationNumber.length >= 5
        ? _login
        : null;
  }

  void onVisibilityClicked() {
    _visibility = !_visibility;
    notifyListeners();
  }

  void logout() async {
    await userRepository.logout();
    _isAuthenticated = false;
    notifyListeners();
  }

  bool checkAuthentication() {
    return userRepository.isAuthenticated();
  }
}
