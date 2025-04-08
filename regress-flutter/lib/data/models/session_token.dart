import 'dart:convert';

import 'package:regress/generated/json/base/json_field.dart';
import 'package:regress/generated/json/session_token.g.dart';

@JsonSerializable()
class SessionToken {
  late String expirationDate = '';
  late String token = '';
  late int userId = 0;
  late String uuid = '';
  late int idIndividu = 0;
  late int etablissementId = 0;
  late String userName = '';

  SessionToken();

  factory SessionToken.fromJson(Map<String, dynamic> json) => $SessionTokenFromJson(json);

  Map<String, dynamic> toJson() => $SessionTokenToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
