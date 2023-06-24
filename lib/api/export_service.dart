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
      Uri.parse('$baseUrl/api/export/add/$productId'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      Get.snackbar('Exported Product!', 'You have been export product'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));

      Get.offAndToNamed('/navigation');
    } else {
      Get.snackbar(
          'Something wrong!', 'Export product is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }
    exportController.getExports();
    productController.getProducts();

    dashboardController.getChartDataExport();
    incomeController.getIncomeToday();
    expenseController.getExpenseToday();
    revenueController.getRevenueToday();
    print(response.statusCode);
    return response;
  }
}
