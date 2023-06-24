import 'dart:convert';

List<ChartDataExport> chartDataExportListFromJson(String val) =>
    List<ChartDataExport>.from(json
        .decode(val)['exports']
        .map((data) => ChartDataExport.fromJson(data)));

class ChartDataExport {
  final int total_export_price;
  final DateTime created_at;

  ChartDataExport({
    required this.total_export_price,
    required this.created_at,
  });

  factory ChartDataExport.fromJson(Map<dynamic, dynamic> data) =>
      ChartDataExport(
        total_export_price: data['total_export_price'] ?? 0,
        created_at: DateTime.parse(data['created_at'].toString()),
      );
}
