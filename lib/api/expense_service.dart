import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class RemoteExpenseService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/expense';

  Future<dynamic> get({
    required String token,
  }) async {
    var response = await client.get(
      Uri.parse(remoteUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }

  Future<dynamic> getToday({
    required String token,
  }) async {
    var response = await client.get(
      Uri.parse('$remoteUrl/today'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }

  Future<dynamic> getThisMonth({
    required String token,
  }) async {
    var response = await client.get(
      Uri.parse('$remoteUrl/month'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    return response;
  }

  Future<dynamic> getThisYear({
    required String token,
  }) async {
    var response = await client.get(
      Uri.parse('$remoteUrl/year'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }

  Future<dynamic> getRange({
    required String start,
    required String end,
    required String token,
  }) async {
    var response = await client.get(
      Uri.parse('$baseUrl/api/expense/$start/$end'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }
}
