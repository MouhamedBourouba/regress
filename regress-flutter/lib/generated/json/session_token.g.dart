import 'package:regress/generated/json/base/json_convert_content.dart';
import 'package:regress/data/models/session_token.dart';

SessionToken $SessionTokenFromJson(Map<String, dynamic> json) {
  final SessionToken sessionToken = SessionToken();
  final String? expirationDate = jsonConvert.convert<String>(json['expirationDate']);
  if (expirationDate != null) {
    sessionToken.expirationDate = expirationDate;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    sessionToken.token = token;
  }
  final int? userId = jsonConvert.convert<int>(json['userId']);
  if (userId != null) {
    sessionToken.userId = userId;
  }
  final String? uuid = jsonConvert.convert<String>(json['uuid']);
  if (uuid != null) {
    sessionToken.uuid = uuid;
  }
  final int? idIndividu = jsonConvert.convert<int>(json['idIndividu']);
  if (idIndividu != null) {
    sessionToken.idIndividu = idIndividu;
  }
  final int? etablissementId = jsonConvert.convert<int>(json['etablissementId']);
  if (etablissementId != null) {
    sessionToken.etablissementId = etablissementId;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    sessionToken.userName = userName;
  }
  return sessionToken;
}

Map<String, dynamic> $SessionTokenToJson(SessionToken entity) {
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

extension SessionTokenExtension on SessionToken {
  SessionToken copyWith({
    String? expirationDate,
    String? token,
    int? userId,
    String? uuid,
    int? idIndividu,
    int? etablissementId,
    String? userName,
  }) {
    return SessionToken()
      ..expirationDate = expirationDate ?? this.expirationDate
      ..token = token ?? this.token
      ..userId = userId ?? this.userId
      ..uuid = uuid ?? this.uuid
      ..idIndividu = idIndividu ?? this.idIndividu
      ..etablissementId = etablissementId ?? this.etablissementId
      ..userName = userName ?? this.userName;
  }
}
