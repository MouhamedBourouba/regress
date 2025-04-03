mixin ErrorProviderMixin {
  String? _errorMessage;
  bool _hasShownError = false;

  String? get errorMessage => _errorMessage;

  bool get isError => _hasShownError;

  setErrorShown() => _hasShownError = true;

  setError(String error) {
    _hasShownError = false;
    _errorMessage = error;
  }
}
