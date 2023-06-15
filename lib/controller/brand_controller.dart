import 'dart:convert';
import 'dart:ui';

import 'package:ebox_frontend_web_inventory/model/brands.dart';
import 'package:ebox_frontend_web_inventory/model/categories.dart';
import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:get/get.dart';

import '../api/brand_service.dart';
import '../api/category_service.dart';
import '../model/brand.dart';

class BrandController extends GetxController {
  RxList<Brands> brandsList = List<Brands>.empty(growable: true).obs;
  Rxn<Brand> brand = Rxn<Brand>();
  RxBool isBrandLoading = false.obs;
  RxBool isBrandsLoading = false.obs;

  @override
  void onInit() async {
    getBrands();
    super.onInit();
  }

  void getBrands() async {
    try {
      isBrandsLoading(true);
      //call api
      var result = await RemoteBrandService().get();
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
      isBrandLoading(true);
      //call api
      var result = await RemoteBrandService().getById(id: id);

      if (result != null) {
        //assign api result
        brand.value = brandListFromJson(result.body);
        //save api result to local db
      }
    } finally {
      isBrandLoading(false);
    }
  }
}
