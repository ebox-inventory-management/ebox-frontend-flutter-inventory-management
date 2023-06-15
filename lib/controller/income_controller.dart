import 'dart:convert';
import 'dart:ui';

import 'package:ebox_frontend_web_inventory/model/brands.dart';
import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:ebox_frontend_web_inventory/model/incomes_month.dart';
import 'package:ebox_frontend_web_inventory/model/incomes_year.dart';
import 'package:get/get.dart';

import '../api/category_service.dart';
import '../api/income_service.dart';
import '../model/income_today.dart';
import '../model/incomes.dart';

class IncomeController extends GetxController {
  RxList<Incomes> incomesList = List<Incomes>.empty(growable: true).obs;
  Rxn<IncomeToday> incomeToday = Rxn<IncomeToday>();
  Rxn<IncomesMonth> incomesMonth = Rxn<IncomesMonth>();
  Rxn<IncomesYear> incomesYearList = Rxn<IncomesYear>();

  RxBool isIncomesLoading = false.obs;
  RxBool isIncomeTodayLoading = false.obs;
  RxBool isIncomesMonthLoading = false.obs;
  RxBool isIncomeYearLoading = false.obs;

  @override
  void onInit() async {
    getIncomes();
    getIncomeToday();
    getIncomeThisYear();
    getIncomeByMonth();
    super.onInit();
  }

  void getIncomes() async {
    try {
      isIncomesLoading(true);
      //call api
      var result = await RemoteIncomeService().get();
      if (result != null) {
        //assign api result
        incomesList.assignAll(incomeListFromJson(result.body));
      }
    } finally {
      isIncomesLoading(false);
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

  void getIncomeByMonth() async {
    try {
      isIncomesMonthLoading(true);
      //call api
      var result = await RemoteIncomeService()
          .getByMonth(month: '0${DateTime.now().month}');
      if (result != null) {
        //assign api result
        incomesMonth.value = incomesMonthListFromJson(result.body);
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
        incomesYearList.value = incomesYearListFromJson(result.body);
      }
    } finally {
      isIncomeYearLoading(false);
    }
  }
}
