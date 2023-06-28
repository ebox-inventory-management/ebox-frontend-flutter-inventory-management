import 'dart:convert';

List<ChartDataExport> chartDataExportListFromJson(String val) =>
    List<ChartDataExport>.from(json
        .decode(val)['exports']
        .map((data) => ChartDataExport.fromJson(data)));

class ChartDataExport {
  final int export_quantity;
  final String product_name;
  final DateTime created_at;

  ChartDataExport({
    required this.export_quantity,
    required this.created_at,
    required this.product_name,
  });

  factory ChartDataExport.fromJson(Map<dynamic, dynamic> data) =>
      ChartDataExport(
        export_quantity: data['export_quantity'] ?? 0,
        created_at: DateTime.parse(data['created_at'].toString()),
        product_name: data['product_name'] ?? 'Not Yet',
      );
}
