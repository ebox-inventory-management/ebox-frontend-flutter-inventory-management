import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class RemoteCategoryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/categories';

  Future<dynamic> create({
    required String name,
  }) async {
    var body = {
      "name": name,
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/category/add'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );
    return response;
  }

  Future<dynamic> update({
    required int id,
    required String name,
  }) async {
    var body = {
      "name": name,
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/category/update/$id'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );
    return response;
  }

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    return response;
  }

  Future<dynamic> getById({required int id}) async {
    var response =
        await client.get(Uri.parse('$baseUrl/api/category/view/$id'));
    return response;
  }

  Future<dynamic> getByKeyword({required String keyword}) async {
    var response =
        await client.get(Uri.parse('$baseUrl/api/category/search/$keyword'));
    return response;
  }

  Future<dynamic> getByName({required String name}) async {
    var response = await client.get(Uri.parse('$baseUrl/api/category/$name'));
    return response;
  }

  static Future<dynamic> deleteById({required int id}) async {
    var response =
        await http.Client().get(Uri.parse('$baseUrl/api/category/delete/$id'));
    return response;
  }
}
