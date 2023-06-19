import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class RemoteSupplierService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/suppliers';

  Future<dynamic> create({
    required String name,
    required String email,
    required String phone,
    required String address,
    required String city,
    required String type,
    required String shop_name,
    required String photo,
    required String bank_name,
    required String bank_number,
  }) async {
    var body = {
      "name": name,
      "email": email,
      "phone": phone,
      "address": address,
      "city": city,
      "type": type,
      "shop_name": shop_name,
      "photo": photo,
      "bank_name": bank_name,
      "bank_number": bank_number
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/supplier/add'),
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
    required String email,
    required String phone,
    required String address,
    required String city,
    required String type,
    required String shop_name,
    required String photo,
    required String bank_name,
    required String bank_number,
  }) async {
    var body = {
      "name": name,
      "email": email,
      "phone": phone,
      "address": address,
      "city": city,
      "type": type,
      "shop_name": shop_name,
      "photo": photo,
      "bank_name": bank_name,
      "bank_number": bank_number
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/supplier/update/$id'),
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
        await client.get(Uri.parse('$baseUrl/api/supplier/view/$id'));
    return response;
  }

  static Future<dynamic> deleteById({required int id}) async {
    var response =
        await http.Client().get(Uri.parse('$baseUrl/api/supplier/delete/$id'));
    return response;
  }

  Future<dynamic> getByKeyword({required String keyword}) async {
    var response =
        await client.get(Uri.parse('$baseUrl/api/supplier/search/$keyword'));
    return response;
  }

  Future<dynamic> getByName({required String name}) async {
    var response = await client.get(Uri.parse('$baseUrl/api/supplier/$name'));
    return response;
  }
}
