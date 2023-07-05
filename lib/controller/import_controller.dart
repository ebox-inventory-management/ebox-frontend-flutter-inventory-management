import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:ebox_frontend_web_inventory/api/import_service.dart';
import 'package:ebox_frontend_web_inventory/api/product_service.dart';
import 'package:ebox_frontend_web_inventory/model/import.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ImportController extends GetxController {
  RxList<Import> importList = List<Import>.empty(growable: true).obs;
  RxBool isImportLoading = false.obs;
  var token;
  @override
  void onInit() async {
    getImports();
    super.onInit();
  }

  void create({
    required int productId,
    required int product_quantity,
  }) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      await RemoteImportService().create(
          productId: productId,
          product_quantity: product_quantity,
          token: token);
      EasyLoading.dismiss();
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void getImports() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isImportLoading(true);
      //call api
      var result = await RemoteImportService().get(token: token);
      if (result != null) {
        //assign api result
        importList.assignAll(importListFromJson(result.body));

        //save api result to local db
      }
    } finally {
      isImportLoading(false);
    }
  }
}
