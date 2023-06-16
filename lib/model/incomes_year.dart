import 'dart:convert';

IncomesYear incomesYearListFromJson(String val) =>
    IncomesYear.fromJson(jsonDecode(val));

class IncomesYear {
  int total;

  IncomesYear({
    required this.total,
  });

  factory IncomesYear.fromJson(Map<String, dynamic> data) => IncomesYear(
        total: data['total'] ?? 0,
      );
}
