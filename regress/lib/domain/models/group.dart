import 'dart:convert';

class Group {
  final String number;
  final String section;

  Group({required this.number, required this.section});

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'section': section,
    };
  }

  factory Group.fromJson(Map<String, dynamic> map) {
    return Group(
      number: map['number'],
      section: map['section'],
    );
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
