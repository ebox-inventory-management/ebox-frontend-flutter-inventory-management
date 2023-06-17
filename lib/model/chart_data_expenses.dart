import 'dart:convert';

List<ChartDataExpenses> chartDataExpensesListFromJson(String val) =>
    List<ChartDataExpenses>.from(json
        .decode(val)['imports']
        .map((data) => ChartDataExpenses.fromJson(data)));

class ChartDataExpenses {
  final int total_import_price;
  final DateTime created_at;

  ChartDataExpenses({
    required this.total_import_price,
    required this.created_at,
  });

  factory ChartDataExpenses.fromJson(Map<dynamic, dynamic> data) =>
      ChartDataExpenses(
        total_import_price: data['total_import_price'] ?? 0,
        created_at: DateTime.parse(data['created_at'].toString()),
      );
}
