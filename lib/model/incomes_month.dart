import 'dart:convert';

IncomesMonth incomesMonthListFromJson(String val) =>
    IncomesMonth.fromJson(jsonDecode(val));

class IncomesMonth {
  int total;

  IncomesMonth({
    required this.total,
  });

  factory IncomesMonth.fromJson(Map<String, dynamic> data) => IncomesMonth(
        total: data['total'] ?? 0,
      );
}
