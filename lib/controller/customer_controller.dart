import 'dart:convert';
import 'dart:ui';

import 'package:ebox_frontend_web_inventory/model/brands.dart';
import 'package:ebox_frontend_web_inventory/model/categories.dart';
import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:ebox_frontend_web_inventory/model/customer.dart';
import 'package:ebox_frontend_web_inventory/model/customers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api/brand_service.dart';
import '../api/category_service.dart';
import '../api/customer_service.dart';
import '../model/brand.dart';

class CustomerController extends GetxController {
  RxList<Customers> customersList = List<Customers>.empty(growable: true).obs;
  Rxn<Customer> customer = Rxn<Customer>();
  RxBool isCustomerLoading = false.obs;
  RxBool isCustomersLoading = false.obs;

  @override
  void onInit() async {
    getCustomers();
    super.onInit();
  }

  void delete({required int id}) async {
    await RemoteCustomerService.deleteById(id: id);
  }

  void updateCustomer({
    required int id,
    required String name,
    required String email,
    required String phone,
    required String address,
    required String city,
    required String shop_name,
    required String photo,
    required String bank_name,
    required String bank_number,
  }) async {
    try {
      await RemoteCustomerService().update(
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
      );
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
    required String shop_name,
    required String photo,
    required String bank_name,
    required String bank_number,
  }) async {
    try {
      await RemoteCustomerService().create(
        name: name,
        address: address,
        bank_name: bank_name,
        bank_number: bank_number,
        city: city,
        email: email,
        phone: phone,
        photo: photo,
        shop_name: shop_name,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getCustomers() async {
    try {
      isCustomersLoading(true);
      //call api
      var result = await RemoteCustomerService().get();
      if (result != null) {
        //assign api result
        customersList.assignAll(customersListFromJson(result.body));

        //save api result to local db
      }
    } finally {
      isCustomersLoading(false);
    }
  }

  void getCustomerById({required int id}) async {
    try {
      isCustomerLoading(true);
      //call api
      var result = await RemoteCustomerService().getById(id: id);

      if (result != null) {
        //assign api result
        customer.value = customerListFromJson(result.body);
        //save api result to local db
      }
    } finally {
      isCustomerLoading(false);
    }
  }
}
