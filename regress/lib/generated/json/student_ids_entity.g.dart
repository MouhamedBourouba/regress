import 'package:regress/generated/json/base/json_convert_content.dart';
import 'package:regress/data/models/student_ids_entity.dart';

StudentIdsEntity $StudentIdsEntityFromJson(Map<String, dynamic> json) {
  final StudentIdsEntity studentIdsEntity = StudentIdsEntity();
  final String? expirationDate = jsonConvert.convert<String>(json['expirationDate']);
  if (expirationDate != null) {
    studentIdsEntity.expirationDate = expirationDate;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    studentIdsEntity.token = token;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    studentIdsEntity.userId = userId;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    studentIdsEntity.uuid = uuid;
  }
  final int? idIndividu = jsonConvert.convert<int>(json['idIndividu']);
  if (idIndividu != null) {
    studentIdsEntity.idIndividu = idIndividu;
  }
  final int? etablissementId = jsonConvert.convert<int>(json['etablissementId']);
  if (etablissementId != null) {
    studentIdsEntity.etablissementId = etablissementId;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    studentIdsEntity.userName = userName;
  }
  return studentIdsEntity;
}

Map<String, dynamic> $StudentIdsEntityToJson(StudentIdsEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['expirationDate'] = entity.expirationDate;
  data['token'] = entity.token;
  data['userId'] = entity.userId;
  data['uuid'] = entity.uuid;
  data['idIndividu'] = entity.idIndividu;
  data['etablissementId'] = entity.etablissementId;
  data['userName'] = entity.userName;
  return data;
}

extension StudentIdsEntityExtension on StudentIdsEntity {
  StudentIdsEntity copyWith({
    String? expirationDate,
    String? token,
    int? userId,
    String? uuid,
    int? idIndividu,
    int? etablissementId,
    String? userName,
  }) {
    return StudentIdsEntity()
      ..expirationDate = expirationDate ?? this.expirationDate
      ..token = token ?? this.token
      ..userId = userId ?? this.userId
      ..uuid = uuid ?? this.uuid
      ..idIndividu = idIndividu ?? this.idIndividu
      ..etablissementId = etablissementId ?? this.etablissementId
      ..userName = userName ?? this.userName;
  }
}