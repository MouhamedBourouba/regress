import 'dart:convert';

import 'package:regress/generated/json/auth_response_entity.g.dart';
import 'package:regress/generated/json/base/json_field.dart';

export 'package:regress/generated/json/auth_response_entity.g.dart';

@JsonSerializable()
class UserIds {
  late String expirationDate;
  late String token;
  late int userId;
  late String uuid;
  late int idIndividu;
  late int etablissementId;
  late String userName;

  UserIds();

  factory UserIds.fromJson(Map<String, dynamic> json) =>
      $AuthResponseEntityFromJson(json);

  Map<String, dynamic> toJson() => $AuthResponseEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
