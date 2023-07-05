import 'dart:convert';

import '../core/constants/base_url.dart';

List<CompoundProducts> compoundProductsListFromJson(String val) =>
    List<CompoundProducts>.from(json
        .decode(val)['compounds']
        .map((data) => CompoundProducts.fromJson(data)));

class CompoundProducts {
  final int id;
  final String name;
  final int price;
  final String description;
  final String created_at;
  final String updated_at;
  final List<int> product_id;
  final List<String> product_url;
  final List<String> product_name;
  final List<int> product_quantity;
  final List<String> product_code;
  final List<String> product_garage;
  final List<String> product_route;
  final List<String> product_image;
  final List<String> expire_date;
  final List<int> import_price;
  final List<int> export_price;
  final List<int> product_amount;
  final List<String> product_created_at;
  final List<String> product_updated_at;
  final List<int> category_id;
  final List<int> supplier_id;
  final List<int> brand_id;
  final List<int> compound_id;
  final List<int> products_id;
  final List<int> compound_product_quantity;

  CompoundProducts({
    required this.created_at,
    required this.updated_at,
    required this.product_url,
    required this.compound_id,
    required this.products_id,
    required this.compound_product_quantity,
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.product_id,
    required this.product_name,
    required this.product_amount,
    required this.product_code,
    required this.product_quantity,
    required this.product_garage,
    required this.product_route,
    required this.product_image,
    required this.expire_date,
    required this.import_price,
    required this.export_price,
    required this.product_created_at,
    required this.product_updated_at,
    required this.category_id,
    required this.supplier_id,
    required this.brand_id,
  });

  factory CompoundProducts.fromJson(Map<dynamic, dynamic> data) =>
      CompoundProducts(
        id: data['id'] ?? 'Not Yet',
        name: data['name'] ?? 'Not Yet',
        price: data['price'] ?? 'Not Yet',
        description: data['description'] ?? 'Not Yet',
        created_at: data['created_at'] ?? 'Not Yet',
        updated_at: data['updated_at'] ?? 'Not Yet',
        product_id:
            List<int>.from(data['products'].map((data) => data['id'] ?? 0)),
        product_name: List<String>.from(
            data['products'].map((data) => data['product_name'] ?? 'Not Yet')),
        brand_id: List<int>.from(
            data['products'].map((data) => data['brand_id'] ?? 0)),
        import_price: List<int>.from(
            data['products'].map((data) => data['import_price'] ?? 0)),
        category_id: List<int>.from(
            data['products'].map((data) => data['category_id'] ?? 0)),
        product_created_at: List<String>.from(
            data['products'].map((data) => data['created_at'])),
        expire_date: List<String>.from(
            data['products'].map((data) => data['expire_date'])),
        export_price: List<int>.from(
            data['products'].map((data) => data['export_price'] ?? 0)),
        product_code: List<String>.from(
            data['products'].map((data) => data['product_code'] ?? 'Not Yet')),
        product_quantity: List<int>.from(
            data['products'].map((data) => data['product_quantity'] ?? 0)),
        product_garage: List<String>.from(data['products']
            .map((data) => data['product_garage'] ?? 'Not Yet')),
        product_amount: List<int>.from(
            data['products'].map((data) => data['product_amount'] ?? 0)),
        product_image: List<String>.from(data['products'].map((data) =>
            data['product_image'] ??
            'https://shop.mevid.hu/wp-content/uploads/2019/11/image.jpg')),
        product_route: List<String>.from(
            data['products'].map((data) => data['product_route'] ?? 'Not Yet')),
        product_url: List<String>.from(
            data['products'].map((data) => data['url'] ?? 'Not Yet')),
        supplier_id: List<int>.from(
            data['products'].map((data) => data['supplier_id'] ?? 'Not Yet')),
        product_updated_at: List<String>.from(
            data['products'].map((data) => data['updated_at'] ?? 'Not Yet')),
        compound_id: List<int>.from(
            data['products'].map((data) => data['pivot']['compound_id'] ?? 0)),
        products_id: List<int>.from(
            data['products'].map((data) => data['pivot']['products_id'] ?? 0)),
        compound_product_quantity: List<int>.from(data['products']
            .map((data) => data['pivot']['product_quantity'] ?? 0)),
      );
}
