import 'dart:convert';

class Major {
  final String domain;
  final String sector;
  final String level;
  final String levelId;

  Major({
    required this.domain,
    required this.sector,
    required this.level,
    required this.levelId,
  });

  // Convert Major object to Map
  Map<String, dynamic> toJson() {
    return {
      'domain': domain,
      'sector': sector,
      'level': level,
      'levelId': levelId,
    };
  }

  // Create Major object from Map
  factory Major.fromJson(Map<String, dynamic> map) {
    return Major(
      domain: map['domain'],
      sector: map['sector'],
      level: map['level'],
      levelId: map['levelId'],
    );
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
