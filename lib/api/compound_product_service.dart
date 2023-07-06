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

import '../model/add_product_compound.dart';
import '../model/product_compound.dart';

class RemoteCompoundProductService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/compound-products';
  DateTime now = DateTime.now();

  static Future<dynamic> delete({
    required int id,
    required String name,
    required String token,
  }) async {
    DateTime now = DateTime.now();

    var response = await http.Client().delete(
      Uri.parse('$baseUrl/api/compound/delete/$id'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200) {
      Get.snackbar('Deleted Compound Product!', 'You have been delete $name'.tr,
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
    compoundProductController.getCompoundProducts();
    print(response.statusCode);

    return response;
  }

  Future<dynamic> get({
    required String token,
  }) async {
    var response = await client.get(
      Uri.parse('$baseUrl/api/compounds'),
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
      Uri.parse('$baseUrl/api/compound-products/$id'),
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
      Uri.parse('$baseUrl/api/compound/search/$keyword'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }

  Future<dynamic> create({
    required String name,
    required int price,
    required String description,
    required String token,
    required List<AddProductCompound> productsCompound,
  }) async {
    var body = {
      "name": name,
      "price": price,
      "description": description,
      "products": productsCompound
    };

    var response = await client.post(
      Uri.parse(remoteUrl),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(body),
    );

    if (response.statusCode == 500) {
      Get.snackbar(
          'Something wrong!', 'You need to input new compound product name!',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } else if (response.statusCode == 200) {
      Get.snackbar(
          'Added Compound Product!', 'You have been add compound product'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));

      Get.offAndToNamed('/navigation');
    } else {
      Get.snackbar(
          'Something wrong!', 'Add compound product is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }

    print(response.statusCode);

    compoundProductController.getCompoundProducts();
    compoundProductController.productsCompound == null;
    return response;
  }
}
