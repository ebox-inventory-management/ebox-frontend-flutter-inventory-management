import 'dart:typed_data';

import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/core/extension/string_extension.dart';
import 'package:ebox_frontend_web_inventory/views/authentication/sign_up_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Variable to hold the selected image file
  PlatformFile? _imageFile;

  // Method to pick and display an image file
  Future<void> _pickImage() async {
    try {
      // Pick an image file using file_picker package
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      // If user cancels the picker, do nothing
      if (result == null) return;

      // If user picks an image, update the state with the new image file
      setState(() {
        _imageFile = result.files.first;
      });
      // final base64Image = base64Encode(_imageFile!.bytes!);
      // print('image: $base64Image');
      // final base64DecondeImage = base64Decode(base64Image);
      // print(base64DecondeImage);
    } catch (e) {
      // If there is an error, show a snackbar with the error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.only(
              left: 200.w, right: 200.w, top: 30.w, bottom: 30.w),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
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
              Padding(
                padding: REdgeInsets.only(top: 30, bottom: 15),
                child: Text(
                  'Profile Image',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
              ), // If image file is not null, display it using Image widget
              Container(
                width: 200.w,
                height: 200.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100.r))),
                child: _imageFile == null
                    ? Image.network(
                        'https://shop.mevid.hu/wp-content/uploads/2019/11/image.jpg',
                        fit: BoxFit.cover,
                      )
                    : Image.memory(
                        Uint8List.fromList(_imageFile!.bytes!),
                        fit: BoxFit.cover,
                      ),
              ),
              SizedBox(
                height: 30.w,
              ),
              GestureDetector(
                onTap: () {
                  _pickImage();
                },
                child: Container(
                  width: 200.w,
                  height: 60.w,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: Center(
                    child: Text(
                      'Choose image',
                      style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: REdgeInsets.only(top: 30, bottom: 15),
                child: Text(
                  'Username',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
              ),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding:
                        REdgeInsets.symmetric(vertical: 25, horizontal: 15),
                    hintText: 'Please enter your username',
                    hintStyle: TextStyle(fontSize: 16.sp),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
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
              TextFormField(
                controller: emailController,
                validator: (value) =>
                    EmailValidator.validate(emailController.text)
                        ? null
                        : "Please enter a valid email",
                onChanged: (value) {
                  setState(() {});
                },
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
                enableSuggestions: false,
                autocorrect: false,
                onChanged: (value) {
                  setState(() {});
                },
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
                padding: REdgeInsets.only(top: 15, bottom: 15),
                child: Text(
                  'Password Confirmation',
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp),
                ),
              ),
              TextFormField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: passwordConfirmationController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    contentPadding:
                        REdgeInsets.symmetric(vertical: 25, horizontal: 15),
                    hintText: 'Please enter your confirmation password',
                    hintStyle: TextStyle(fontSize: 16.sp),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              ),
              Padding(
                padding: REdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.orange)),
                          onPressed: () {
                            if (emailController.text.isEmail ||
                                passwordController.text.isValidPassword ||
                                usernameController.text.isEmpty ||
                                passwordConfirmationController
                                    .text.isValidPassword ||
                                _imageFile == null) {
                              Get.snackbar('Something wrong!',
                                  'You need to input all information to sign up',
                                  colorText: Colors.white,
                                  margin: REdgeInsets.all(15.r),
                                  backgroundColor: Colors.redAccent,
                                  snackPosition: SnackPosition.BOTTOM,
                                  duration: const Duration(seconds: 2));
                            } else {
                              if (passwordController.text ==
                                  passwordConfirmationController.text) {
                                authController.signUp(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  name: usernameController.text,
                                  image: _imageFile!,
                                  password_confirmation:
                                      passwordConfirmationController.text,
                                );
                              } else {
                                Get.snackbar('Something wrong!',
                                    'You need to input password and password confirmation is the same',
                                    colorText: Colors.white,
                                    margin: REdgeInsets.all(15.r),
                                    backgroundColor: Colors.redAccent,
                                    snackPosition: SnackPosition.BOTTOM,
                                    duration: const Duration(seconds: 2));
                              }
                            }
                          },
                          child: Padding(
                            padding: REdgeInsets.all(15),
                            child: Text(
                              'SigUp',
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
                    'Already had an account? ',
                    style: TextStyle(color: Colors.black54, fontSize: 16.sp),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/signin');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.r)),
                          color: Colors.green),
                      child: Padding(
                        padding: REdgeInsets.all(10.0),
                        child: Text(
                          'SignIn',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
