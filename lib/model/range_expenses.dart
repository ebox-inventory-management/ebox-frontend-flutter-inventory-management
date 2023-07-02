import 'dart:convert';

import '../core/constants/base_url.dart';

List<RangeExpenses> rangeExpensesListFromJson(String val) =>
    List<RangeExpenses>.from(json
        .decode(val)['ExpenseInRange']
        .map((data) => RangeExpenses.fromJson(data)));

class RangeExpenses {
  final int id;
  final int income_amount;
  final DateTime created_at;
  final DateTime updated_at;

  RangeExpenses({
    required this.id,
    required this.income_amount,
    required this.created_at,
    required this.updated_at,
  });

  factory RangeExpenses.fromJson(Map<dynamic, dynamic> data) => RangeExpenses(
        id: data['id'],
        income_amount: data['income_amount'],
        created_at: DateTime.parse(data['created_at'].toString()),
        updated_at: DateTime.parse(data['updated_at'].toString()),
      );
}
