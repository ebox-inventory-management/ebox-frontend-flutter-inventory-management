import 'dart:convert';

import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

class RemoteExportService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/exports';
  DateTime now = DateTime.now();

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

  Future<dynamic> create({
    required int product_quantity,
    required int productId,
    required String token,
  }) async {
    var body = {"product_quantity": product_quantity};
    var response = await client.post(
      Uri.parse('$baseUrl/api/export/add/$productId'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      Get.snackbar('Exported Product!', 'You have been export product'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 30));

      Get.offAndToNamed('/navigation');
    } else if (response.statusCode == 400) {
      Get.snackbar('Something wrong!', 'Only admin can access',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 30));
    } else {
      Get.snackbar(
          'Something wrong!', 'Export product is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 30));
    }
    exportController.getExports();
    productController.getProducts();
    dashboardController.getChartDataExport();
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
}
