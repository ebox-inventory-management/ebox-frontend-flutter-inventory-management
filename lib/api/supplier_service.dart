import 'package:http/http.dart' as http;

import '../core/constants/base_url.dart';

class RemoteSupplierService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/suppliers';

  Future<dynamic> get() async {
    var response = await client.get(Uri.parse(remoteUrl));
    return response;
  }

  Future<dynamic> getById({required int id}) async {
    var response =
        await client.get(Uri.parse('$baseUrl/api/supplier/view/$id'));
    return response;
  }
}
