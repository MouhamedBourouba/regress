import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:result_dart/result_dart.dart';

import '../models/auth_request_entity.dart';
import '../models/user_ids.dart';

class ProgressAPI {
  static const _baseUrl = "https://progres.mesrs.dz/api";

  Future<ResultDart<UserIds, String>> login(AuthRequestEntity authReq) async {
    Uri uri = Uri.parse("$_baseUrl/authentication/v1/");

    final headers = {
      'Accept': 'application/json, text/plain, */*',
      'Content-Type': 'application/json',
      'Connection': 'Keep-Alive',
      'Accept-Encoding': 'gzip',
    };

    try {
      final response = await http.post(
        uri,
        headers: headers,
        body: authReq.toString(),
      );
      if (response.statusCode == 200) {
        return (UserIds.fromJson(jsonDecode(response.body)).toSuccess());
      } else {
        return ("Error: ${response.statusCode} - ${response.body}").toFailure();
      }
    } catch (e) {
      return ("Error occurred: ${e.toString()}").toFailure();
    }
  }

  Future<ResultDart<String, String>> getUserImage(String userUuid, String jwtToken) async {
    Uri uri = Uri.parse("$_baseUrl/infos/image/$userUuid");

    // Stupid i know but this is how progres servers work
    final headers = {
      'Accept': 'application/json, text/plain, */*',
      'Content-Type': 'application/json',
      'Connection': 'Keep-Alive',
      'Accept-Encoding': 'gzip',
      'authorization': jwtToken,
    };

    try {
      final response = await http.get(
        uri,
        headers: headers,
      );

      if (response.statusCode == 200) {
        return response.body.toSuccess();
      } else {
        return ("Error: ${response.statusCode} - ${response.body}").toFailure();
      }
    } catch (e) {
      return ("Error occurred: ${e.toString()}").toFailure();
    }
  }
}
