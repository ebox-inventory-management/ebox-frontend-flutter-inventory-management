import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/core/constants/base_url.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_list.dart';
import 'package:ebox_frontend_web_inventory/views/suppliers/widgets/supplier_add.dart';
import 'package:ebox_frontend_web_inventory/views/suppliers/widgets/supplier_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../product/widgets/product_add.dart';

class SupplierScreen extends StatelessWidget {
  const SupplierScreen({super.key});

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
                  Icons.factory,
                  size: 30.r,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Supplier',
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
                  controller: supplierController.searchSuppliersController,
                  onSubmitted: (value) {
                    supplierController.getSupplierByKeyword(keyword: value);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      supplierController.getSuppliers();
                    } else {
                      supplierController.searchVal.value = value;
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
                    suffixIcon: supplierController.searchVal.value.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              FocusScope.of(context).requestFocus(FocusNode());

                              supplierController.searchSuppliersController
                                  .clear();
                              supplierController.searchVal.value = '';
                              supplierController.getSuppliers();
                            },
                            icon: Icon(
                              Icons.clear,
                              size: 20.r,
                            ))
                        : null,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search supplier'.tr,
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
            Obx(() {
              if (authController.user.value!.role != 'admin') {
                return SizedBox(
                  height: 30.w,
                );
              } else {
                return Padding(
                  padding: REdgeInsets.only(top: 30.w, bottom: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(),
                      TextButton(
                          onPressed: () {
                            Get.dialog(const SupplierAdd());
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.green,
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
                                  'Add Supplier',
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
                );
              }
            }),
            Obx(() {
              if (supplierController.isSuppliersLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (supplierController.suppliersList.isNotEmpty) {
                  return SupplierList(
                      suppliers: supplierController.suppliersList);
                } else {
                  return Center(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/images/empty.png',
                          scale: 4,
                        ),
                        Text(
                          'Supplier Not Found!',
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
