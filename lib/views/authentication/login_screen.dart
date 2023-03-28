import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController usernameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 450.w,
          height: 400.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: GestureDetector(
                    onTap: () {
                      print('width: ${MediaQuery.of(context).size.width}');
                      print('height: ${MediaQuery.of(context).size.height}');
                    },
                    child: Image.asset(
                      '../../../assets/images/logo_text.png',
                      width: 200.w,
                    )),
              ),
              Padding(
                padding: REdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  'Email',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: 'Please enter your email',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
              Padding(
                padding: REdgeInsets.only(top: 15, bottom: 15).r,
                child: Text(
                  'Password',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    hintText: 'Please enter your password',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
              Padding(
                padding: REdgeInsets.only(top: 15, bottom: 15),
                child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent)),
                    onPressed: () {
                      authController.login(
                          emailController.text, passwordController.text);
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
