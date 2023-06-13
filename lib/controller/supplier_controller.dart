import 'dart:convert';
import 'dart:ui';

import 'package:ebox_frontend_web_inventory/model/categories.dart';
import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:ebox_frontend_web_inventory/model/supplier.dart';
import 'package:ebox_frontend_web_inventory/model/suppliers.dart';
import 'package:get/get.dart';

import '../api/category_service.dart';
import '../api/supplier_service.dart';

class SupplierController extends GetxController {
  RxList<Suppliers> suppliersList = List<Suppliers>.empty(growable: true).obs;
  Rxn<Supplier> category = Rxn<Supplier>();

  RxBool isSuppliersLoading = false.obs;
  RxBool isSupplierLoading = false.obs;

  @override
  void onInit() async {
    getSuppliers();
    super.onInit();
  }

  void getSuppliers() async {
    try {
      isSuppliersLoading(true);
      //call api
      var result = await RemoteSupplierService().get();
      if (result != null) {
        //assign api result
        suppliersList.assignAll(suppliersListFromJson(result.body));

        //save api result to local db
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
        category.value = supplierListFromJson(result.body);
        //save api result to local db
      }
    } finally {
      isSupplierLoading(false);
    }
  }
}
