import 'dart:convert';
import 'dart:ui';

import 'package:ebox_frontend_web_inventory/model/brands.dart';
import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:ebox_frontend_web_inventory/model/supplier.dart';
import 'package:ebox_frontend_web_inventory/model/suppliers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/category_service.dart';
import '../api/supplier_service.dart';

class SupplierController extends GetxController {
  RxList<Suppliers> suppliersList = List<Suppliers>.empty(growable: true).obs;
  Rxn<Supplier> supplier = Rxn<Supplier>();

  RxBool isSuppliersLoading = false.obs;
  RxBool isSupplierLoading = false.obs;
  TextEditingController searchSuppliersController = TextEditingController();
  RxString searchVal = ''.obs;
  @override
  void onInit() async {
    getSuppliers();
    super.onInit();
  }

  void delete({required int id}) async {
    await RemoteSupplierService.deleteById(id: id);
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
    required String photo,
    required String bank_name,
    required String bank_number,
  }) async {
    try {
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
          type: type);
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
    required String photo,
    required String bank_name,
    required String bank_number,
  }) async {
    try {
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
          type: type);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getSuppliers() async {
    try {
      isSuppliersLoading(true);
      //call api
      var result = await RemoteSupplierService().get();
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
      isSupplierLoading(true);
      //call api
      var result = await RemoteSupplierService().getById(id: id);

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
      isSupplierLoading(true);
      //call api
      var result = await RemoteSupplierService().getByName(name: name);

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
      isSuppliersLoading(true);
      //call api
      var result = await RemoteSupplierService().getByKeyword(keyword: keyword);

      if (result != null) {
        //assign api result
        suppliersList.assignAll(suppliersListFromJson(result.body));
      }
    } finally {
      isSuppliersLoading(false);
    }
  }
}
