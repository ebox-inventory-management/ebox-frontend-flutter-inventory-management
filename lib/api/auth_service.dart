import 'dart:convert';

import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../core/constants/base_url.dart';

class RemoteAuthService {
  var client = http.Client();

  Future<dynamic> update({
    required String email,
    required String name,
    required PlatformFile image,
    required int id,
  }) async {
    final base64Image = base64Encode(image.bytes!);

    var body = {"name": name, "email": email, "image": base64Image};
    var response = await client.post(
      Uri.parse('$baseUrl/api/user/$id'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      Get.snackbar('Update Successful!', 'Your profile has been updated'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
      Get.offAndToNamed('/navigation');
    } else {
      Get.snackbar('Something wrong!', 'Update is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }

    authController.getUsers();
    authController.checkToken();
    print(response.body);
    print(response.statusCode);
    return response;
  }

  Future<dynamic> signUp(
      {required String email,
      required String name,
      required String password,
      required PlatformFile image,
      required String password_confirmation}) async {
    final base64Image = base64Encode(image.bytes!);

    var body = {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": password_confirmation,
      "image": base64Image
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/register'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      Get.snackbar(
          'SignUp Successful!', 'Welcome to eBox Inventory Management'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));

      Get.offAndToNamed('/navigation');
    } else {
      Get.snackbar('Something wrong!', 'SignUp is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }
    print(response.statusCode);
    return response;
  }

  Future<dynamic> signIn({
    required String? email,
    required String? password,
  }) async {
    var body = {"email": email, "password": password};
    var response = await client.post(
      Uri.parse('$baseUrl/api/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      Get.snackbar(
          'SignIn Successful!', 'Welcome to eBox Inventory Management'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));

      Get.offAndToNamed('/navigation');
    } else {
      Get.snackbar('Something wrong!', 'SignIn is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }
    return response;
  }

  Future<dynamic> getUser({
    required String token,
  }) async {
    var response = await client.get(
      Uri.parse('$baseUrl/api/user'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }

  Future<dynamic> getUsers() async {
    var response = await client.get(
      Uri.parse('$baseUrl/api/show'),
    );
    return response;
  }

  Future<dynamic> getByKeyword({required String keyword}) async {
    var response =
        await client.get(Uri.parse('$baseUrl/api/user/search/$keyword'));
    return response;
  }
}
