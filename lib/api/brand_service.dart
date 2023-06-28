import 'dart:convert';

import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../core/constants/base_url.dart';

class RemoteBrandService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/brands';

  Future<dynamic> create({
    required String name,
  }) async {
    var body = {
      "name": name,
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/brand/add'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );
    print(response.statusCode);
    if (response.statusCode == 500) {
      Get.snackbar('Something wrong!', 'You need to input new brand name!',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } else if (response.statusCode == 200) {
      Get.snackbar('Added Brand!', 'You have been add brand'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));

      Get.offAndToNamed('/navigation');
    } else {
      Get.snackbar('Something wrong!', 'Add brand is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }

    brandController.getBrands();
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
      Uri.parse('$baseUrl/api/brand/update/$id'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );
    print(response.statusCode);
    if (response.statusCode == 500) {
      Get.snackbar('Something wrong!', 'You need to input new brand name!',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } else if (response.statusCode == 200) {
      Get.snackbar('Updated Brand!', 'You have been update brand'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));

      Get.offAndToNamed('/navigation');
    } else {
      Get.snackbar('Something wrong!', 'Update brand is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }

    brandController.getBrands();
    return response;
  }

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    return response;
  }

  Future<dynamic> getById({required int id}) async {
    var response = await client.get(Uri.parse('$baseUrl/api/brand/view/$id'));
    return response;
  }

  Future<dynamic> getByKeyword({required String keyword}) async {
    var response =
        await client.get(Uri.parse('$baseUrl/api/brand/search/$keyword'));
    return response;
  }

  Future<dynamic> getByName({required String name}) async {
    var response = await client.get(Uri.parse('$baseUrl/api/brand/$name'));
    if (response.statusCode == 200) {
      brandController.getBrandByName(name: name);
    } else {
      Get.snackbar('Something wrong!', 'Brand is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }
    return response;
  }

  static Future<dynamic> deleteById({required int id}) async {
    var response =
        await http.Client().delete(Uri.parse('$baseUrl/api/brand/delete/$id'));
    if (response.statusCode == 200) {
      Get.snackbar('Deleted Brand!', 'You have been delete brand'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } else {
      Get.snackbar('Something wrong!', 'Delete brand is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }
    brandController.getBrands();
    return response;
  }
}
