import 'package:regress/data/models/auth_response_entity.dart';
import 'package:regress/generated/json/base/json_convert_content.dart';

AuthResponseEntity $AuthResponseEntityFromJson(Map<String, dynamic> json) {
  final AuthResponseEntity authResponseEntity = AuthResponseEntity();
  final String? expirationDate = jsonConvert.convert<String>(json['expirationDate']);
  if (expirationDate != null) {
    authResponseEntity.expirationDate = expirationDate;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    authResponseEntity.token = token;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    authResponseEntity.userId = userId;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    authResponseEntity.uuid = uuid;
  }
  final int? idIndividu = jsonConvert.convert<int>(json['idIndividu']);
  if (idIndividu != null) {
    authResponseEntity.idIndividu = idIndividu;
  }
  final int? etablissementId = jsonConvert.convert<int>(json['etablissementId']);
  if (etablissementId != null) {
    authResponseEntity.etablissementId = etablissementId;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    authResponseEntity.userName = userName;
  }
  return authResponseEntity;
}

Map<String, dynamic> $AuthResponseEntityToJson(AuthResponseEntity entity) {
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

extension AuthResponseEntityExtension on AuthResponseEntity {
  AuthResponseEntity copyWith({
    String? expirationDate,
    String? token,
    int? userId,
    String? uuid,
    int? idIndividu,
    int? etablissementId,
    String? userName,
  }) {
    return AuthResponseEntity()
      ..expirationDate = expirationDate ?? this.expirationDate
      ..token = token ?? this.token
      ..userId = userId ?? this.userId
      ..uuid = uuid ?? this.uuid
      ..idIndividu = idIndividu ?? this.idIndividu
      ..etablissementId = etablissementId ?? this.etablissementId
      ..userName = userName ?? this.userName;
  }
}