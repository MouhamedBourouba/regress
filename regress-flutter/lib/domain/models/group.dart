import 'dart:convert';

class Group {
  final String number;
  final String section;
  final String period;

  Group({required this.number, required this.section, required this.period});

  Map<String, dynamic> toJson() {
    return {'number': number, 'section': section, 'period': period};
  }

  factory Group.fromJson(Map<String, dynamic> map) {
    return Group(
      number: map['number'],
      section: map['section'],
      period: map['period'],
    );
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
