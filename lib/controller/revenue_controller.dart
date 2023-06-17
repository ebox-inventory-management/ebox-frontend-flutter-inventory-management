import 'dart:convert';
import 'dart:ui';

import 'package:ebox_frontend_web_inventory/api/expense_service.dart';
import 'package:ebox_frontend_web_inventory/model/brands.dart';
import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:ebox_frontend_web_inventory/model/today_expense.dart';
import 'package:ebox_frontend_web_inventory/model/total_amount.dart';
import 'package:get/get.dart';

import '../api/category_service.dart';
import '../api/income_service.dart';
import '../api/revenue_service.dart';
import '../model/today_income.dart';
import '../model/today_revenue.dart';

class RevenueController extends GetxController {
  Rxn<TodayRevenue> revenueToday = Rxn<TodayRevenue>();
  Rxn<TotalAmount> revenueMonth = Rxn<TotalAmount>();
  Rxn<TotalAmount> revenueYear = Rxn<TotalAmount>();

  RxBool isRevenueTodayLoading = false.obs;
  RxBool isRevenueMonthLoading = false.obs;
  RxBool isRevenueYearLoading = false.obs;

  @override
  void onInit() async {
    getRevenueToday();
    getRevenueThisYear();
    getRevenueThisMonth();
    super.onInit();
  }

  void getRevenueToday() async {
    try {
      isRevenueTodayLoading(true);
      //call api
      var result = await RemoteRevenueService().getToday();

      if (result != null) {
        //assign api result
        revenueToday.value = todayRevenueFromJson(result.body);
      }
    } finally {
      isRevenueTodayLoading(false);
    }
  }

  void getRevenueThisMonth() async {
    try {
      isRevenueMonthLoading(true);
      //call api
      var result = await RemoteRevenueService().getThisMonth();
      if (result != null) {
        //assign api result
        revenueMonth.value = totalAmountListFromJson(result.body);
      }
    } finally {
      isRevenueMonthLoading(false);
    }
  }

  void getRevenueThisYear() async {
    try {
      isRevenueYearLoading(true);
      //call api
      var result = await RemoteRevenueService().getThisYear();

      if (result != null) {
        //assign api result
        revenueYear.value = totalAmountListFromJson(result.body);
      }
    } finally {
      isRevenueYearLoading(false);
    }
  }
}
