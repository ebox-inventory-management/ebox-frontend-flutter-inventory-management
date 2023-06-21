import 'dart:convert';

import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/controller/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';
import 'package:get/get.dart';

class RemoteProductService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/products';

  static Future<dynamic> delete({required int id}) async {
    var response = await http.Client().get(
      Uri.parse('$baseUrl/api/product/delete/$id'),
    );
    if (response.statusCode == 200) {
      Get.snackbar('Deleted Product!', 'You have been delete product'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } else {
      Get.snackbar(
          'Something wrong!', 'Delete product is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }
    productController.getProducts();

    print(response.statusCode);

    return response;
  }

  Future<dynamic> update({
    required int category_id,
    required int supplier_id,
    required int brand_id,
    required String product_name,
    required String product_code,
    required String product_garage,
    required String product_route,
    required String product_image,
    required String expire_date,
    required int import_price,
    required int export_price,
    required int id,
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
      "expire_date": expire_date,
      "import_price": import_price,
      "export_price": export_price
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/product/update/$id'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 500) {
      Get.snackbar('Something wrong!', 'You need to update new product name!',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } else if (response.statusCode == 200) {
      Get.snackbar('Updated Product!', 'You have been update product'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));

      Get.offAndToNamed('/navigation');
    } else {
      Get.snackbar(
          'Something wrong!', 'Update product is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }

    productController.getProducts();

    print(response.statusCode);
    return response;
  }

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    print(response.statusCode);

    return response;
  }

  Future<dynamic> getById({required int id}) async {
    var response = await client.get(Uri.parse('$baseUrl/api/product/view/$id'));
    return response;
  }

  Future<dynamic> getByKeyword({required String keyword}) async {
    var response =
        await client.get(Uri.parse('$baseUrl/api/product/search/$keyword'));
    return response;
  }

  Future<dynamic> getByName({required String name}) async {
    var response =
        await client.get(Uri.parse('$baseUrl/api/product/name/$name'));
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
    required String expire_date,
    required int import_price,
    required int export_price,
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
      "expire_date": expire_date,
      "import_price": import_price,
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
    if (response.statusCode == 500) {
      Get.snackbar('Something wrong!', 'You need to input new product name!',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } else if (response.statusCode == 200) {
      Get.snackbar('Added Product!', 'You have been add product'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));

      Get.offAndToNamed('/navigation');
    } else {
      Get.snackbar('Something wrong!', 'Add product is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }

    productController.getProducts();
    return response;
  }
}
