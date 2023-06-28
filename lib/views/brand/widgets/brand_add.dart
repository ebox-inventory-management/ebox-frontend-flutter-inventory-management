import 'package:collection/collection.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/controllers.dart';

class BrandAdd extends StatefulWidget {
  const BrandAdd({super.key});

  @override
  State<BrandAdd> createState() => _BrandAddState();
}

class _BrandAddState extends State<BrandAdd> {
  TextEditingController nameController = TextEditingController();

  Color backgroundColor = Colors.grey;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
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
                        'Add Category',
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
                  Text(
                    'Brand Name',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                  Padding(
                    padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                    child: SizedBox(
                      width: 0.4.sw,
                      child: TextFormField(
                        controller: nameController,
                        onChanged: (val) {
                          setState(() {
                            backgroundColor =
                                val.isNotEmpty ? Colors.orange : Colors.grey;
                          });
                        },
                        textInputAction: TextInputAction.next,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0.r),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        if (nameController.text.isEmpty) {
                          Get.snackbar('Something wrong!',
                              'You need to input brand name to add',
                              colorText: Colors.white,
                              margin: REdgeInsets.all(15),
                              backgroundColor: Colors.redAccent,
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 2));
                          return;
                        } else {
                          brandController.create(
                            name: nameController.text,
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: backgroundColor,
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
