import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class RemoteProductService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/products';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    return response;
  }

  Future<dynamic> create({
    required int category_id,
    required int supplier_id,
    required int brand_id,
    required String product_name,
    required String product_code,
    required String product_garage,
    required String product_route,
    required String product_image,
    required String buy_date,
    required String expire_date,
    required String buying_price,
    required String price,
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
      "buying_price": buying_price,
      "price": price
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/product/add'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );
    return response;
  }
}
