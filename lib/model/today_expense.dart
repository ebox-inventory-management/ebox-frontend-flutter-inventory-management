import 'dart:convert';

TodayExpense expenseTodayFromJson(String val) =>
    TodayExpense.fromJson(json.decode(val));

class TodayExpense {
  String today_expense;

  TodayExpense({
    required this.today_expense,
  });

  factory TodayExpense.fromJson(Map<String, dynamic> data) => TodayExpense(
        today_expense: data['today_expense'].toString(),
      );
}
