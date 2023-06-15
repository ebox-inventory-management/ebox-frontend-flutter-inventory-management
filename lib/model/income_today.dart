import 'dart:convert';

IncomeToday incomeTodayFromJson(String val) =>
    IncomeToday.fromJson(json.decode(val));

class IncomeToday {
  String today_income;

  IncomeToday({
    required this.today_income,
  });

  factory IncomeToday.fromJson(Map<String, dynamic> data) => IncomeToday(
        today_income: data['today_income'],
      );
}
