import 'dart:convert';
import 'dart:ui';

import 'package:ebox_frontend_web_inventory/model/brands.dart';
import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:ebox_frontend_web_inventory/model/supplier.dart';
import 'package:ebox_frontend_web_inventory/model/suppliers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/category_service.dart';
import '../api/supplier_service.dart';

class SupplierController extends GetxController {
  RxList<Suppliers> suppliersList = List<Suppliers>.empty(growable: true).obs;
  Rxn<Supplier> supplier = Rxn<Supplier>();

  RxBool isSuppliersLoading = false.obs;
  RxBool isSupplierLoading = false.obs;
  TextEditingController searchSuppliersController = TextEditingController();
  RxString searchVal = ''.obs;
  var token;
  @override
  void onInit() async {
    getSuppliers();
    super.onInit();
  }

  void delete({required int id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    await RemoteSupplierService.deleteById(id: id, token: token);
  }

  void updateSupplier({
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
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      await RemoteSupplierService().update(
          id: id,
          name: name,
          address: address,
          bank_name: bank_name,
          bank_number: bank_number,
          city: city,
          email: email,
          phone: phone,
          photo: photo,
          shop_name: shop_name,
          type: type,
          token: token);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void create({
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
  }) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      await RemoteSupplierService().create(
          name: name,
          address: address,
          bank_name: bank_name,
          bank_number: bank_number,
          city: city,
          email: email,
          phone: phone,
          photo: photo,
          shop_name: shop_name,
          type: type,
          token: token);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getSuppliers() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isSuppliersLoading(true);
      //call api
      var result = await RemoteSupplierService().get(token: token);
      if (result != null) {
        //assign api result
        suppliersList.assignAll(suppliersListFromJson(result.body));
      }
    } finally {
      isSuppliersLoading(false);
    }
  }

  void getSupplierById({required int id}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isSupplierLoading(true);
      //call api
      var result = await RemoteSupplierService().getById(id: id, token: token);

      if (result != null) {
        //assign api result
        supplier.value = supplierListFromJson(result.body);
      }
    } finally {
      isSupplierLoading(false);
    }
  }

  void getSupplierByName({required String name}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isSupplierLoading(true);
      //call api
      var result =
          await RemoteSupplierService().getByName(name: name, token: token);

      if (result != null) {
        //assign api result
        supplier.value = supplierListFromJson(result.body);
      }
    } finally {
      isSupplierLoading(false);
    }
  }

  void getSupplierByKeyword({required String keyword}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isSuppliersLoading(true);
      //call api
      var result = await RemoteSupplierService()
          .getByKeyword(keyword: keyword, token: token);

      if (result != null) {
        //assign api result
        suppliersList.assignAll(suppliersListFromJson(result.body));
      }
    } finally {
      isSuppliersLoading(false);
    }
  }
}
