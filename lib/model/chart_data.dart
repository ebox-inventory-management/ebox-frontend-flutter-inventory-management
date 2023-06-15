import 'dart:convert';

List<ChartData> chartDataListFromJson(String val) => List<ChartData>.from(
    json.decode(val)['products'].map((data) => ChartData.fromJson(data)));

class ChartData {
  final int import_price;
  final DateTime created_at;

  ChartData({
    required this.import_price,
    required this.created_at,
  });

  factory ChartData.fromJson(Map<dynamic, dynamic> data) => ChartData(
        import_price: data['import_price'] ?? 0,
        created_at: DateTime.parse(data['created_at'].toString()),
      );
}
