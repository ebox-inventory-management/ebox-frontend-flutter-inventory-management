import 'dart:convert';

import '../core/constants/base_url.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  int id;
  String name;
  String email;
  String image;
  String created_at;
  String updated_at;
  User({
    required this.id,
    required this.email,
    required this.name,
    required this.image,
    required this.created_at,
    required this.updated_at,
  });

  factory User.fromJson(Map<dynamic, dynamic> data) => User(
        id: data['id'],
        email: data['email'] ?? 'Not Yet',
        name: data['name'] ?? 'Not Yet',
        image: data['image'],
        created_at: data['created_at'],
        updated_at: data['updated_at'],
      );
}
