import 'dart:convert';
import 'dart:ui';

import 'package:ebox_frontend_web_inventory/model/brands.dart';
import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:ebox_frontend_web_inventory/model/total_amount.dart';
import 'package:get/get.dart';

import '../api/category_service.dart';
import '../api/income_service.dart';
import '../model/today_income.dart';

class IncomeController extends GetxController {
  Rxn<TodayIncome> incomeToday = Rxn<TodayIncome>();
  Rxn<TotalAmount> incomesMonth = Rxn<TotalAmount>();
  Rxn<TotalAmount> incomesYear = Rxn<TotalAmount>();

  RxBool isIncomesLoading = false.obs;
  RxBool isIncomeTodayLoading = false.obs;
  RxBool isIncomesMonthLoading = false.obs;
  RxBool isIncomeYearLoading = false.obs;

  @override
  void onInit() async {
    getIncomeToday();
    getIncomeThisYear();
    getIncomeThisMonth();
    super.onInit();
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
