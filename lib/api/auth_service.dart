import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../core/constants/base_url.dart';

class RemoteAuthService {
  var client = http.Client();

  Future<dynamic> signOut({
    required String token,
  }) async {
    var response = await client.post(
      Uri.parse('$baseUrl/api/logout'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }

  Future<dynamic> update({
    required String email,
    required String name,
    required String role,
    required PlatformFile image,
    required int id,
    required String token,
  }) async {
    final base64Image = base64Encode(image.bytes!);

    var body = {
      "name": name,
      "email": email,
      "image": base64Image,
      "role": role
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/user/$id'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      Get.snackbar('Update Successful!', 'Your profile has been updated'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 30));
      Get.offAndToNamed('/navigation');
    } else {
      Get.snackbar('Something wrong!', 'Update is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 30));
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
      required String role,
      required PlatformFile image,
      required String password_confirmation}) async {
    final base64Image = base64Encode(image.bytes!);

    var body = {
      "role": role,
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
      Get.snackbar('Successful!', 'Added user ${name}'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 30));

      Get.offAndToNamed('/navigation');
    } else {
      Get.snackbar('Something wrong!', 'Add user is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 30));
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
      Get.offAndToNamed('/navigation');
    } else {
      Get.snackbar('Something wrong!', 'SignIn is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 30));
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

  Future<dynamic> getUsers({
    required String token,
  }) async {
    var response = await client.get(
      Uri.parse('$baseUrl/api/user/show'),
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
      Uri.parse('$baseUrl/api/user/search/$keyword'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    return response;
  }

  static Future<dynamic> deleteById({
    required int id,
    required String token,
  }) async {
    var response = await http.Client().delete(
      Uri.parse('$baseUrl/api/user/delete/$id'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200) {
      Get.snackbar('Deleted User!', 'You have been delete user'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 30));
    } else {
      Get.snackbar('Something wrong!', 'Delete user is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 30));
    }
    authController.getUsers();
    return response;
  }
}
