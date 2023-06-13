import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class RemoteBrandService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/brands';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    return response;
  }

  Future<dynamic> getById({required String id}) async {
    var response = await client.get(Uri.parse('$baseUrl/api/brand/view/$id'));
    return response;
  }
}
