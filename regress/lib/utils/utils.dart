bool isNumeric(String value) {
  final start = "0".runes.first;
  final end = "9".runes.first;

  return !value.runes.any((char) => char < start || char > end);
}

extension GlobalExtentions on Object? {
  String toStringOr([String defaultValue = ""]) {
    if(this == null) return defaultValue;
    return toString();
  }
}