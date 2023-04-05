import 'package:ebox_frontend_web_inventory/views/navigationbar_screen.dart';
import 'package:flutter/material.dart';
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
      Get.offAllNamed('/navigation');
    }
  }

  ///signin

  void signin({required String email, required String password}) async {
    final res = await _apiService.login(email, password);
    res.fold(
        (left) => Get.snackbar("Oh Snap!", "Error Occurred",
            backgroundColor: Colors.red, colorText: Colors.white), (right) {
      Get.snackbar("Yeah!", "SignIn Success",
          backgroundColor: Colors.green, colorText: Colors.white);
      if (right.token != null) {
        box.write('token', right.token);
      }
      print('login success ${right.token}');
      Get.offAllNamed('/navigation');
    });
  }

  ///register

  void signup(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final res = await _apiService.signup(name, email, password);
      res.fold(
          (left) => Get.snackbar("Oh Snap!", "Error Occurred",
              backgroundColor: Colors.red, colorText: Colors.white), (right) {
        Get.snackbar("Yeah!", "SignUp Success",
            backgroundColor: Colors.green, colorText: Colors.white);
        Get.offAllNamed('/navigation');
      });
    } catch (e) {
      print(e.toString());
    }
  }

  void signout() {
    box.remove('token');
    Get.offAllNamed('/signin');
  }
}
