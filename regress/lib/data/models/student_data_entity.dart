import 'package:regress/generated/json/base/json_field.dart';
import 'package:regress/generated/json/student_data_entity.g.dart';
import 'dart:convert';
export 'package:regress/generated/json/student_data_entity.g.dart';

@JsonSerializable()
class StudentDataEntity {
	late int id;
	late String dateNaissance;
	late String nomArabe;
	late String nomLatin;
	late String prenomArabe;
	late String prenomLatin;
	late String lieuNaissance;
	late String lieuNaissanceArabe;

	StudentDataEntity();

	factory StudentDataEntity.fromJson(Map<String, dynamic> json) => $StudentDataEntityFromJson(json);

	Map<String, dynamic> toJson() => $StudentDataEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}
