import 'dart:convert';

import 'package:result_dart/result_dart.dart';

import 'models/auth_request_entity.dart';
import 'models/auth_response_entity.dart';
import 'package:http/http.dart' as http;

class ProgressAPI {
  static const baseUrl = "https://progres.mesrs.dz/api";

  static Future<ResultDart<AuthResponseEntity, String>> authenticate(
      AuthRequestEntity authReq) async {
    Uri uri = Uri.parse("$baseUrl/authentication/v1/");

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
        return (AuthResponseEntity.fromJson(jsonDecode(response.body)).toSuccess());
      } else {
        return ("Error: ${response.statusCode} - ${response.body}").toFailure();
      }
    } catch (e) {
      return ("Error occurred: ${e.toString()}").toFailure();
    }
  }
}
