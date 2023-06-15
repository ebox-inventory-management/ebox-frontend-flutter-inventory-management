import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class RemoteExpenseService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/expense';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    return response;
  }

  Future<dynamic> getToday() async {
    var response = await client.get(Uri.parse('$remoteUrl/today'));
    return response;
  }

  Future<dynamic> getThisMonth({required String month}) async {
    var response = await client.get(Uri.parse('$remoteUrl/month'));

    return response;
  }

  Future<dynamic> getThisYear() async {
    var response = await client.get(Uri.parse('$remoteUrl/year'));
    return response;
  }
}
