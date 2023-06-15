import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/core/constants/base_url.dart';
import 'package:ebox_frontend_web_inventory/model/product.dart';
import 'package:ebox_frontend_web_inventory/views/category/widgets/category_list.dart';
import 'package:ebox_frontend_web_inventory/views/customer/widgets/customer_list.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_list.dart';
import 'package:ebox_frontend_web_inventory/views/suppliers/widgets/supplier_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomerScreen extends StatelessWidget {
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: REdgeInsets.all(30.r),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: REdgeInsets.only(bottom: 30.w),
              child: Text(
                'Customer',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
              ),
            ),
            Divider(),
            TextFormField(
              textInputAction: TextInputAction.next,
              obscureText: false,
              decoration: InputDecoration(
                focusColor: Colors.white,
                hoverColor: Colors.white,
                hintText: 'Customer Name',
                hintStyle: TextStyle(fontSize: 14.sp),
                labelStyle: TextStyle(fontSize: 14.sp),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15.r)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15.r)),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Obx(() {
              if (customerController.isCustomersLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (customerController.customersList.isNotEmpty) {
                  return CustomerList(
                      customers: customerController.customersList);
                } else {
                  return Center(
                    child: Column(
                      children: [
                        Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/ebox-inventory-management.appspot.com/o/empty.png?alt=media&token=06b30b38-cac0-490e-ac6a-6373fe120a16',
                          scale: 4,
                        ),
                        Text(
                          'Customer Not Found!',
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
            }),
          ]),
        ),
      ),
    );
  }
}
