import 'dart:convert';

List<ChartDataImport> chartDataImportListFromJson(String val) =>
    List<ChartDataImport>.from(json
        .decode(val)['imports']
        .map((data) => ChartDataImport.fromJson(data)));

class ChartDataImport {
  final int import_quantity;
  final int total_export_price;
  final String product_name;
  final DateTime created_at;

  ChartDataImport({
    required this.import_quantity,
    required this.created_at,
    required this.total_export_price,
    required this.product_name,
  });

  factory ChartDataImport.fromJson(Map<dynamic, dynamic> data) =>
      ChartDataImport(
        import_quantity: data['import_quantity'] ?? 0,
        created_at: DateTime.parse(data['created_at'].toString()),
        product_name: data['product_name'] ?? 'Not Yet',
        total_export_price: data['total_export_price'] ?? 0,
      );
}
