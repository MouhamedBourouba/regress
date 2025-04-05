import 'package:regress/generated/json/base/json_convert_content.dart';
import 'package:regress/data/models/groups_response_entity.dart';

GroupsResponseEntity $GroupsResponseEntityFromJson(Map<String, dynamic> json) {
  final GroupsResponseEntity groupsResponseEntity = GroupsResponseEntity();
  final double? id = jsonConvert.convert<double>(json['id']);
  if (id != null) {
    groupsResponseEntity.id = id;
  }
  final String? nomGroupePedagogique = jsonConvert.convert<String>(json['nomGroupePedagogique']);
  if (nomGroupePedagogique != null) {
    groupsResponseEntity.nomGroupePedagogique = nomGroupePedagogique;
  }
  final String? nomSection = jsonConvert.convert<String>(json['nomSection']);
  if (nomSection != null) {
    groupsResponseEntity.nomSection = nomSection;
  }
  final double? periodeId = jsonConvert.convert<double>(json['periodeId']);
  if (periodeId != null) {
    groupsResponseEntity.periodeId = periodeId;
  }
  final String? periodeLibelleLongLt = jsonConvert.convert<String>(json['periodeLibelleLongLt']);
  if (periodeLibelleLongLt != null) {
    groupsResponseEntity.periodeLibelleLongLt = periodeLibelleLongLt;
  }
  return groupsResponseEntity;
}

Map<String, dynamic> $GroupsResponseEntityToJson(GroupsResponseEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['id'] = entity.id;
  data['nomGroupePedagogique'] = entity.nomGroupePedagogique;
  data['nomSection'] = entity.nomSection;
  data['periodeId'] = entity.periodeId;
  data['periodeLibelleLongLt'] = entity.periodeLibelleLongLt;
  return data;
}

extension GroupsResponseEntityExtension on GroupsResponseEntity {
  GroupsResponseEntity copyWith({
    double? id,
    String? nomGroupePedagogique,
    String? nomSection,
    double? periodeId,
    String? periodeLibelleLongLt,
  }) {
    return GroupsResponseEntity()
      ..id = id ?? this.id
      ..nomGroupePedagogique = nomGroupePedagogique ?? this.nomGroupePedagogique
      ..nomSection = nomSection ?? this.nomSection
      ..periodeId = periodeId ?? this.periodeId
      ..periodeLibelleLongLt = periodeLibelleLongLt ?? this.periodeLibelleLongLt;
  }
}
