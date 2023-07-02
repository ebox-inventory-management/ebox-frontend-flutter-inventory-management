import 'dart:convert';
import 'dart:ui';

import 'package:ebox_frontend_web_inventory/model/brands.dart';
import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:ebox_frontend_web_inventory/model/range_incomes.dart';
import 'package:ebox_frontend_web_inventory/model/total_amount.dart';
import 'package:get/get.dart';

import '../api/category_service.dart';
import '../api/income_service.dart';
import '../model/today_income.dart';

class IncomeController extends GetxController {
  Rxn<TodayIncome> incomeToday = Rxn<TodayIncome>();
  Rxn<TotalAmount> incomesMonth = Rxn<TotalAmount>();
  Rxn<TotalAmount> incomesYear = Rxn<TotalAmount>();
  RxList<RangeIncomes> rangeIncomesList =
      List<RangeIncomes>.empty(growable: true).obs;

  RxBool isIncomesLoading = false.obs;
  RxBool isIncomeTodayLoading = false.obs;
  RxBool isIncomesMonthLoading = false.obs;
  RxBool isIncomeYearLoading = false.obs;
  RxBool isRangeIncomesLoading = false.obs;
  DateTime now = DateTime.now();

  @override
  void onInit() async {
    getIncomeToday();
    getIncomeThisYear();
    getIncomeThisMonth();
    getRange(
        start: DateTime(now.year, now.month - 1, now.day).toString(),
        end: DateTime(now.year, now.month, now.day + 1).toString());
    super.onInit();
  }

  void getRange({required String start, required String end}) async {
    try {
      isRangeIncomesLoading(true);
      //call api
      var result = await RemoteIncomeService().getRange(end: end, start: start);

      if (result != null) {
        //assign api result
        rangeIncomesList.assignAll(rangeIncomesListFromJson(result.body));
      }
    } finally {
      isRangeIncomesLoading(false);
    }
  }

  void getIncomeToday() async {
    try {
      isIncomeTodayLoading(true);
      //call api
      var result = await RemoteIncomeService().getToday();

      if (result != null) {
        //assign api result
        incomeToday.value = incomeTodayFromJson(result.body);
      }
    } finally {
      isIncomeTodayLoading(false);
    }
  }

  void getIncomeThisMonth() async {
    try {
      isIncomesMonthLoading(true);
      //call api
      var result = await RemoteIncomeService().getThisMonth();
      if (result != null) {
        //assign api result
        incomesMonth.value = totalAmountListFromJson(result.body);
      }
    } finally {
      isIncomesMonthLoading(false);
    }
  }

  void getIncomeThisYear() async {
    try {
      isIncomeYearLoading(true);
      //call api
      var result = await RemoteIncomeService().getThisYear();

      if (result != null) {
        //assign api result
        incomesYear.value = totalAmountListFromJson(result.body);
      }
    } finally {
      isIncomeYearLoading(false);
    }
  }
}
