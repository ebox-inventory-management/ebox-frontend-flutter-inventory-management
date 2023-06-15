import 'dart:convert';

IncomesYear incomesYearListFromJson(String val) =>
    IncomesYear.fromJson(jsonDecode(val));

class IncomesYear {
  final String total;
  final List<int> id;
  final List<String> income_details;
  final List<int> income_amount;
  final List<String> day;
  final List<String> month;
  final List<String> year;
  final List<DateTime> created_at;
  final List<DateTime> updated_at;

  IncomesYear({
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

  factory IncomesYear.fromJson(Map<dynamic, dynamic> data) => IncomesYear(
        id: List<int>.from(data['yearIncome'].map((data) => data['id'] ?? 0)),
        income_details: List<String>.from(data['yearIncome']
            .map((data) => data['income_details'] ?? 'Not Yet')),
        income_amount: List<int>.from(
            data['yearIncome'].map((data) => data['income_amount'] ?? 0)),
        day: List<String>.from(
            data['yearIncome'].map((data) => data['date'] ?? 'Not Yet')),
        month: List<String>.from(
            data['yearIncome'].map((data) => data['month'] ?? 'Not Yet')),
        year: List<String>.from(
            data['yearIncome'].map((data) => data['year'] ?? 'Not Yet')),
        created_at: List<DateTime>.from(data['yearIncome']
            .map((data) => DateTime.parse(data['created_at'].toString()))),
        updated_at: List<DateTime>.from(data['yearIncome']
            .map((data) => DateTime.parse(data['updated_at'].toString()))),
        total: data['total'] ?? 'Not Yet',
      );
}
