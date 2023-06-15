import 'dart:convert';

List<Suppliers> suppliersListFromJson(String val) => List<Suppliers>.from(
    json.decode(val)['suppliers'].map((data) => Suppliers.fromJson(data)));

class Suppliers {
  final int id;
  final String name;
  final DateTime created_at;
  final DateTime updated_at;
  final List<int> product_id;
  final List<String> product_name;
  final List<String> product_code;
  final List<String> product_garage;
  final List<String> product_route;
  final List<String> product_image;
  final List<String> product_buy_date;
  final List<String> product_expire_date;
  final List<String> product_import_price;
  final List<String> product_export_price;
  final List<int> product_quantity;

  final List<int> category_id;
  final List<int> supplier_id;
  final List<int> brand_id;

  Suppliers({
    required this.id,
    required this.product_name,
    required this.product_quantity,
    required this.product_buy_date,
    required this.product_expire_date,
    required this.product_import_price,
    required this.product_export_price,
    required this.name,
    required this.created_at,
    required this.updated_at,
    required this.product_id,
    required this.product_code,
    required this.product_garage,
    required this.product_route,
    required this.product_image,
    required this.category_id,
    required this.supplier_id,
    required this.brand_id,
  });

  factory Suppliers.fromJson(Map<dynamic, dynamic> data) => Suppliers(
        id: data['id'],
        name: data['name'] ?? 'Not Yet',
        created_at: DateTime.parse(data['created_at'].toString()),
        updated_at: DateTime.parse(data['updated_at'].toString()),
        product_id: List<int>.from(
            data['products'].map((data) => data['id'] ?? 'Not Yet')),
        product_name: List<String>.from(
            data['products'].map((data) => data['product_name'] ?? 'Not Yet')),
        product_code: List<String>.from(
            data['products'].map((data) => data['product_code'] ?? 'Not Yet')),
        product_garage: List<String>.from(data['products']
            .map((data) => data['product_garage'] ?? 'Not Yet')),
        product_route: List<String>.from(
            data['products'].map((data) => data['product_route'] ?? 'Not Yet')),
        product_image: List<String>.from(
            data['products'].map((data) => data['product_image'] ?? 'Not Yet')),
        product_quantity: List<int>.from(data['products']
            .map((data) => data['product_quantity'] ?? 'Not Yet')),
        product_buy_date: List<String>.from(
            data['products'].map((data) => data['buy_date'] ?? 'Not Yet')),
        product_expire_date: List<String>.from(
            data['products'].map((data) => data['expire_date'] ?? 'Not Yet')),
        product_import_price: List<String>.from(
            data['products'].map((data) => data['import_price'] ?? 'Not Yet')),
        product_export_price: List<String>.from(
            data['products'].map((data) => data['export_price'] ?? 'Not Yet')),
        brand_id: List<int>.from(
            data['products'].map((data) => data['brand_id'] ?? 'Not Yet')),
        category_id: List<int>.from(
            data['products'].map((data) => data['category_id'] ?? 'Not Yet')),
        supplier_id: List<int>.from(
            data['products'].map((data) => data['supplier_id'] ?? 'Not Yet')),
      );
}