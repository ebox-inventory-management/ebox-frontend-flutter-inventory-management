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
    required String token,
  }) async {
    var body = {
      "name": name,
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/category/add'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
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
    } else if (response.statusCode == 400) {
      Get.snackbar('Something wrong!', 'Only admin can access',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
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
    required String token,
  }) async {
    var body = {
      "name": name,
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/category/update/$id'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
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
    } else if (response.statusCode == 400) {
      Get.snackbar('Something wrong!', 'Only admin can access',
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

  Future<dynamic> getById({
    required int id,
    required String token,
  }) async {
    var response = await client.get(
      Uri.parse('$baseUrl/api/category/view/$id'),
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
      Uri.parse('$baseUrl/api/category/search/$keyword'),
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
      Uri.parse('$baseUrl/api/category/$name'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
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

  static Future<dynamic> deleteById({
    required int id,
    required String token,
  }) async {
    var response = await http.Client().delete(
      Uri.parse('$baseUrl/api/category/delete/$id'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200) {
      Get.snackbar('Deleted Category!', 'You have been delete category'.tr,
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
