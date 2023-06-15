import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class RemoteProductService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/products';

  static Future<dynamic> delete({required int id}) async {
    var response = await http.Client().delete(
      Uri.parse('$baseUrl/api/product/delete/$id'),
    );
    return response;
  }

  Future<dynamic> update({
    required int category_id,
    required int supplier_id,
    required int brand_id,
    required String product_name,
    required int product_quantity,
    required int id,
    required String product_code,
    required String product_garage,
    required String product_route,
    required String product_image,
    required String buy_date,
    required String expire_date,
    required String import_price,
    required String export_price,
  }) async {
    var body = {
      "category_id": category_id,
      "supplier_id": supplier_id,
      "brand_id": brand_id,
      "product_name": product_name,
      "product_code": product_code,
      "product_garage": product_garage,
      "product_route": product_route,
      "product_image": product_image,
      "buy_date": buy_date,
      "expire_date": expire_date,
      "import_price": import_price,
      "product_quantity": product_quantity,
      "export_price": export_price
    };
    var response = await client.put(
      Uri.parse('$baseUrl/api/product/update/$id'),
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

  Future<dynamic> create({
    required int category_id,
    required int supplier_id,
    required int brand_id,
    required String product_name,
    required int product_quantity,
    required String product_code,
    required String product_garage,
    required String product_route,
    required String product_image,
    required String buy_date,
    required String expire_date,
    required String import_price,
    required String export_price,
  }) async {
    var body = {
      "category_id": category_id,
      "supplier_id": supplier_id,
      "brand_id": brand_id,
      "product_name": product_name,
      "product_code": product_code,
      "product_garage": product_garage,
      "product_route": product_route,
      "product_image": product_image,
      "buy_date": buy_date,
      "expire_date": expire_date,
      "import_price": import_price,
      "product_quantity": product_quantity,
      "export_price": export_price
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/product/add'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );
    print(response.statusCode);
    return response;
  }
}
