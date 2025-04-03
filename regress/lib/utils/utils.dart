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

extension IntToOrdinal on int {
  String toOrdinal() {
    if (this <= 0) {
      return '$this';
    }

    switch (this) {
      case 1:
        return 'First';
      case 2:
        return 'Second';
      case 3:
        return 'Third';
      case 4:
        return 'Fourth';
      case 5:
        return 'Fifth';
      case 6:
        return 'Sixth';
      case 7:
        return 'Seventh';
      case 8:
        return 'Eighth';
      case 9:
        return 'Ninth';
      case 10:
        return 'Tenth';
      default:
        return '${this}th'; // For numbers beyond 10, use 'th' suffix
    }
  }
}