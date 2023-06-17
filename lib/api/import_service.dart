import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class RemoteImportService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/imports';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    return response;
  }

  Future<dynamic> create({
    required int product_quantity,
    required int productId,
  }) async {
    var body = {"product_quantity": product_quantity};
    var response = await client.post(
      Uri.parse('$baseUrl/api/import/add/$productId'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );
    return response;
  }
}
