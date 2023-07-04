import 'dart:convert';
import 'dart:ui';

import 'package:ebox_frontend_web_inventory/model/brands.dart';
import 'package:ebox_frontend_web_inventory/model/categories.dart';
import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/category_service.dart';
import 'controllers.dart';

class CategoryController extends GetxController {
  RxList<Categories> categoriesList =
      List<Categories>.empty(growable: true).obs;
  Rxn<Category> category = Rxn<Category>();
  RxBool isCategoryLoading = false.obs;
  RxBool isCategoriesLoading = false.obs;
  TextEditingController searchCategoriesController = TextEditingController();
  RxString searchVal = ''.obs;
  var token;
  @override
  void onInit() async {
    getCategories();
    super.onInit();
  }

  void delete({required int id}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    await RemoteCategoryService.deleteById(id: id, token: token);
  }

  void updateCategory({
    required int id,
    required String name,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    try {
      await RemoteCategoryService().update(id: id, name: name, token: token);
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
      await RemoteCategoryService().create(name: name, token: token);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getCategories() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isCategoriesLoading(true);
      //call api
      var result = await RemoteCategoryService().get(token: token);
      if (result != null) {
        //assign api result
        categoriesList.assignAll(categoriesListFromJson(result.body));
      }
    } finally {
      isCategoriesLoading(false);
    }
  }

  void getCategoryById({required int id}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isCategoryLoading(true);
      //call api
      var result = await RemoteCategoryService().getById(id: id, token: token);

      if (result != null) {
        //assign api result
        category.value = categoryListFromJson(result.body);
      }
    } finally {
      isCategoryLoading(false);
    }
  }

  void getCategoryByKeyword({required String keyword}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isCategoriesLoading(true);
      //call api
      var result = await RemoteCategoryService()
          .getByKeyword(keyword: keyword, token: token);

      if (result != null) {
        //assign api result
        categoriesList.assignAll(categoriesListFromJson(result.body));
      }
    } finally {
      isCategoriesLoading(false);
    }
  }

  void getCategoryByName({required String name}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isCategoryLoading(true);
      //call api
      var result =
          await RemoteCategoryService().getByName(name: name, token: token);

      if (result != null) {
        //assign api result
        category.value = categoryListFromJson(result.body);
      }
    } finally {
      isCategoryLoading(false);
    }
  }
}
