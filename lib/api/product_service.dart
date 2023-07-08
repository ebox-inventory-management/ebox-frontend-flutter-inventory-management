import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/controller/product_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import '../core/constants/base_url.dart';
import 'package:get/get.dart';
import 'dart:io' as io;
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';

class RemoteProductService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/products';
  DateTime now = DateTime.now();

  static Future<dynamic> delete({
    required int id,
    required String name,
    required String token,
  }) async {
    DateTime now = DateTime.now();

    var response = await http.Client().delete(
      Uri.parse('$baseUrl/api/product/delete/$id'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200) {
      Get.snackbar('Deleted Product!', 'You have been delete $name'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } else if (response.statusCode == 400) {
      Get.snackbar('Something wrong!', 'Only admin can access',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } else {
      Get.snackbar('Something wrong!', 'Delete $name is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }
    productController.getProducts();
    exportController.getExports();
    importController.getImports();
    productController.getProducts();
    dashboardController.getChartDataExport();
    dashboardController.getChartDataImport();
    dashboardController.getChartDataProductQuantity();
    compoundProductController.getCompoundProducts();
    incomeController.getIncomeToday();
    expenseController.getExpenseToday();
    revenueController.getRevenueToday();
    incomeController.getRange(
        start: DateTime(now.year, now.month, now.day).toString(),
        end: DateTime(now.year, now.month, now.day + 1).toString());
    expenseController.getRange(
        start: DateTime(now.year, now.month, now.day).toString(),
        end: DateTime(now.year, now.month, now.day + 1).toString());
    revenueController.getRange(
        start: DateTime(now.year, now.month, now.day).toString(),
        end: DateTime(now.year, now.month, now.day + 1).toString());
    print(response.statusCode);

    return response;
  }

  Future<dynamic> update({
    required int category_id,
    required int supplier_id,
    required int brand_id,
    required String product_name,
    required String description,
    required String product_code,
    required String product_garage,
    required String product_route,
    required PlatformFile product_image,
    required String expire_date,
    required int import_price,
    required int export_price,
    required int id,
    required String token,
  }) async {
    final base64Image = base64Encode(product_image.bytes!);

    var body = {
      "description": description,
      "category_id": category_id,
      "supplier_id": supplier_id,
      "brand_id": brand_id,
      "product_name": product_name,
      "product_code": product_code,
      "product_garage": product_garage,
      "product_route": product_route,
      "product_image": base64Image,
      "expire_date": expire_date,
      "import_price": import_price,
      "export_price": export_price
    };

    var response = await client.post(
      Uri.parse('$baseUrl/api/product/update/$id'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
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
    } else if (response.statusCode == 400) {
      Get.snackbar('Something wrong!', 'Only admin can access',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
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
    exportController.getExports();
    importController.getImports();
    productController.getProducts();
    dashboardController.getChartDataExport();
    dashboardController.getChartDataImport();
    dashboardController.getChartDataProductQuantity();
    incomeController.getIncomeToday();
    expenseController.getExpenseToday();
    revenueController.getRevenueToday();
    incomeController.getRange(
        start: DateTime(now.year, now.month, now.day).toString(),
        end: DateTime(now.year, now.month, now.day + 1).toString());
    expenseController.getRange(
        start: DateTime(now.year, now.month, now.day).toString(),
        end: DateTime(now.year, now.month, now.day + 1).toString());
    revenueController.getRange(
        start: DateTime(now.year, now.month, now.day).toString(),
        end: DateTime(now.year, now.month, now.day + 1).toString());
    print(response.statusCode);
    return response;
  }

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
    print(response.statusCode);

    return response;
  }

  Future<dynamic> getById({
    required int id,
    required String token,
  }) async {
    var response = await client.get(
      Uri.parse('$baseUrl/api/product/view/$id'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }

  Future<dynamic> getByKeyword({
    required String keyword,
    required String token,
  }) async {
    var response = await client.get(
      Uri.parse('$baseUrl/api/product/search/$keyword'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }

  Future<dynamic> getByName({
    required String name,
    required String token,
  }) async {
    var response = await client.get(
      Uri.parse('$baseUrl/api/product/name/$name'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }

  Future<dynamic> create({
    required int category_id,
    required int supplier_id,
    required int brand_id,
    required String product_name,
    required String description,
    required String product_code,
    required String product_garage,
    required String product_route,
    required PlatformFile product_image,
    required String expire_date,
    required int import_price,
    required int export_price,
    required String token,
  }) async {
    final base64Image = base64Encode(product_image.bytes!);
    var body = {
      "description": description,
      "category_id": category_id,
      "supplier_id": supplier_id,
      "brand_id": brand_id,
      "product_name": product_name,
      "product_code": product_code,
      "product_garage": product_garage,
      "product_image": base64Image,
      "product_route": product_route,
      "expire_date": expire_date,
      "import_price": import_price,
      "export_price": export_price
    };

    var response = await client.post(
      Uri.parse('$baseUrl/api/product/add'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 500) {
      Get.snackbar('Something wrong!', 'You need to input new product name!',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } else if (response.statusCode == 400) {
      Get.snackbar('Something wrong!', 'Only admin can access',
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
    print(response.statusCode);

    productController.getProducts();
    return response;
  }
}
