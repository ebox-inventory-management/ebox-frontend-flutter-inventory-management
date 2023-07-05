import 'dart:convert';
import 'dart:ui';

import 'package:ebox_frontend_web_inventory/api/expense_service.dart';
import 'package:ebox_frontend_web_inventory/model/brands.dart';
import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:ebox_frontend_web_inventory/model/range_expenses.dart';
import 'package:ebox_frontend_web_inventory/model/today_expense.dart';
import 'package:ebox_frontend_web_inventory/model/total_amount.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/category_service.dart';
import '../api/income_service.dart';
import '../model/today_income.dart';

class ExpenseController extends GetxController {
  Rxn<TodayExpense> expenseToday = Rxn<TodayExpense>();
  Rxn<TotalAmount> expenseMonth = Rxn<TotalAmount>();
  Rxn<TotalAmount> expenseYear = Rxn<TotalAmount>();
  RxList<RangeExpenses> rangeExpensesList =
      List<RangeExpenses>.empty(growable: true).obs;

  RxBool isExpenseTodayLoading = false.obs;
  RxBool isExpenseMonthLoading = false.obs;
  RxBool isExpenseYearLoading = false.obs;
  RxBool isRangeExpensesLoading = false.obs;
  DateTime now = DateTime.now();
  var token;
  @override
  void onInit() async {
    getExpenseToday();
    getExpenseThisYear();
    getExpenseThisMonth();
    getRange(
        start: DateTime(now.year, now.month - 1, now.day).toString(),
        end: DateTime(now.year, now.month, now.day + 1).toString());
    super.onInit();
  }

  void getRange({required String start, required String end}) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isRangeExpensesLoading(true);
      //call api
      var result = await RemoteExpenseService()
          .getRange(end: end, start: start, token: token);

      if (result != null) {
        //assign api result
        rangeExpensesList.assignAll(rangeExpensesListFromJson(result.body));
      }
    } finally {
      isRangeExpensesLoading(false);
    }
  }

  void getExpenseToday() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isExpenseTodayLoading(true);
      //call api
      var result = await RemoteExpenseService().getToday(token: token);

      if (result != null) {
        //assign api result
        expenseToday.value = expenseTodayFromJson(result.body);
      }
    } finally {
      isExpenseTodayLoading(false);
    }
  }

  void getExpenseThisMonth() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isExpenseMonthLoading(true);
      //call api
      var result = await RemoteExpenseService().getThisMonth(token: token);
      if (result != null) {
        //assign api result
        expenseMonth.value = totalAmountListFromJson(result.body);
      }
    } finally {
      isExpenseMonthLoading(false);
    }
  }

  void getExpenseThisYear() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isExpenseYearLoading(true);
      //call api
      var result = await RemoteExpenseService().getThisYear(token: token);

      if (result != null) {
        //assign api result
        expenseYear.value = totalAmountListFromJson(result.body);
      }
    } finally {
      isExpenseYearLoading(false);
    }
  }
}
