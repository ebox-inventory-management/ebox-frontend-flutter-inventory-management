import 'dart:convert';

import '../core/constants/base_url.dart';

List<Products> productsListFromJson(String val) => List<Products>.from(
    json.decode(val)['products'].map((data) => Products.fromJson(data)));

class Products {
  final int id;
  final String product_name;
  final String unit;
  final String product_url;
  final int product_quantity;
  final String product_code;
  final String description;

  final String product_garage;
  final String product_route;
  final String product_image;
  final String expire_date;
  final int import_price;
  final int export_price;
  final int product_amount;
  final String created_at;
  final String updated_at;
  final int category_id;
  final int supplier_id;
  final int brand_id;

  Products({
    required this.unit,
    required this.description,
    required this.id,
    required this.product_name,
    required this.product_url,
    required this.product_amount,
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

  factory Products.fromJson(Map<dynamic, dynamic> data) => Products(
        id: data['id'],
        description: data['description'] ?? 'Not Yet',
        product_name: data['product_name'] ?? 'Not Yet',
        unit: data['unit'] ?? 'Not Yet',
        product_url: data['url'] ?? 'Not Yet',
        brand_id: data['brand_id'] ?? 'Not Yet',
        import_price: data['import_price'] ?? 0,
        category_id: data['category_id'],
        created_at: data['created_at'],
        expire_date: data['expire_date'] ?? 'Not Yet',
        export_price: data['export_price'] ?? 0,
        product_code: data['product_code'] ?? 'Not Yet',
        product_quantity: data['product_quantity'] ?? 0,
        product_garage: data['product_garage'] ?? 'Not Yet',
        product_amount: data['product_amount'] ?? 0,
        product_image: data['product_image'] ??
            'https://shop.mevid.hu/wp-content/uploads/2019/11/image.jpg',
        product_route: data['product_route'] ?? 'Not Yet',
        supplier_id: data['supplier_id'],
        updated_at: data['updated_at'],
      );
}
