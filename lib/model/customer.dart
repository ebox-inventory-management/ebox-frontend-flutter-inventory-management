import 'dart:convert';

import '../core/constants/base_url.dart';

Customer customerListFromJson(String val) =>
    Customer.fromJson(json.decode(val)['customer']);

class Customer {
  final int id;
  final String name;
  final DateTime created_at;
  final DateTime updated_at;
  final String email;
  final String phone;
  final String address;
  final String city;
  final String shop_name;
  final String photo;
  final String bank_name;
  final String bank_number;

  Customer({
    required this.id,
    required this.name,
    required this.created_at,
    required this.updated_at,
    required this.email,
    required this.phone,
    required this.address,
    required this.city,
    required this.shop_name,
    required this.photo,
    required this.bank_name,
    required this.bank_number,
  });

  factory Customer.fromJson(Map<dynamic, dynamic> data) => Customer(
        id: data['id'],
        name: data['name'] ?? 'Not Yet',
        created_at: DateTime.parse(data['created_at'].toString()),
        updated_at: DateTime.parse(data['updated_at'].toString()),
        email: data['email'] ?? 'Not Yet',
        phone: data['phone'] ?? 'Not Yet',
        address: data['address'] ?? 'Not Yet',
        city: data['city'] ?? 'Not Yet',
        shop_name: data['shop_name'] ?? 'Not Yet',
        photo: data['photo'],
        bank_name: data['bank_name'] ?? 'Not Yet',
        bank_number: data['bank_number'] ?? 'Not Yet',
      );
}
