import 'dart:convert';
import 'dart:ui';

import 'package:ebox_frontend_web_inventory/model/brands.dart';
import 'package:ebox_frontend_web_inventory/model/categories.dart';
import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:ebox_frontend_web_inventory/model/customer.dart';
import 'package:ebox_frontend_web_inventory/model/customers.dart';
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
