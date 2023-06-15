import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  String id;
  String name;
  String email;
  String image;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.image,
  });

  factory User.fromJson(Map<dynamic, dynamic> data) => User(
      id: data['id'].toString(),
      email: data['email'] ?? 'Not Yet',
      name: data['name'] ?? 'Not Yet',
      image: data['image'] ??
          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png');
}
