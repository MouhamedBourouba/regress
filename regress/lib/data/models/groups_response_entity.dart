import 'package:regress/generated/json/base/json_field.dart';
import 'package:regress/generated/json/groups_response_entity.g.dart';
import 'dart:convert';
export 'package:regress/generated/json/groups_response_entity.g.dart';

@JsonSerializable()
class GroupsResponseEntity {
	late double id;
	late String nomGroupePedagogique;
	late String nomSection;
	late double periodeId;
	late String periodeLibelleLongLt;

	GroupsResponseEntity();

	factory GroupsResponseEntity.fromJson(Map<String, dynamic> json) => $GroupsResponseEntityFromJson(json);

	Map<String, dynamic> toJson() => $GroupsResponseEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}