import 'dart:convert';
import 'dart:ui';

import 'package:ebox_frontend_web_inventory/model/brands.dart';
import 'package:ebox_frontend_web_inventory/model/categories.dart';
import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:ebox_frontend_web_inventory/model/customer.dart';
import 'package:ebox_frontend_web_inventory/model/customers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/brand_service.dart';
import '../api/category_service.dart';
import '../api/customer_service.dart';
import '../model/brand.dart';

class CustomerController extends GetxController {
  RxList<Customers> customersList = List<Customers>.empty(growable: true).obs;
  Rxn<Customer> customer = Rxn<Customer>();
  RxBool isCustomerLoading = false.obs;
  RxBool isCustomersLoading = false.obs;
  TextEditingController searchCustomersController = TextEditingController();
  RxString searchVal = ''.obs;
  var token;
  @override
  void onInit() async {
    getCustomers();
    super.onInit();
  }

  void delete({required int id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    await RemoteCustomerService.deleteById(id: id, token: token);
  }

  void updateCustomer({
    required int id,
    required String name,
    required String email,
    required String phone,
    required String address,
    required String city,
    required String shop_name,
    required PlatformFile photo,
    required String bank_name,
    required String bank_number,
  }) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
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
        token: token,
      );
      EasyLoading.dismiss();
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void create({
    required String name,
    required String email,
    required String phone,
    required String address,
    required String city,
    required String shop_name,
    required PlatformFile photo,
    required String bank_name,
    required String bank_number,
  }) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
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
        token: token,
      );
      EasyLoading.dismiss();
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void getCustomers() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isCustomersLoading(true);
      //call api
      var result = await RemoteCustomerService().get(token: token);
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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isCustomerLoading(true);
      //call api
      var result = await RemoteCustomerService().getById(id: id, token: token);

      if (result != null) {
        //assign api result
        customer.value = customerListFromJson(result.body);
        //save api result to local db
      }
    } finally {
      isCustomerLoading(false);
    }
  }

  void getCustomerByKeyword({required String keyword}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isCustomersLoading(true);
      //call api
      var result = await RemoteCustomerService()
          .getByKeyword(keyword: keyword, token: token);

      if (result != null) {
        //assign api result
        customersList.assignAll(customersListFromJson(result.body));
      }
    } finally {
      isCustomersLoading(false);
    }
  }

  void getCustomerByName({required String keyword}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isCustomersLoading(true);
      //call api
      var result = await RemoteCustomerService()
          .getByName(keyword: keyword, token: token);

      if (result != null) {
        //assign api result
        customersList.assignAll(customersListFromJson(result.body));
        //save api result to local db
      }
    } finally {
      isCustomersLoading(false);
    }
  }
}
