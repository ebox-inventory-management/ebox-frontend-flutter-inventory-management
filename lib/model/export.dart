import 'dart:convert';

List<Export> exportListFromJson(String val) => List<Export>.from(
    json.decode(val)['exports'].map((data) => Export.fromJson(data)));

class Export {
  final int id;
  final int export_quantity;
  final int total_export_price;
  final int product_id;
  final String product_name;

  final DateTime created_at;
  final DateTime updated_at;

  Export({
    required this.id,
    required this.created_at,
    required this.updated_at,
    required this.export_quantity,
    required this.total_export_price,
    required this.product_id,
    required this.product_name,
  });

  factory Export.fromJson(Map<dynamic, dynamic> data) => Export(
        id: data['id'],
        export_quantity: data['export_quantity'] ?? 0,
        total_export_price: data['total_export_price'] ?? 0,
        product_id: data['product_id'] ?? 0,
        created_at: DateTime.parse(data['created_at'].toString()),
        updated_at: DateTime.parse(data['updated_at'].toString()),
        product_name: data['product_name'] ?? 'Not Yet',
      );
}
