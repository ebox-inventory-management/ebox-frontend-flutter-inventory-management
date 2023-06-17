import 'dart:convert';

List<ChartDataIncomes> chartDataIncomesListFromJson(String val) =>
    List<ChartDataIncomes>.from(json
        .decode(val)['exports']
        .map((data) => ChartDataIncomes.fromJson(data)));

class ChartDataIncomes {
  final int total_export_price;
  final DateTime created_at;

  ChartDataIncomes({
    required this.total_export_price,
    required this.created_at,
  });

  factory ChartDataIncomes.fromJson(Map<dynamic, dynamic> data) =>
      ChartDataIncomes(
        total_export_price: data['total_export_price'] ?? 0,
        created_at: DateTime.parse(data['created_at'].toString()),
      );
}
