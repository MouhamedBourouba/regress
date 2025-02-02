import 'package:regress/generated/json/base/json_field.dart';
import 'package:regress/generated/json/auth_request_entity.g.dart';
import 'dart:convert';
export 'package:regress/generated/json/auth_request_entity.g.dart';

@JsonSerializable()
class AuthRequestEntity {
	late String username;
	late String password;

	AuthRequestEntity();

	factory AuthRequestEntity.fromJson(Map<String, dynamic> json) => $AuthRequestEntityFromJson(json);

	Map<String, dynamic> toJson() => $AuthRequestEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}