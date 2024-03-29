import 'dart:convert';

import '../core/constants/base_url.dart';

List<Suppliers> suppliersListFromJson(String val) => List<Suppliers>.from(
    json.decode(val)['suppliers'].map((data) => Suppliers.fromJson(data)));

class Suppliers {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String city;
  final String shop_name;
  final String photo;
  final String bank_name;
  final String bank_number;
  final String type;
  final String created_at;
  final String updated_at;
  final List<int> product_id;
  final List<String> product_name;
  final List<String> product_code;
  final List<String> product_garage;
  final List<String> product_route;
  final List<String> product_image;
  final List<String> product_expire_date;
  final List<int> product_import_price;
  final List<int> product_export_price;
  final List<int> product_quantity;
  final List<int> product_amount;
  final List<int> category_id;
  final List<int> supplier_id;
  final List<int> brand_id;

  Suppliers({
    required this.id,
    required this.product_name,
    required this.type,
    required this.product_amount,
    required this.product_quantity,
    required this.product_expire_date,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.shop_name,
    required this.product_import_price,
    required this.product_export_price,
    required this.photo,
    required this.bank_name,
    required this.bank_number,
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
        created_at: data['created_at'],
        updated_at: data['updated_at'],
        product_id:
            List<int>.from(data['products'].map((data) => data['id'] ?? 0)),
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
        product_expire_date: List<String>.from(
            data['products'].map((data) => data['expire_date'] ?? 'Not Yet')),
        product_import_price: List<int>.from(
            data['products'].map((data) => data['import_price'] ?? 0)),
        product_export_price: List<int>.from(
            data['products'].map((data) => data['export_price'] ?? 0)),
        product_quantity: List<int>.from(
            data['products'].map((data) => data['product_quantity'] ?? 0)),
        product_amount: List<int>.from(
            data['products'].map((data) => data['product_quantity'] ?? 0)),
        brand_id: List<int>.from(
            data['products'].map((data) => data['brand_id'] ?? 0)),
        category_id: List<int>.from(
            data['products'].map((data) => data['category_id'] ?? 0)),
        supplier_id: List<int>.from(
            data['products'].map((data) => data['supplier_id'] ?? 0)),
        email: data['email'] ?? 'Not Yet',
        phone: data['phone'] ?? 'Not Yet',
        address: data['address'] ?? 'Not Yet',
        city: data['city'] ?? 'Not Yet',
        shop_name: data['shop_name'] ?? 'Not Yet',
        photo: data['photo'] ??
            'https://shop.mevid.hu/wp-content/uploads/2019/11/image.jpg',
        bank_name: data['bank_name'] ?? 'Not Yet',
        bank_number: data['bank_number'] ?? 'Not Yet',
        type: data['type'] ?? 'Not Yet',
      );
}
