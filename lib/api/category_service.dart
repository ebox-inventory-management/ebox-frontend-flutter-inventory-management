import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import '../controller/controllers.dart';
import '../core/constants/base_url.dart';
import 'package:get/get.dart';

class RemoteCategoryService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/categories';

  Future<dynamic> create({
    required String name,
  }) async {
    var body = {
      "name": name,
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/category/add'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );
    print(response.statusCode);
    if (response.statusCode == 500) {
      Get.snackbar('Something wrong!', 'You need to input new category name!',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } else if (response.statusCode == 200) {
      Get.snackbar('Added Category!', 'You have been add category'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));

      Get.offAndToNamed('/navigation');
    } else {
      Get.snackbar('Something wrong!', 'Add category is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }

    categoryController.getCategories();
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
      Uri.parse('$baseUrl/api/category/update/$id'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );
    print(response.statusCode);
    if (response.statusCode == 500) {
      Get.snackbar('Something wrong!', 'You need to input new category name!',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } else if (response.statusCode == 200) {
      Get.snackbar('Updated Category!', 'You have been update category'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));

      Get.offAndToNamed('/navigation');
    } else {
      Get.snackbar(
          'Something wrong!', 'Update category is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }

    categoryController.getCategories();
    return response;
  }

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));

    return response;
  }

  Future<dynamic> getById({required int id}) async {
    var response =
        await client.get(Uri.parse('$baseUrl/api/category/view/$id'));
    return response;
  }

  Future<dynamic> getByKeyword({required String keyword}) async {
    var response =
        await client.get(Uri.parse('$baseUrl/api/category/search/$keyword'));
    return response;
  }

  Future<dynamic> getByName({required String name}) async {
    var response = await client.get(Uri.parse('$baseUrl/api/category/$name'));
    if (response.statusCode == 200) {
      categoryController.getCategoryByName(name: name);
    } else {
      Get.snackbar('Something wrong!', 'Category is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }
    return response;
  }

  static Future<dynamic> deleteById({required int id}) async {
    var response = await http.Client()
        .delete(Uri.parse('$baseUrl/api/category/delete/$id'));
    if (response.statusCode == 200) {
      Get.snackbar('Deleted Category!', 'You have been delete category'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } else {
      Get.snackbar(
          'Something wrong!', 'Delete category is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }
    categoryController.getCategories();

    print(response.statusCode);
    return response;
  }
}
