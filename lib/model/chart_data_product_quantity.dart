import 'dart:convert';

List<ChartDataProductQuantity> chartDataProductQuantityListFromJson(
        String val) =>
    List<ChartDataProductQuantity>.from(json
        .decode(val)['products']
        .map((data) => ChartDataProductQuantity.fromJson(data)));

class ChartDataProductQuantity {
  final String product_name;
  final int product_quantity;

  ChartDataProductQuantity({
    required this.product_name,
    required this.product_quantity,
  });

  factory ChartDataProductQuantity.fromJson(Map<dynamic, dynamic> data) =>
      ChartDataProductQuantity(
        product_name: data['product_name'] ?? 'Not Yet',
        product_quantity: data['product_quantity'] ?? 0,
      );
}
