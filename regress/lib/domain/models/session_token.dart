import 'package:regress/generated/json/base/json_field.dart';
import 'package:regress/generated/json/auth_response_entity.g.dart';
import 'dart:convert';
export 'package:regress/generated/json/auth_response_entity.g.dart';

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

	factory SessionToken.fromJson(Map<String, dynamic> json) => $AuthResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $AuthResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}