import 'dart:convert';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:ebox_frontend_web_inventory/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/products.dart';

import '../api/product_service.dart';
import 'controllers.dart';

class ProductController extends GetxController {
  RxList<Products> productList = List<Products>.empty(growable: true).obs;
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

  void deleteProduct({required int id}) async {
    await RemoteProductService.delete(id: id);
  }

  void updateProduct({
    required int category_id,
    required int supplier_id,
    required int brand_id,
    required int id,
    required String product_name,
    required String product_code,
    required String product_garage,
    required String product_route,
    required String product_image,
    required String buy_date,
    required String expire_date,
    required String buying_price,
    required int product_quantity,
    required String price,
  }) async {
    try {
      await RemoteProductService().update(
          category_id: category_id,
          supplier_id: supplier_id,
          brand_id: brand_id,
          product_code: product_code,
          export_price: price,
          product_garage: product_garage,
          product_image: product_image,
          product_name: product_name,
          product_route: product_route,
          import_price: buying_price,
          buy_date: buy_date,
          expire_date: expire_date,
          product_quantity: product_quantity,
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
    required String product_image,
    required String buy_date,
    required String expire_date,
    required String buying_price,
    required int product_quantity,
    required String price,
  }) async {
    try {
      await RemoteProductService().create(
          category_id: category_id,
          supplier_id: supplier_id,
          brand_id: brand_id,
          product_code: product_code,
          export_price: price,
          product_garage: product_garage,
          product_image: product_image,
          product_name: product_name,
          product_route: product_route,
          import_price: buying_price,
          buy_date: buy_date,
          expire_date: expire_date,
          product_quantity: product_quantity);
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
        productList.assignAll(productsListFromJson(result.body));
        //save api result to local db
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
        //save api result to local db
      }
    } finally {
      isProductLoading(false);
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
        //save api result to local db
      }
    } finally {
      isProductLoading(false);
    }
  }
}
