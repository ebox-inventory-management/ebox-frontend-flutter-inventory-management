import 'dart:convert';
import 'dart:ui';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

import 'package:collection/collection.dart';
import 'package:ebox_frontend_web_inventory/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/products.dart';

import '../api/product_service.dart';
import 'controllers.dart';

class ProductController extends GetxController {
  RxList<Products> productsList = List<Products>.empty(growable: true).obs;
  Rxn<Product> product = Rxn<Product>();

  RxBool isProductsLoading = false.obs;
  RxBool isProductLoading = false.obs;

  TextEditingController searchProductsController = TextEditingController();
  RxString searchVal = ''.obs;

  @override
  void onInit() async {
    getProducts();
    super.onInit();
  }

  void deleteProduct({
    required int id,
    required String name,
  }) async {
    await RemoteProductService.delete(id: id, name: name);
  }

  void updateProduct({
    required int category_id,
    required int supplier_id,
    required int brand_id,
    required String product_name,
    required String product_code,
    required String product_garage,
    required String product_route,
    required PlatformFile product_image,
    required String expire_date,
    required int import_price,
    required int export_price,
    required int id,
  }) async {
    try {
      await RemoteProductService().update(
          category_id: category_id,
          supplier_id: supplier_id,
          brand_id: brand_id,
          product_code: product_code,
          export_price: export_price,
          product_garage: product_garage,
          product_image: product_image,
          product_name: product_name,
          product_route: product_route,
          import_price: import_price,
          expire_date: expire_date,
          id: id);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void createProduct({
    required int category_id,
    required int supplier_id,
    required int brand_id,
    required String product_name,
    required String product_code,
    required String product_garage,
    required String product_route,
    required PlatformFile product_image,
    required String expire_date,
    required int import_price,
    required int export_price,
  }) async {
    try {
      await RemoteProductService().create(
        category_id: category_id,
        supplier_id: supplier_id,
        brand_id: brand_id,
        product_code: product_code,
        export_price: export_price,
        product_garage: product_garage,
        product_image: product_image,
        product_name: product_name,
        product_route: product_route,
        import_price: import_price,
        expire_date: expire_date,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getProducts() async {
    try {
      isProductsLoading(true);
      //call api
      var result = await RemoteProductService().get();

      if (result != null) {
        //assign api result
        productsList.assignAll(productsListFromJson(result.body));
      }
    } finally {
      isProductsLoading(false);
    }
  }

  void getProductsById({required int id}) async {
    try {
      isProductLoading(true);
      //call api
      var result = await RemoteProductService().getById(id: id);

      if (result != null) {
        //assign api result
        product.value = productListFromJson(result.body);
      }
    } finally {
      isProductLoading(false);
    }
  }

  void getProductsByKeyword({required String keyword}) async {
    try {
      isProductsLoading(true);
      //call api
      var result = await RemoteProductService().getByKeyword(keyword: keyword);

      if (result != null) {
        //assign api result
        productsList.assignAll(productsListFromJson(result.body));
      }
    } finally {
      isProductsLoading(false);
    }
  }

  void getProductsByName({required String name}) async {
    try {
      isProductLoading(true);
      //call api
      var result = await RemoteProductService().getByName(name: name);

      if (result != null) {
        //assign api result
        product.value = productListFromJson(result.body);
      }
    } finally {
      isProductLoading(false);
    }
  }
}
