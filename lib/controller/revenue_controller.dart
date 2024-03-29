import 'dart:convert';
import 'dart:ui';

import 'package:ebox_frontend_web_inventory/api/expense_service.dart';
import 'package:ebox_frontend_web_inventory/model/brands.dart';
import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:ebox_frontend_web_inventory/model/today_expense.dart';
import 'package:ebox_frontend_web_inventory/model/total_amount.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/category_service.dart';
import '../api/income_service.dart';
import '../api/revenue_service.dart';
import '../model/range_revenue.dart';
import '../model/today_income.dart';
import '../model/today_revenue.dart';

class RevenueController extends GetxController {
  Rxn<TodayRevenue> revenueToday = Rxn<TodayRevenue>();
  Rxn<TotalAmount> revenueMonth = Rxn<TotalAmount>();
  Rxn<TotalAmount> revenueYear = Rxn<TotalAmount>();
  RxList<RangeRevenues> rangeRevenuesList =
      List<RangeRevenues>.empty(growable: true).obs;

  RxBool isRevenueTodayLoading = false.obs;
  RxBool isRevenueMonthLoading = false.obs;
  RxBool isRevenueYearLoading = false.obs;
  RxBool isRangeRevenuesLoading = false.obs;
  DateTime now = DateTime.now();
  var token;
  @override
  void onInit() async {
    getRevenueToday();
    getRevenueThisYear();
    getRevenueThisMonth();
    getRange(
        start: DateTime(now.year, now.month - 1, now.day).toString(),
        end: DateTime(now.year, now.month, now.day + 1).toString());
    super.onInit();
  }

  void getRange({required String start, required String end}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isRangeRevenuesLoading(true);
      //call api
      var result = await RemoteRevenueService()
          .getRange(end: end, start: start, token: token);

      if (result != null) {
        //assign api result
        rangeRevenuesList.assignAll(rangeRevenuesListFromJson(result.body));
      }
    } finally {
      isRangeRevenuesLoading(false);
    }
  }

  void getRevenueToday() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isRevenueTodayLoading(true);
      //call api
      var result = await RemoteRevenueService().getToday(token: token);

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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isRevenueMonthLoading(true);
      //call api
      var result = await RemoteRevenueService().getThisMonth(token: token);
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
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isRevenueYearLoading(true);
      //call api
      var result = await RemoteRevenueService().getThisYear(token: token);

      if (result != null) {
        //assign api result
        revenueYear.value = totalAmountListFromJson(result.body);
      }
    } finally {
      isRevenueYearLoading(false);
    }
  }
}
