import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class RemoteRevenueService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/revenues';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    return response;
  }

  Future<dynamic> getToday() async {
    var response = await client.get(Uri.parse('$remoteUrl/today'));
    return response;
  }

  Future<dynamic> getThisMonth() async {
    var response = await client.get(Uri.parse('$remoteUrl/month'));

    return response;
  }

  Future<dynamic> getThisYear() async {
    var response = await client.get(Uri.parse('$remoteUrl/year'));
    return response;
  }

  Future<dynamic> getRange({required String start, required String end}) async {
    var response =
        await client.get(Uri.parse('$baseUrl/api/revenues/$start/$end'));
    return response;
  }
}
