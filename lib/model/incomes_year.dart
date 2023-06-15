import 'dart:convert';

List<IncomesYear> incomesYearListFromJson(String val) => List<IncomesYear>.from(
    json.decode(val)['yearIncome'].map((data) => IncomesYear.fromJson(data)));

class IncomesYear {
  final int id;
  final String income_details;
  final String income_amount;
  final String day;
  final String month;
  final String year;
  final DateTime created_at;
  final DateTime updated_at;

  IncomesYear({
    required this.id,
    required this.income_details,
    required this.income_amount,
    required this.day,
    required this.month,
    required this.year,
    required this.created_at,
    required this.updated_at,
  });

  factory IncomesYear.fromJson(Map<dynamic, dynamic> data) => IncomesYear(
        id: data['id'],
        income_details: data['income_details'] ?? 'Not Yet',
        income_amount: data['income_amount'] ?? 'Not Yet',
        day: data['date'] ?? 'Not Yet',
        month: data['month'] ?? 'Not Yet',
        year: data['year'] ?? 'Not Yet',
        created_at: DateTime.parse(data['created_at'].toString()),
        updated_at: DateTime.parse(data['updated_at'].toString()),
      );
}
