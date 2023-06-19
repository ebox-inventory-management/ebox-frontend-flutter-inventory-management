import 'dart:convert';

TotalAmount totalAmountListFromJson(String val) =>
    TotalAmount.fromJson(jsonDecode(val));

class TotalAmount {
  String total;

  TotalAmount({
    required this.total,
  });

  factory TotalAmount.fromJson(Map<String, dynamic> data) => TotalAmount(
        total: data['total'].toString(),
      );
}
