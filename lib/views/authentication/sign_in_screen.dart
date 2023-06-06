import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/views/authentication/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(100.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Center(
              child: Text(
                'eBox Inventory Management',
                style: TextStyle(
                    color: Colors.orange,
                    fontSize: 36.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: REdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                'Email',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding:
                      REdgeInsets.symmetric(vertical: 25, horizontal: 15),
                  hintText: 'Please enter your email',
                  hintStyle: TextStyle(fontSize: 16.sp),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            Padding(
              padding: REdgeInsets.only(top: 15, bottom: 15),
              child: Text(
                'Password',
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
            ),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding:
                      REdgeInsets.symmetric(vertical: 25, horizontal: 15),
                  hintText: 'Please enter your password',
                  hintStyle: TextStyle(fontSize: 16.sp),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
            Padding(
              padding: REdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Expanded(
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.orange)),
                        onPressed: () {
                          authController.signIn(
                              email: emailController.text,
                              password: passwordController.text);
                        },
                        child: Padding(
                          padding: REdgeInsets.all(15),
                          child: Text(
                            'SigIn',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.sp),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              children: [
                Text(
                  'No have account yet? ',
                  style: TextStyle(color: Colors.black54, fontSize: 16.sp),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed('signup');
                  },
                  child: Text(
                    'SignUp',
                    style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.sp),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
