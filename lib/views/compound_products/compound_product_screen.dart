import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/core/constants/base_url.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/views/compound_products/widgets/compound_product_add.dart';
import 'package:ebox_frontend_web_inventory/views/compound_products/widgets/compound_product_list.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_add.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompoundProductScreen extends StatelessWidget {
  const CompoundProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(30.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Icon(
                  Icons.list_alt,
                  size: 30.r,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Compound Products',
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
                  controller: compoundProductController
                      .searchCompoundProductsController,
                  onSubmitted: (value) {
                    compoundProductController.getCompoundProductsByKeyword(
                        keyword: value);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      compoundProductController.getCompoundProducts();
                    } else {
                      compoundProductController.searchVal.value = value;
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
                    suffixIcon: compoundProductController
                            .searchVal.value.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              FocusScope.of(context).requestFocus(FocusNode());

                              compoundProductController
                                  .searchCompoundProductsController
                                  .clear();
                              compoundProductController.searchVal.value = '';
                              compoundProductController.getCompoundProducts();
                            },
                            icon: Icon(
                              Icons.clear,
                              size: 20.r,
                            ))
                        : null,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search compound products'.tr,
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
                  SizedBox(),
                  TextButton(
                      onPressed: () {
                        Get.dialog(const CompoundProductAdd());
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
                              'Add Compound Product',
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
              if (compoundProductController.isCompoundProductsLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (compoundProductController.compoundProductsList.isNotEmpty) {
                  return CompoundProductList(
                      compoundProductList:
                          compoundProductController.compoundProductsList);
                } else {
                  return Center(
                    child: Column(
                      children: [
                        Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/ebox-inventory-management.appspot.com/o/empty.png?alt=media&token=06b30b38-cac0-490e-ac6a-6373fe120a16',
                          scale: 4,
                        ),
                        Text(
                          'Empty Compound Product!',
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
