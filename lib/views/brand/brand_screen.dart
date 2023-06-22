import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/core/constants/base_url.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/views/brand/widgets/brand_add.dart';
import 'package:ebox_frontend_web_inventory/views/brand/widgets/brand_list.dart';
import 'package:ebox_frontend_web_inventory/views/category/widgets/category_add.dart';
import 'package:ebox_frontend_web_inventory/views/category/widgets/category_list.dart';
import 'package:ebox_frontend_web_inventory/views/customer/widgets/customer_add.dart';
import 'package:ebox_frontend_web_inventory/views/customer/widgets/customer_list.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_list.dart';
import 'package:ebox_frontend_web_inventory/views/suppliers/widgets/supplier_add.dart';
import 'package:ebox_frontend_web_inventory/views/suppliers/widgets/supplier_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../product/widgets/product_add.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: REdgeInsets.all(30.r),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Icon(
                  Icons.person,
                  size: 30.r,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Brand',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
                ),
              ],
            ),
            Padding(
              padding: REdgeInsets.only(top: 15.w, bottom: 15.r),
              child: Divider(
                color: Colors.black.withOpacity(0.1),
                thickness: 5.w,
              ),
            ),
            Material(
              borderRadius: BorderRadius.circular(15),
              child: Obx(
                () => TextField(
                  controller: brandController.searchBrandsController,
                  onSubmitted: (value) {
                    brandController.getBrandsByKeyword(keyword: value);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      brandController.getBrands();
                    } else {
                      brandController.searchVal.value = value;
                    }
                  },
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                    prefixIconColor: Colors.grey,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20.r,
                    ),
                    suffixIconColor: Colors.grey,
                    suffixIcon: brandController.searchVal.value.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              brandController.searchBrandsController.clear();
                              brandController.searchVal.value = '';
                              brandController.getBrands();
                            },
                            icon: Icon(
                              Icons.clear,
                              size: 20.r,
                            ))
                        : null,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search brand'.tr,
                    hintStyle: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300),
                    contentPadding: REdgeInsets.only(top: 30),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30.r)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30.r)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: REdgeInsets.only(top: 30.w, bottom: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Brands',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        color: Colors.grey),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.dialog(const BrandAdd());
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r))),
                      ),
                      child: Padding(
                        padding: REdgeInsets.all(15.r),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              size: 30.r,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'Add Brand',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Obx(() {
              if (brandController.isBrandsLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (brandController.brandsList.isNotEmpty) {
                  return BrandList(brands: brandController.brandsList);
                } else {
                  return Center(
                    child: Column(
                      children: [
                        Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/ebox-inventory-management.appspot.com/o/supplier.png?alt=media&token=0de506d7-66c6-4efb-95a3-d28840f46691',
                          scale: 4,
                        ),
                        Text(
                          'Brand Not Found!',
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
