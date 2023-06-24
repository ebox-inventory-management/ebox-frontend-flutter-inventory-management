import 'dart:convert';

List<ChartDataImport> chartDataImportListFromJson(String val) =>
    List<ChartDataImport>.from(json
        .decode(val)['imports']
        .map((data) => ChartDataImport.fromJson(data)));

class ChartDataImport {
  final int total_import_price;
  final DateTime created_at;

  ChartDataImport({
    required this.total_import_price,
    required this.created_at,
  });

  factory ChartDataImport.fromJson(Map<dynamic, dynamic> data) =>
      ChartDataImport(
        total_import_price: data['total_import_price'] ?? 0,
        created_at: DateTime.parse(data['created_at'].toString()),
      );
}
