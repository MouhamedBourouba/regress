import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:regress/data/models/coefficient_entity.dart';
import 'package:regress/data/models/session_token.dart';
import 'package:regress/data/models/student_bac_info_response_v2_entity.dart';
import 'package:regress/data/models/student_group_entity.dart';
import 'package:regress/data/models/student_notes_entity.dart';
import 'package:regress/domain/models/exam_notes.dart';
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
      final response = await http.get(uri, headers: headers);

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
  Future<ResultDart<String, Unit>> fetchUserImage(
    String userUuid,
    String jwtToken,
  ) {
    return _get(
      jwtToken,
      "image/$userUuid",
    ).fold((res) => res.body.toSuccess(), (error) => unit.toFailure());
  }

  // Base64 encoded
  // https://progres.mesrs.dz/api/logoEtablissement/{establishmentId}
  Future<ResultDart<String, Unit>> fetchUniversityLogo(
    String jwtToken,
    String establishmentId,
  ) {
    return _get(
      jwtToken,
      "logoEtablissement/$establishmentId",
    ).fold((res) => res.body.toSuccess(), (error) => unit.toFailure());
  }

  // https://progres.mesrs.dz/api/infos/bac/{uuid}/dias
  Future<ResultDart<List<StudentBacInfoResponseV2Entity>, String>> fetchStudentData(
      String jwtToken, String studentUuid) {
    return _get(jwtToken, "bac/$studentUuid/dias").fold((res) {
      // some times progres api returns array with one element RANDOMLY
      var result = <StudentBacInfoResponseV2Entity>[];
      dynamic studentDataDecoded = jsonDecode(utf8.decode(res.bodyBytes));

      if (studentDataDecoded is List) {
        result = studentDataDecoded
            .map((e) => StudentBacInfoResponseV2Entity.fromJson(e))
            .toList(growable: false);
      } else {
        result.add(StudentBacInfoResponseV2Entity.fromJson(studentDataDecoded));
      }

      return result.toSuccess();
    }, (error) => error.toFailure());
  }

  // https://progres.mesrs.dz/api/infos/dia/{student id}/groups
  Future<ResultDart<List<StudentGroupEntity>, String>> fetchStudentGroups(
    String jwt,
    String studentId,
  ) {
    return _get(jwt, "dia/$studentId/groups").fold(
      (response) => (jsonDecode(response.body) as List)
          .map((e) => StudentGroupEntity.fromJson(e))
          .toList(growable: false)
          .toSuccess(),
      (error) => error.toFailure(),
    );
  }

  // https://progres.mesrs.dz/api/infos/planningSession/dia/{{student id}}/noteExamens
  Future<ResultDart<List<List<StudentNotesEntity>>, String>> fetchStudentGrades(
    String jwt,
    Iterable<String> studentSemesterIds,
  ) async {
    final requests =
        studentSemesterIds.map<Future<ResultDart<List<StudentNotesEntity>, String>>>((e) {
      return _get(jwt, "planningSession/dia/$e/noteExamens").fold(
        (data) {
          final decodedJson = jsonDecode(utf8.decode(data.bodyBytes));
          return (decodedJson as List)
              .map((note) => StudentNotesEntity.fromJson(note))
              .toList()
              .toSuccess();
        },
        (error) => error.toFailure(),
      );
    });

    final notesList = <List<StudentNotesEntity>>[];
    final responses = await Future.wait(requests);

    for (final result in responses) {
      if (result.isError()) return result.exceptionOrNull()!.toFailure();
      notesList.add(result.getOrThrow());
    }

    return notesList.toSuccess<String>();
  }

  Future<ResultDart<List<CoefficientEntity>, String>> fetchModuleCoefficients(
    String jwtToken,
    int offreFormationId,
    int niveauId,
  ) async {
    return _get(
      jwtToken,
      "offreFormation/$offreFormationId/niveau/$niveauId/Coefficients",
    ).fold(
      (response) {
        final List<dynamic> jsonList = json.decode(utf8.decode(response.bodyBytes));
        return jsonList
            .map((json) => CoefficientEntity.fromJson(json))
            .toList()
            .toSuccess();
      },
      (error) => error.toFailure(),
    );
  }

  // https://progres.mesrs.dz/api/authentication/v1/
  Future<ResultDart<SessionToken, String>> login(
    String registrationNumber,
    String password,
  ) async {
    Uri uri = Uri.parse("$_baseUrl/authentication/v1/");
    final headers = {"Content-Type": "application/json"};
    try {
      final body = """{"username": "$registrationNumber","password": "$password"}""";
      final response = await http.post(uri, body: body, headers: headers);
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
