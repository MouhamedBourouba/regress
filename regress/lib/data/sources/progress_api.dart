import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:regress/data/models/bac_data_response_entity.dart';
import 'package:regress/domain/models/session_token.dart';
import 'package:result_dart/result_dart.dart';

class ProgressAPI {
  static const _baseUrl = "https://progres.mesrs.dz/api";

  Future<ResultDart<http.Response, String>> _get(
    String token,
    String path, [
    Map<String, String>? headers,
  ]) async {
    final uri = Uri.parse("$_baseUrl/infos/$path");

    headers ??= {};
    headers['authorization'] = token;

    try {
      final response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        return response.toSuccess();
      } else {
        return ("Error: ${response.statusCode} - ${response.body}").toFailure();
      }
    } catch (e) {
      return ("Error occurred: ${e.toString()}").toFailure();
    }
  }

  // Base64 encoded
  // https://progres.mesrs.dz/api/infos/image/{uuid}
  Future<ResultDart<String, Unit>> fetchUserImage(String userUuid, String jwtToken) =>
      _get(jwtToken, "image/$userUuid").fold(
        (res) => res.body.toSuccess(),
        (error) => unit.toFailure(),
      );

  // Base64 encoded
  Future<ResultDart<String, Unit>> fetchUniversityLogo(String jwtToken, String establishmentId) =>
      _get(jwtToken, "logoEtablissement/$establishmentId").fold(
        (res) => res.body.toSuccess(),
        (error) => unit.toFailure(),
      );

  // https://progres.mesrs.dz/api/infos/bac/{uuid}/dias
  Future<ResultDart<List<BacDataResponseEntity>, String>> fetchStudentData(
    String jwtToken,
    String studentUuid,
  ) =>
      _get(jwtToken, "bac/$studentUuid/dias").fold(
        (res) {
          // some times progres api returns array with one element RANDOMLY
          var result = <BacDataResponseEntity>[];
          dynamic studentDataDecoded = jsonDecode(res.body);
          if (studentDataDecoded is List) {
            for (var element in studentDataDecoded) {
              result.add(BacDataResponseEntity.fromJson(element));
            }
          } else {
            result.add(BacDataResponseEntity.fromJson(studentDataDecoded));
          }
          // some times the progres api returns strings with appended spaces
          // final entity = BacDataResponseEntity.fromJson();
          return result.toSuccess();
        },
        (error) => error.toFailure(),
      );

  Future<ResultDart<SessionToken, String>> login(
    String registrationNumber,
    String password,
  ) async {
    Uri uri = Uri.parse("$_baseUrl/authentication/v1/");

    final headers = {
      'Accept': 'application/json, text/plain, */*',
      'Content-Type': 'application/json',
    };

    try {
      final body = """{"username": "$registrationNumber","password": "$password"}""";
      final response = await http.post(
        uri,
        headers: headers,
        body: body,
      );
      if (response.statusCode == 200) {
        return (SessionToken.fromJson(jsonDecode(response.body)).toSuccess());
      } else {
        return ("Error: ${response.statusCode} - ${response.body}").toFailure();
      }
    } catch (e) {
      return ("Error occurred: ${e.toString()}").toFailure();
    }
  }
}
