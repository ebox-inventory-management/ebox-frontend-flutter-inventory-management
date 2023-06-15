import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class RemoteIncomeService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/incomes';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    return response;
  }

  Future<dynamic> getToday() async {
    var response = await client.get(Uri.parse('$baseUrl/api/income/today'));
    return response;
  }

  Future<dynamic> getByMonth({required String month}) async {
    var response =
        await client.get(Uri.parse('$baseUrl/api/income/month/$month'));
    return response;
  }

  Future<dynamic> getThisYear() async {
    var response = await client.get(Uri.parse('$baseUrl/api/income/year'));
    return response;
  }
}
