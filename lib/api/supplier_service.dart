import 'dart:convert';

import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';
import 'package:get/get.dart';

class RemoteSupplierService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/suppliers';

  Future<dynamic> create({
    required String name,
    required String email,
    required String phone,
    required String address,
    required String city,
    required String type,
    required String shop_name,
    required PlatformFile photo,
    required String bank_name,
    required String bank_number,
    required String token,
  }) async {
    final base64Image = base64Encode(photo.bytes!);

    var body = {
      "name": name,
      "email": email,
      "phone": phone,
      "address": address,
      "city": city,
      "type": type,
      "shop_name": shop_name,
      "photo": base64Image,
      "bank_name": bank_name,
      "bank_number": bank_number
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/supplier/add'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(body),
    );
    print(response.statusCode);
    if (response.statusCode == 500) {
      Get.snackbar('Something wrong!', 'You need to input new supplier name!',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 30));
    } else if (response.statusCode == 200) {
      Get.snackbar('Added Supplier!', 'You have been add supplier'.tr,
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
      Get.snackbar('Something wrong!', 'Add supplier is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 30));
    }

    supplierController.getSuppliers();
    return response;
  }

  Future<dynamic> update({
    required int id,
    required String name,
    required String email,
    required String phone,
    required String address,
    required String city,
    required String type,
    required String shop_name,
    required PlatformFile photo,
    required String bank_name,
    required String bank_number,
    required String token,
  }) async {
    final base64Image = base64Encode(photo.bytes!);

    var body = {
      "name": name,
      "email": email,
      "phone": phone,
      "address": address,
      "city": city,
      "type": type,
      "shop_name": shop_name,
      "photo": base64Image,
      "bank_name": bank_name,
      "bank_number": bank_number
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/supplier/update/$id'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode(body),
    );
    print(response.statusCode);
    if (response.statusCode == 500) {
      Get.snackbar('Something wrong!', 'You need to input new supplier name!',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 30));
    } else if (response.statusCode == 200) {
      Get.snackbar('Updated Supplier!', 'You have been update supplier'.tr,
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
          'Something wrong!', 'Update supplier is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 30));
    }

    supplierController.getSuppliers();
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
      Uri.parse('$baseUrl/api/supplier/view/$id'),
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
      Uri.parse('$baseUrl/api/supplier/delete/$id'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200) {
      Get.snackbar('Deleted Supplier!', 'You have been delete supplier'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 30));
    } else if (response.statusCode == 400) {
      Get.snackbar('Something wrong!', 'Only admin can access',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 30));
    } else {
      Get.snackbar(
          'Something wrong!', 'Delete supplier is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 30));
    }
    supplierController.getSuppliers();
    return response;
  }

  Future<dynamic> getByKeyword({
    required String keyword,
    required String token,
  }) async {
    var response = await client.get(
      Uri.parse('$baseUrl/api/supplier/search/$keyword'),
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
      Uri.parse('$baseUrl/api/supplier/$name'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );
    if (response.statusCode == 200) {
      supplierController.getSupplierByName(name: name);
    } else {
      Get.snackbar('Something wrong!', 'Supplier is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.TOP,
          duration: const Duration(seconds: 30));
    }
    return response;
  }
}
