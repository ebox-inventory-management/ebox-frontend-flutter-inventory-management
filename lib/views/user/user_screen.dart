import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/core/constants/base_url.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/views/customer/widgets/customer_add.dart';
import 'package:ebox_frontend_web_inventory/views/customer/widgets/customer_list.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_list.dart';
import 'package:ebox_frontend_web_inventory/views/suppliers/widgets/supplier_add.dart';
import 'package:ebox_frontend_web_inventory/views/suppliers/widgets/supplier_list.dart';
import 'package:ebox_frontend_web_inventory/views/user/user_add.dart';
import 'package:ebox_frontend_web_inventory/views/user/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../product/widgets/product_add.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: REdgeInsets.all(30.r),
        child: SingleChildScrollView(
          child: Obx(() {
            if (authController.user.value!.role != 'admin') {
              return Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/error.png',
                      scale: 4,
                    ),
                    Text(
                      'Error, Only admin can view this page!',
                      style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp),
                    ),
                  ],
                ),
              );
            } else {
              if (authController.isUsersLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (authController.usersList.isNotEmpty) {
                  return UserList(users: authController.usersList);
                } else {
                  return Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/empty.png',
                          scale: 4,
                        ),
                        Text(
                          'User Not Found!',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp),
                        ),
                      ],
                    ),
                  );
                }
              }
            }
          }),
        ),
      ),
    );
  }
}
