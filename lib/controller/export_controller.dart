import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:ebox_frontend_web_inventory/api/import_service.dart';
import 'package:ebox_frontend_web_inventory/api/product_service.dart';
import 'package:ebox_frontend_web_inventory/model/export.dart';
import 'package:ebox_frontend_web_inventory/model/import.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

class ExportController extends GetxController {
  RxList<Export> exportList = List<Export>.empty(growable: true).obs;
  RxBool isExportLoading = false.obs;

  @override
  void onInit() async {
    getExports();
    super.onInit();
  }

  void create({
    required int productId,
    required int product_quantity,
  }) async {
    try {
      await RemoteImportService()
          .create(productId: productId, product_quantity: product_quantity);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getExports() async {
    try {
      isExportLoading(true);
      //call api
      var result = await RemoteImportService().get();
      if (result != null) {
        //assign api result
        exportList.assignAll(exportListFromJson(result.body));

        //save api result to local db
      }
    } finally {
      isExportLoading(false);
    }
  }
}
