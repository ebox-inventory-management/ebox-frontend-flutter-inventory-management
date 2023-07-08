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

  var token;
  @override
  void onInit() async {
    getProducts();
    super.onInit();
  }

  void deleteProduct({
    required int id,
    required String name,
  }) async {
    await RemoteProductService.delete(id: id, name: name, token: token);
  }

  void updateProduct({
    required int category_id,
    required int supplier_id,
    required int brand_id,
    required String product_name,
    required String description,
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
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
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
          id: id,
          token: token,
          description: description);
      EasyLoading.dismiss();
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong!');
    } finally {
      EasyLoading.dismiss();
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
    required String description,
    required PlatformFile product_image,
    required String expire_date,
    required int import_price,
    required int export_price,
  }) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
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
        token: token,
        description: description,
      );
      EasyLoading.dismiss();
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void getProducts() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isProductsLoading(true);
      //call api
      var result = await RemoteProductService().get(token: token);

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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isProductLoading(true);
      //call api
      var result = await RemoteProductService().getById(id: id, token: token);

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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isProductsLoading(true);
      //call api
      var result = await RemoteProductService()
          .getByKeyword(keyword: keyword, token: token);

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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isProductLoading(true);
      //call api
      var result =
          await RemoteProductService().getByName(name: name, token: token);

      if (result != null) {
        //assign api result
        product.value = productListFromJson(result.body);
      }
    } finally {
      isProductLoading(false);
    }
  }
}
