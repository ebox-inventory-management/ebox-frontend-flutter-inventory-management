import 'dart:convert';

import '../core/constants/base_url.dart';

List<RangeRevenues> rangeRevenuesListFromJson(String val) =>
    List<RangeRevenues>.from(json
        .decode(val)['RevenueInRange']
        .map((data) => RangeRevenues.fromJson(data)));

class RangeRevenues {
  final int id;
  final int revenue;
  final DateTime created_at;
  final DateTime updated_at;

  RangeRevenues({
    required this.id,
    required this.revenue,
    required this.created_at,
    required this.updated_at,
  });

  factory RangeRevenues.fromJson(Map<dynamic, dynamic> data) => RangeRevenues(
        id: data['id'],
        revenue: data['revenue'],
        created_at: DateTime.parse(data['created_at'].toString()),
        updated_at: DateTime.parse(data['updated_at'].toString()),
      );
}
