import 'dart:convert';

IncomesMonth incomesMonthListFromJson(String val) =>
    IncomesMonth.fromJson(jsonDecode(val));

class IncomesMonth {
  final String total;
  final List<int> id;
  final List<String> income_details;
  final List<int> income_amount;
  final List<String> day;
  final List<String> month;
  final List<String> year;
  final List<DateTime> created_at;
  final List<DateTime> updated_at;

  IncomesMonth({
    required this.id,
    required this.total,
    required this.income_details,
    required this.income_amount,
    required this.day,
    required this.month,
    required this.year,
    required this.created_at,
    required this.updated_at,
  });

  factory IncomesMonth.fromJson(Map<dynamic, dynamic> data) => IncomesMonth(
        id: List<int>.from(data['monthIncome'].map((data) => data['id'] ?? 0)),
        income_details: List<String>.from(data['monthIncome']
            .map((data) => data['income_details'] ?? 'Not Yet')),
        income_amount: List<int>.from(
            data['monthIncome'].map((data) => data['income_amount'] ?? 0)),
        day: List<String>.from(
            data['monthIncome'].map((data) => data['date'] ?? 'Not Yet')),
        month: List<String>.from(
            data['monthIncome'].map((data) => data['month'] ?? 'Not Yet')),
        year: List<String>.from(
            data['monthIncome'].map((data) => data['year'] ?? 'Not Yet')),
        created_at: List<DateTime>.from(data['monthIncome']
            .map((data) => DateTime.parse(data['created_at'].toString()))),
        updated_at: List<DateTime>.from(data['monthIncome']
            .map((data) => DateTime.parse(data['updated_at'].toString()))),
        total: data['total'] ?? 'Not Yet',
      );
}
