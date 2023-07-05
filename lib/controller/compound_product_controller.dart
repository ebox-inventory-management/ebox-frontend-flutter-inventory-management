import 'dart:convert';
import 'dart:ui';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ebox_frontend_web_inventory/model/compound_product.dart';
import 'package:ebox_frontend_web_inventory/model/compound_products.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;

import 'package:collection/collection.dart';
import 'package:ebox_frontend_web_inventory/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/compound_product_service.dart';
import '../model/product_compound.dart';
import '../model/products.dart';

import '../api/product_service.dart';
import 'controllers.dart';

class CompoundProductController extends GetxController {
  RxList<CompoundProducts> compoundProductsList =
      List<CompoundProducts>.empty(growable: true).obs;
  Rxn<CompoundProduct> compoundProduct = Rxn<CompoundProduct>();

  RxBool isCompoundProductsLoading = false.obs;
  RxBool isCompoundProductLoading = false.obs;

  TextEditingController searchCompoundProductsController =
      TextEditingController();
  RxString searchVal = ''.obs;

  final _productsCompound = {}.obs;
  Rxn<Products> product = Rxn<Products>();

  var token;

  @override
  void onInit() async {
    getCompoundProducts();
    super.onInit();
  }

  Future<void> addProduct(
      {required ProductCompound productCompound,
      required BuildContext context}) async {
    if (_productsCompound.containsKey(productCompound)) {
      _productsCompound[productCompound] += 1;
    } else {
      _productsCompound[productCompound] = 1;
    }
  }

  void removeProduct({required ProductCompound productCompound}) {
    if (_productsCompound.containsKey(productCompound) &&
        _productsCompound[productCompound] == 1) {
      _productsCompound.removeWhere((key, value) => key == productCompound);
    } else {
      _productsCompound[productCompound] -= 1;
    }
  }

  void deleteCompoundProduct({
    required int id,
    required String name,
  }) async {
    await RemoteCompoundProductService.delete(id: id, name: name, token: token);
  }

  void createCompoundProduct({
    required String name,
    required int price,
    required String description,
    required List<ProductCompound> productCompound,
  }) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      await RemoteCompoundProductService().create(
        token: token,
        description: description,
        name: name,
        price: price,
        productCompound: productCompound,
      );
      EasyLoading.dismiss();
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void getCompoundProducts() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isCompoundProductsLoading(true);
      //call api
      var result = await RemoteCompoundProductService().get(token: token);

      if (result != null) {
        //assign api result
        compoundProductsList
            .assignAll(compoundProductsListFromJson(result.body));
      }
    } finally {
      isCompoundProductsLoading(false);
    }
  }

  void getCompoundProductById({required int id}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isCompoundProductLoading(true);
      //call api
      var result =
          await RemoteCompoundProductService().getById(id: id, token: token);

      if (result != null) {
        //assign api result
        compoundProduct.value = compoundProductListFromJson(result.body);
      }
    } finally {
      isCompoundProductLoading(false);
    }
  }

  void getCompoundProductsByKeyword({required String keyword}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isCompoundProductsLoading(true);
      //call api
      var result = await RemoteCompoundProductService()
          .getByKeyword(keyword: keyword, token: token);

      if (result != null) {
        //assign api result
        compoundProductsList
            .assignAll(compoundProductsListFromJson(result.body));
      }
    } finally {
      isCompoundProductsLoading(false);
    }
  }

  get productsCompound => _productsCompound;

  get totalPrice => _productsCompound.entries
      .map((data) => data.key.price * data.value)
      .toList()
      .reduce((value, element) => value + element);

  get totalQuantity => _productsCompound.entries
      .map((data) => data.value)
      .toList()
      .reduce((value, element) => value + element);

  /// all productsCompound id in list
  get idProductsCompound =>
      _productsCompound.entries.map((data) => data.key.id).toList();

  /// display productsCompound name with quantity of them
  get productsCompoundWithQuantity => _productsCompound.entries
      .map((data) => '${data.key.namedata} * ${data.value}, ')
      .toList()
      .reduce((value, element) => value + element);
}
