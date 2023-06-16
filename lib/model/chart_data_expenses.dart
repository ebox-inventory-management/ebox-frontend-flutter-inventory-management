import 'dart:convert';

List<ChartDataExpenses> chartDataExpensesListFromJson(String val) =>
    List<ChartDataExpenses>.from(json
        .decode(val)['products']
        .map((data) => ChartDataExpenses.fromJson(data)));

class ChartDataExpenses {
  final int import_price;
  final DateTime created_at;

  ChartDataExpenses({
    required this.import_price,
    required this.created_at,
  });

  factory ChartDataExpenses.fromJson(Map<dynamic, dynamic> data) =>
      ChartDataExpenses(
        import_price: data['import_price'] ?? 0,
        created_at: DateTime.parse(data['created_at'].toString()),
      );
}
