import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class RemoteAdjustmentService {
  static Future<dynamic> getProductsByCategoryId({required int id}) async {
    var response = await http.Client()
        .get(Uri.parse('$baseUrl/api/products/category/$id'));
    return response;
  }

  static Future<dynamic> getProductsByCategoryBrandId({
    required int categoryId,
    required int brandId,
  }) async {
    var response = await http.Client().get(
        Uri.parse('$baseUrl/api/products/category/brand/$categoryId/$brandId'));
    return response;
  }

  static Future<dynamic> getProductsByCategorySupplierId({
    required int categoryId,
    required int supplierId,
  }) async {
    var response = await http.Client().get(Uri.parse(
        '$baseUrl/api/products/category/supplier/$categoryId/$supplierId'));
    return response;
  }
}
