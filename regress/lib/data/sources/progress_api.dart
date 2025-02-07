import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:regress/data/models/student_data_entity.dart';
import 'package:regress/data/models/student_ids_entity.dart';
import 'package:result_dart/result_dart.dart';

import '../models/auth_request_entity.dart';

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

  Future<ResultDart<StudentDataEntity, String>> getStudentData(
    String jwtToken,
    String studentUuid,
  ) =>
      _get(jwtToken, "bac/$studentUuid/individu").fold(
        (res) {
          // some times progres api returns array with one element RANDOMLY
          dynamic studentDataDecoded = jsonDecode(res.body);
          if (studentDataDecoded is List) studentDataDecoded = studentDataDecoded.first;
          return StudentDataEntity.fromJson(studentDataDecoded).toSuccess();
        },
        (error) => error.toFailure(),
      );

  Future<ResultDart<StudentIdsEntity, String>> login(AuthRequestEntity authReq) async {
    Uri uri = Uri.parse("$_baseUrl/authentication/v1/");

    final headers = {
      'Accept': 'application/json, text/plain, */*',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http.post(
        uri,
        headers: headers,
        body: authReq.toString(),
      );
      if (response.statusCode == 200) {
        return (StudentIdsEntity.fromJson(jsonDecode(response.body)).toSuccess());
      } else {
        return ("Error: ${response.statusCode} - ${response.body}").toFailure();
      }
    } catch (e) {
      return ("Error occurred: ${e.toString()}").toFailure();
    }
  }
}
