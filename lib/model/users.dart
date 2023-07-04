import 'dart:convert';

import '../core/constants/base_url.dart';

List<Users> usersListFromJson(String val) => List<Users>.from(
    json.decode(val)['users'].map((data) => Users.fromJson(data)));

class Users {
  int id;
  String name;
  String email;
  String role;

  String image;
  String created_at;
  String updated_at;
  Users({
    required this.id,
    required this.email,
    required this.role,
    required this.name,
    required this.image,
    required this.created_at,
    required this.updated_at,
  });

  factory Users.fromJson(Map<dynamic, dynamic> data) => Users(
        id: data['id'],
        email: data['email'] ?? 'Not Yet',
        role: data['role'] ?? 'Not Yet',
        name: data['name'] ?? 'Not Yet',
        image: data['image'] ??
            'https://shop.mevid.hu/wp-content/uploads/2019/11/image.jpg',
        created_at: data['created_at'],
        updated_at: data['updated_at'],
      );
}
