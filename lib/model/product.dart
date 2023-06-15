import 'dart:convert';

List<Product> productListFromJson(String val) => List<Product>.from(
    json.decode(val)['products'].map((data) => Product.fromJson(data)));

class Product {
  final int id;
  final String product_name;
  final String product_quantity;
  final String product_code;
  final String product_garage;
  final String product_route;
  final String product_image;
  final String expire_date;
  final int import_price;
  final int export_price;
  final DateTime created_at;
  final DateTime updated_at;
  final int category_id;
  final int supplier_id;
  final int brand_id;

  Product({
    required this.id,
    required this.product_name,
    required this.product_code,
    required this.product_quantity,
    required this.product_garage,
    required this.product_route,
    required this.product_image,
    required this.expire_date,
    required this.import_price,
    required this.export_price,
    required this.created_at,
    required this.updated_at,
    required this.category_id,
    required this.supplier_id,
    required this.brand_id,
  });

  factory Product.fromJson(Map<dynamic, dynamic> data) => Product(
        id: data['id'],
        product_name: data['product_name'] ?? 'Not Yet',
        brand_id: data['brand_id'] ?? 'Not Yet',
        import_price: data['import_price'] ?? 0,
        category_id: data['category_id'],
        created_at: DateTime.parse(data['created_at'].toString()),
        expire_date: data['expire_date'] ?? 'Not Yet',
        export_price: data['export_price'] ?? 0,
        product_code: data['product_code'] ?? 'Not Yet',
        product_quantity: data['product_quantity'] ?? 'Not Yet',
        product_garage: data['product_garage'] ?? 'Not Yet',
        product_image: data['product_image'] ?? 'Not Yet',
        product_route: data['product_route'] ?? 'Not Yet',
        supplier_id: data['supplier_id'],
        updated_at: DateTime.parse(data['updated_at'].toString()),
      );
}
