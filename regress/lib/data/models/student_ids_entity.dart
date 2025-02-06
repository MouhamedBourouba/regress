import 'package:regress/generated/json/base/json_field.dart';
import 'package:regress/generated/json/student_ids_entity.g.dart';
import 'dart:convert';
export 'package:regress/generated/json/student_ids_entity.g.dart';

@JsonSerializable()
class StudentIdsEntity {
	late String expirationDate;
	late String token;
	late int userId;
	late String uuid;
	late int idIndividu;
	late int etablissementId;
	late String userName;

	StudentIdsEntity();

	factory StudentIdsEntity.fromJson(Map<String, dynamic> json) => $StudentIdsEntityFromJson(json);

	Map<String, dynamic> toJson() => $StudentIdsEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}