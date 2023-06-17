import 'dart:convert';

TodayIncome incomeTodayFromJson(String val) =>
    TodayIncome.fromJson(json.decode(val));

class TodayIncome {
  String today_income;

  TodayIncome({
    required this.today_income,
  });

  factory TodayIncome.fromJson(Map<String, dynamic> data) => TodayIncome(
        today_income: data['today_income'].toString(),
      );
}
