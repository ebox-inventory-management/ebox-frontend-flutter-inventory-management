import 'dart:convert';
import 'dart:ui';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/ad_banner.dart';

import '../api/banner_service.dart';

class HomeController extends GetxController {
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;

  RxBool isBannerLoading = false.obs;

  @override
  void onInit() async {
    getAdBanners();

    super.onInit();
  }

  void getAdBanners() async {
    try {
      isBannerLoading(true);
      //call api
      var result = await RemoteBannerService().get();
      if (result != null) {
        //assign api result
        bannerList.assignAll(adBannerListFromJson(result.body));
        //save api result to local db
      }
    } finally {
      isBannerLoading(false);
    }
  }
}
