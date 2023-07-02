import 'dart:convert';

import '../core/constants/base_url.dart';

List<Import> importListFromJson(String val) => List<Import>.from(
    json.decode(val)['imports'].map((data) => Import.fromJson(data)));

class Import {
  final int id;
  final int import_quantity;
  final int total_import_price;
  final int product_id;
  final String product_name;
  final String product_image;

  final DateTime created_at;
  final DateTime updated_at;

  Import({
    required this.id,
    required this.created_at,
    required this.product_name,
    required this.updated_at,
    required this.import_quantity,
    required this.total_import_price,
    required this.product_id,
    required this.product_image,
  });

  factory Import.fromJson(Map<dynamic, dynamic> data) => Import(
        id: data['id'],
        import_quantity: data['import_quantity'] ?? 0,
        total_import_price: data['total_import_price'] ?? 0,
        product_id: data['product_id'] ?? 0,
        product_name: data['product_name'] ?? 0,
        created_at: DateTime.parse(data['created_at'].toString()),
        updated_at: DateTime.parse(data['updated_at'].toString()),
        product_image: data['product_image'],
      );
}
