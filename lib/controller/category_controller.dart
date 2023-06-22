import 'dart:convert';
import 'dart:ui';

import 'package:ebox_frontend_web_inventory/model/brands.dart';
import 'package:ebox_frontend_web_inventory/model/categories.dart';
import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  @override
  void onInit() async {
    getCategories();
    super.onInit();
  }

  void delete({required int id}) async {
    await RemoteCategoryService.deleteById(id: id);
  }

  void updateCategory({
    required int id,
    required String name,
  }) async {
    try {
      await RemoteCategoryService().update(id: id, name: name);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void create({
    required String name,
  }) async {
    try {
      await RemoteCategoryService().create(name: name);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getCategories() async {
    try {
      isCategoriesLoading(true);
      //call api
      var result = await RemoteCategoryService().get();
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
      isCategoryLoading(true);
      //call api
      var result = await RemoteCategoryService().getById(id: id);

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
      isCategoriesLoading(true);
      //call api
      var result = await RemoteCategoryService().getByKeyword(keyword: keyword);

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
      isCategoryLoading(true);
      //call api
      var result = await RemoteCategoryService().getByName(name: name);

      if (result != null) {
        //assign api result
        category.value = categoryListFromJson(result.body);
      }
    } finally {
      isCategoryLoading(false);
    }
  }
}
