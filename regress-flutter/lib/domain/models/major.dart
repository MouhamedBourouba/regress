import 'dart:convert';

class Major {
  final String domain;
  final String sector;
  final String level;

  Major({
    required this.domain,
    required this.sector,
    required this.level,
  });

  // Convert Major object to Map
  Map<String, dynamic> toJson() {
    return {
      'domain': domain,
      'sector': sector,
      'level': level,
    };
  }

  // Create Major object from Map
  factory Major.fromJson(Map<String, dynamic> map) {
    return Major(
      domain: map['domain'],
      sector: map['sector'],
      level: map['level'],
    );
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
