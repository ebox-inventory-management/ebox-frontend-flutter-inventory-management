import 'dart:convert';

class AddProductCompound {
  final int id;
  final int product_quantity;

  AddProductCompound({
    required this.id,
    required this.product_quantity,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "product_quantity": product_quantity,
      };
}
