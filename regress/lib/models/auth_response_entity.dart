import 'package:regress/generated/json/base/json_field.dart';
import 'package:regress/generated/json/auth_response_entity.g.dart';
import 'dart:convert';
export 'package:regress/generated/json/auth_response_entity.g.dart';

@JsonSerializable()
class AuthResponseEntity {
	late String expirationDate;
	late String token;
	late int userId;
	late String uuid;
	late int idIndividu;
	late int etablissementId;
	late String userName;

	AuthResponseEntity();

	factory AuthResponseEntity.fromJson(Map<String, dynamic> json) => $AuthResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $AuthResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}