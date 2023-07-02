import 'dart:convert';

TodayRevenue todayRevenueFromJson(String val) =>
    TodayRevenue.fromJson(json.decode(val));

class TodayRevenue {
  String today_revenue;

  TodayRevenue({
    required this.today_revenue,
  });

  factory TodayRevenue.fromJson(Map<String, dynamic> data) => TodayRevenue(
        today_revenue: data['today_revenue'].toString(),
      );
}
