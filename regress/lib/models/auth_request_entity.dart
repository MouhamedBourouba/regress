import 'dart:convert';

import 'package:regress/generated/json/auth_request_entity.g.dart';
import 'package:regress/generated/json/base/json_field.dart';

export 'package:regress/generated/json/auth_request_entity.g.dart';

@JsonSerializable()
class AuthRequestEntity {
  late String username;
  late String password;

  AuthRequestEntity();

  factory AuthRequestEntity.make(String username, String password) {
    var authRequestEntity = AuthRequestEntity();
    authRequestEntity.username = username;
    authRequestEntity.password = password;
    return  authRequestEntity;
  }

  factory AuthRequestEntity.fromJson(Map<String, dynamic> json) => $AuthRequestEntityFromJson(json);

  Map<String, dynamic> toJson() => $AuthRequestEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
