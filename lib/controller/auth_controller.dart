import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../api/api_service.dart';

class AuthController extends GetxController {
  final APIService _apiService = APIService();
  final box = GetStorage();

  @override
  void onReady() {
    // TODO: implement onReady
    checkToken();
    super.onReady();
  }

  void checkToken() {
    final token = box.read('token');
    if (token != null) {
      Get.offAllNamed('/home');
    }
  }

  void login(String email, String pass) async {
    final res = await _apiService.login(email, pass);
    res.fold((left) => Get.snackbar("Message", "Error Occurred"), (right) {
      Get.snackbar("Message", "Login success");
      if (right.token != null) {
        box.write('token', right.token);
      }
      print('login success ${right.token}');
      Get.offAllNamed('/home');
    });
  }

  ///register

  void register(String name, String email, String pass) async {
    try {
      final res = await _apiService.register(name, email, pass);
      res.fold((left) => Get.snackbar("Message", "Error Occurred"), (right) {
        Get.snackbar("Message", "Login success");
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
