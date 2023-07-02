import 'dart:convert';

import '../core/constants/base_url.dart';

List<RangeIncomes> rangeIncomesListFromJson(String val) =>
    List<RangeIncomes>.from(json
        .decode(val)['IncomeInRange']
        .map((data) => RangeIncomes.fromJson(data)));

class RangeIncomes {
  final int id;
  final int income_amount;
  final DateTime created_at;
  final DateTime updated_at;

  RangeIncomes({
    required this.id,
    required this.income_amount,
    required this.created_at,
    required this.updated_at,
  });

  factory RangeIncomes.fromJson(Map<dynamic, dynamic> data) => RangeIncomes(
        id: data['id'],
        income_amount: data['income_amount'],
        created_at: DateTime.parse(data['created_at'].toString()),
        updated_at: DateTime.parse(data['updated_at'].toString()),
      );
}
