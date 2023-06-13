import 'dart:convert';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/product.dart';

import '../api/product_service.dart';
import 'controllers.dart';

class ProductController extends GetxController {
  RxList<Product> productList = List<Product>.empty(growable: true).obs;

  RxBool isProductLoading = false.obs;

  @override
  void onInit() async {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isProductLoading(true);
      //call api
      var result = await RemoteProductService().get();

      if (result != null) {
        //assign api result
        productList.assignAll(productListFromJson(result.body));
        //save api result to local db
      }
    } finally {
      isProductLoading(false);
    }
  }
}
