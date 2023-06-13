import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:ebox_frontend_web_inventory/api/product_service.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ImportController extends GetxController {
  void createProduct({
    required int category_id,
    required int supplier_id,
    required int brand_id,
    required String product_name,
    required String product_code,
    required String product_garage,
    required String product_route,
    required String product_image,
    required String buy_date,
    required String expire_date,
    required String buying_price,
    required String price,
  }) async {
    try {
      print('true');
      await RemoteProductService().create(
          category_id: category_id,
          supplier_id: supplier_id,
          brand_id: brand_id,
          product_code: product_code,
          price: price,
          product_garage: product_garage,
          product_image: product_image,
          product_name: product_name,
          product_route: product_route,
          buying_price: buying_price,
          buy_date: buy_date,
          expire_date: expire_date);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
