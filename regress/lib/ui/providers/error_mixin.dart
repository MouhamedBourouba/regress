mixin ErrorProviderMixin {
  String? _errorMessage;
  bool _hasShownError = false;

  String? get errorMessage => _errorMessage;

  bool get hasShownError => _hasShownError;

  errorShown() => _hasShownError = true;

  setError(String error) {
    _hasShownError = false;
    _errorMessage = error;
  }
}
