import 'package:regress/generated/json/base/json_convert_content.dart';
import 'package:regress/models/auth_request_entity.dart';

AuthRequestEntity $AuthRequestEntityFromJson(Map<String, dynamic> json) {
  final AuthRequestEntity authRequestEntity = AuthRequestEntity();
  final String? username = jsonConvert.convert<String>(json['username']);
  if (username != null) {
    authRequestEntity.username = username;
  }
  final String? password = jsonConvert.convert<String>(json['password']);
  if (password != null) {
    authRequestEntity.password = password;
  }
  return authRequestEntity;
}

Map<String, dynamic> $AuthRequestEntityToJson(AuthRequestEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['username'] = entity.username;
  data['password'] = entity.password;
  return data;
}

extension AuthRequestEntityExtension on AuthRequestEntity {
  AuthRequestEntity copyWith({
    String? username,
    String? password,
  }) {
    return AuthRequestEntity()
      ..username = username ?? this.username
      ..password = password ?? this.password;
  }
}