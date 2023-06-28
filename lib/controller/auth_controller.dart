import 'dart:convert';
import 'package:ebox_frontend_web_inventory/model/users.dart';
import 'package:ebox_frontend_web_inventory/views/authentication/sign_in_screen.dart';
import 'package:ebox_frontend_web_inventory/views/navigationbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user.dart';
import '../api/auth_service.dart';

class AuthController extends GetxController {
  Rxn<User> user = Rxn<User>();
  RxList<Users> usersList = List<Users>.empty(growable: true).obs;

  var token;

  TextEditingController searchUsersController = TextEditingController();
  RxString searchVal = ''.obs;

  RxBool isUserLoading = false.obs;
  RxBool isUsersLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    getUsers();
    checkToken();
  }

  void getUsersByKeyword({required String keyword}) async {
    try {
      isUsersLoading(true);
      //call api
      var result = await RemoteAuthService().getByKeyword(keyword: keyword);

      if (result != null) {
        //assign api result
        usersList.assignAll(usersListFromJson(result.body));
      }
    } finally {
      isUsersLoading(false);
    }
  }

  void getUsers() async {
    try {
      isUsersLoading(true);
      //call api
      var result = await RemoteAuthService().getUsers();
      if (result != null) {
        //assign api result
        usersList.assignAll(usersListFromJson(result.body));

        //save api result to local db
      }
    } finally {
      isUsersLoading(false);
    }
  }

  void checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    var userResult = await RemoteAuthService().getUser(token: token);
    if (userResult.statusCode == 200) {
      user.value = userFromJson(userResult.body);
      Get.offAllNamed('/navigation');
    } else {
      EasyLoading.showError('Something wrong. Try again!');
    }
  }

  void signUp(
      {required String name,
      required String email,
      required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );

      var result = await RemoteAuthService().signUp(
        email: email,
        password: password,
        name: name,
      );
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['token'];

        //after the login REST api call && response code ==200
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);

        var userResult = await RemoteAuthService().getUser(token: token);
        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          EasyLoading.showSuccess("Welcome to eBox Inventory Management!");
          Get.offAllNamed('/navigation');
        } else {
          EasyLoading.showError('Something wrong. Try again!');
        }
      } else {
        EasyLoading.showError('Something wrong. Try again!');
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong. Try again!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signIn({required String email, required String password}) async {
    try {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );

      var result = await RemoteAuthService().signIn(
        email: email,
        password: password,
      );
      if (result.statusCode == 200) {
        String token = json.decode(result.body)['token'];
        var userResult = await RemoteAuthService().getUser(token: token);

        //after the login REST api call && response code ==200
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', token);

        if (userResult.statusCode == 200) {
          user.value = userFromJson(userResult.body);
          EasyLoading.showSuccess("Welcome to eBox Inventory Management!");
          Get.offAllNamed('/navigation');
        } else {
          EasyLoading.showError('Something wrong. Try again!');
        }
      } else {
        EasyLoading.showError('Password wrong');
      }
    } catch (e) {
      debugPrint(e.toString());
      EasyLoading.showError('Something wrong. Try again!');
    } finally {
      EasyLoading.dismiss();
    }
  }

  void signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    user.value = null;
    Get.offAllNamed('/signin');
  }
}
