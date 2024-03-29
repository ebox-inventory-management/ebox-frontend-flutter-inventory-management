import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:ebox_frontend_web_inventory/model/suppliers.dart';
import 'package:ebox_frontend_web_inventory/model/users.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/controllers.dart';

class UserAdd extends StatefulWidget {
  const UserAdd({
    super.key,
  });

  @override
  State<UserAdd> createState() => _UserAddState();
}

class _UserAddState extends State<UserAdd> {
  List<String> role = ['admin', 'staff'];
  String? selectedValueRole;

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
    } catch (e) {
      // If there is an error, show a snackbar with the error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    nameController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 0.9.sw,
        height: 0.9.sh,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15.w))),
          child: SingleChildScrollView(
            child: Padding(
              padding: REdgeInsets.all(30.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Edit User',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.sp),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.cancel,
                            size: 40.r,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  Padding(
                    padding: REdgeInsets.only(top: 15.w, bottom: 15.r),
                    child: Divider(
                      color: Colors.black.withOpacity(0.1),
                      thickness: 5.w,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Username',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: nameController,
                                // onChanged: (val) {
                                //   setState(() {
                                //     backgroundColor = val.isNotEmpty
                                //         ? Colors.orange
                                //         : Colors.grey;
                                //     foregroundColor = val.isNotEmpty
                                //         ? Colors.white
                                //         : Colors.white;
                                //   });
                                // },
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                onChanged: (index) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 16.sp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Email',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: emailController,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                onChanged: (index) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 16.sp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Password',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                obscureText: true,
                                controller: passwordController,
                                enableSuggestions: false,
                                autocorrect: false,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 16.sp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Password Confirmation',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                controller: passwordConfirmationController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(fontSize: 16.sp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: REdgeInsets.only(top: 15.r, bottom: 30.r),
                            child: CustomDropdownButton2(
                              buttonWidth: 0.2.sw,
                              buttonHeight: 40.w,
                              hint: 'Choose Role',
                              dropdownItems: role,
                              value: selectedValueRole,
                              buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: Colors.grey[100],
                              ),
                              dropdownWidth: 0.2.sw,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                color: Colors.white,
                              ),
                              icon: Icon(
                                Icons.arrow_drop_down,
                                size: 40.r,
                                color: Colors.orange,
                              ),
                              onChanged: (index) {
                                setState(() {
                                  selectedValueRole = index;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: REdgeInsets.only(bottom: 15.r),
                            child: Text(
                              'Profile Image',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.sp),
                            ),
                          ),
                          // If image file is not null, display it using Image widget
                          Container(
                            width: 500.w,
                            height: 500.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                15.r,
                              ),
                            ),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r))),
                              child: Center(
                                child: Text(
                                  'Choose image',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        if (emailController.text.isEmpty ||
                            passwordController.text.isEmpty ||
                            nameController.text.isEmpty ||
                            selectedValueRole == null ||
                            passwordConfirmationController.text.isEmpty ||
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
                              name: nameController.text,
                              image: _imageFile!,
                              password_confirmation:
                                  passwordConfirmationController.text,
                              role: selectedValueRole!,
                            );
                          } else {
                            Get.snackbar('Something wrong!',
                                'You need to input password and password confirmation is the same',
                                colorText: Colors.white,
                                margin: REdgeInsets.all(15.r),
                                backgroundColor: Colors.redAccent,
                                snackPosition: SnackPosition.TOP,
                                duration: const Duration(seconds: 30));
                          }
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: emailController.text.isEmpty ||
                                  passwordController.text.isEmpty ||
                                  nameController.text.isEmpty ||
                                  selectedValueRole == null ||
                                  passwordConfirmationController.text.isEmpty ||
                                  _imageFile == null
                              ? Colors.grey
                              : Colors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.r)))),
                      child: Padding(
                        padding: REdgeInsets.only(
                            top: 15.r, bottom: 15.r, left: 30.r, right: 30.r),
                        child: Text(
                          'Add',
                          style: TextStyle(fontSize: 20.sp),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
