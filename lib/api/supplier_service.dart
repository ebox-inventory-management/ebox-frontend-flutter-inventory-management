import 'dart:convert';

import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
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
    required String photo,
    required String bank_name,
    required String bank_number,
  }) async {
    var body = {
      "name": name,
      "email": email,
      "phone": phone,
      "address": address,
      "city": city,
      "type": type,
      "shop_name": shop_name,
      "photo": photo,
      "bank_name": bank_name,
      "bank_number": bank_number
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/supplier/add'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );
    print(response.statusCode);
    if (response.statusCode == 500) {
      Get.snackbar('Something wrong!', 'You need to input new supplier name!',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } else if (response.statusCode == 200) {
      Get.snackbar('Added Supplier!', 'You have been add supplier'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));

      Get.offAndToNamed('/navigation');
    } else {
      Get.snackbar('Something wrong!', 'Add supplier is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
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
    required String photo,
    required String bank_name,
    required String bank_number,
  }) async {
    var body = {
      "name": name,
      "email": email,
      "phone": phone,
      "address": address,
      "city": city,
      "type": type,
      "shop_name": shop_name,
      "photo": photo,
      "bank_name": bank_name,
      "bank_number": bank_number
    };
    var response = await client.post(
      Uri.parse('$baseUrl/api/supplier/update/$id'),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(body),
    );
    print(response.statusCode);
    if (response.statusCode == 500) {
      Get.snackbar('Something wrong!', 'You need to input new supplier name!',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } else if (response.statusCode == 200) {
      Get.snackbar('Updated Supplier!', 'You have been update supplier'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));

      Get.offAndToNamed('/navigation');
    } else {
      Get.snackbar(
          'Something wrong!', 'Update supplier is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }

    supplierController.getSuppliers();
    return response;
  }

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    return response;
  }

  Future<dynamic> getById({required int id}) async {
    var response =
        await client.get(Uri.parse('$baseUrl/api/supplier/view/$id'));
    return response;
  }

  static Future<dynamic> deleteById({required int id}) async {
    var response =
        await http.Client().get(Uri.parse('$baseUrl/api/supplier/delete/$id'));
    if (response.statusCode == 200) {
      Get.snackbar('Deleted Supplier!', 'You have been delete supplier'.tr,
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    } else {
      Get.snackbar(
          'Something wrong!', 'Delete supplier is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }
    supplierController.getSuppliers();
    return response;
  }

  Future<dynamic> getByKeyword({required String keyword}) async {
    var response =
        await client.get(Uri.parse('$baseUrl/api/supplier/search/$keyword'));
    return response;
  }

  Future<dynamic> getByName({required String name}) async {
    var response = await client.get(Uri.parse('$baseUrl/api/supplier/$name'));
    if (response.statusCode == 200) {
      supplierController.getSupplierByName(name: name);
    } else {
      Get.snackbar('Something wrong!', 'Supplier is not working right now',
          colorText: Colors.white,
          margin: REdgeInsets.all(15.r),
          backgroundColor: Colors.redAccent,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 2));
    }
    print(response.statusCode);
    return response;
  }
}
