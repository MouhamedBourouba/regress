import 'dart:convert';

import 'package:regress/domain/models/group.dart';
import 'package:regress/generated/json/base/json_field.dart';
import 'package:regress/generated/json/student_group_entity.g.dart';

export 'package:regress/generated/json/student_group_entity.g.dart';

@JsonSerializable()
class StudentGroupEntity {
  late int id = 0;
  late String nomGroupePedagogique = '';
  late String nomSection = '';
  late int periodeId = 0;
  late String periodeLibelleLongLt = '';

  StudentGroupEntity();

  factory StudentGroupEntity.fromJson(Map<String, dynamic> json) =>
      $StudentGroupEntityFromJson(json);

  Map<String, dynamic> toJson() => $StudentGroupEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }

  Group toGroup() => Group(
        number: nomGroupePedagogique,
        section: nomSection,
        period: periodeLibelleLongLt,
      );
}
