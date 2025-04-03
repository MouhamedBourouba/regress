import 'package:regress/generated/json/base/json_convert_content.dart';
import 'package:regress/data/models/student_group_entity.dart';

StudentGroupEntity $StudentGroupEntityFromJson(Map<String, dynamic> json) {
  final StudentGroupEntity studentGroupEntity = StudentGroupEntity();
  final int? id = jsonConvert.convert<int>(json['id']);
  if (id != null) {
    studentGroupEntity.id = id;
  }
  final String? nomGroupePedagogique = jsonConvert.convert<String>(json['nomGroupePedagogique']);
  if (nomGroupePedagogique != null) {
    studentGroupEntity.nomGroupePedagogique = nomGroupePedagogique;
  }
  final String? nomSection = jsonConvert.convert<String>(json['nomSection']);
  if (nomSection != null) {
    studentGroupEntity.nomSection = nomSection;
  }
  final int? periodeId = jsonConvert.convert<int>(json['periodeId']);
  if (periodeId != null) {
    studentGroupEntity.periodeId = periodeId;
  }
  final String? periodeLibelleLongLt = jsonConvert.convert<String>(json['periodeLibelleLongLt']);
  if (periodeLibelleLongLt != null) {
    studentGroupEntity.periodeLibelleLongLt = periodeLibelleLongLt;
  }
  return studentGroupEntity;
}

Map<String, dynamic> $StudentGroupEntityToJson(StudentGroupEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['nomGroupePedagogique'] = entity.nomGroupePedagogique;
  data['nomSection'] = entity.nomSection;
  data['periodeId'] = entity.periodeId;
  data['periodeLibelleLongLt'] = entity.periodeLibelleLongLt;
  return data;
}

extension StudentGroupEntityExtension on StudentGroupEntity {
  StudentGroupEntity copyWith({
    int? id,
    String? nomGroupePedagogique,
    String? nomSection,
    int? periodeId,
    String? periodeLibelleLongLt,
  }) {
    return StudentGroupEntity()
      ..id = id ?? this.id
      ..nomGroupePedagogique = nomGroupePedagogique ?? this.nomGroupePedagogique
      ..nomSection = nomSection ?? this.nomSection
      ..periodeId = periodeId ?? this.periodeId
      ..periodeLibelleLongLt = periodeLibelleLongLt ?? this.periodeLibelleLongLt;
  }
}