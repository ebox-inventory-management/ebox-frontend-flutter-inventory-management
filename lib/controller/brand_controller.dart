import 'dart:convert';
import 'dart:ui';

import 'package:ebox_frontend_web_inventory/model/brands.dart';
import 'package:ebox_frontend_web_inventory/model/categories.dart';
import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/brand_service.dart';
import '../api/category_service.dart';
import '../model/brand.dart';

class BrandController extends GetxController {
  RxList<Brands> brandsList = List<Brands>.empty(growable: true).obs;
  Rxn<Brand> brand = Rxn<Brand>();
  RxBool isBrandLoading = false.obs;
  RxBool isBrandsLoading = false.obs;
  TextEditingController searchBrandsController = TextEditingController();
  RxString searchVal = ''.obs;
  var token;

  @override
  void onInit() async {
    getBrands();
    super.onInit();
  }

  void deleteBrand({required int id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    await RemoteBrandService.deleteById(id: id, token: token);
  }

  void updateBrand({
    required int id,
    required String name,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    try {
      await RemoteBrandService().update(id: id, name: name, token: token);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void create({
    required String name,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    try {
      await RemoteBrandService().create(name: name, token: token);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getBrands() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isBrandsLoading(true);
      //call api
      var result = await RemoteBrandService().get(token: token);
      if (result != null) {
        //assign api result
        brandsList.assignAll(brandsListFromJson(result.body));

        //save api result to local db
      }
    } finally {
      isBrandsLoading(false);
    }
  }

  void getBrandById({required int id}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isBrandLoading(true);
      //call api
      var result = await RemoteBrandService().getById(id: id, token: token);

      if (result != null) {
        //assign api result
        brand.value = brandListFromJson(result.body);
        //save api result to local db
      }
    } finally {
      isBrandLoading(false);
    }
  }

  void getBrandsByKeyword({required String keyword}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isBrandsLoading(true);
      //call api
      var result = await RemoteBrandService()
          .getByKeyword(keyword: keyword, token: token);

      if (result != null) {
        //assign api result
        brandsList.assignAll(brandsListFromJson(result.body));
      }
    } finally {
      isBrandsLoading(false);
    }
  }

  void getBrandByName({required String name}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isBrandLoading(true);
      //call api
      var result =
          await RemoteBrandService().getByName(name: name, token: token);

      if (result != null) {
        //assign api result
        brand.value = brandListFromJson(result.body);
      }
    } finally {
      isBrandLoading(false);
    }
  }
}
