import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/model/categories.dart';
import 'package:ebox_frontend_web_inventory/model/customers.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/model/suppliers.dart';
import 'package:ebox_frontend_web_inventory/views/category/widgets/category_edit.dart';
import 'package:ebox_frontend_web_inventory/views/customer/widgets/customer_edit.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_detail.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_edit.dart';
import 'package:ebox_frontend_web_inventory/views/suppliers/widgets/supplier_detail.dart';
import 'package:ebox_frontend_web_inventory/views/suppliers/widgets/supplier_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryCard extends StatelessWidget {
  final Categories categories;
  final int index;
  const CategoryCard(
      {super.key, required this.categories, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 100.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          color: Colors.white),
      child: Row(
        children: [
          Padding(
            padding: REdgeInsets.only(left: 15.r, top: 10.r, bottom: 10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  categories.name,
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Create date: ${categories.created_at}',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
              ],
            ),
          ),
          Spacer(),
          Obx(() {
            if (authController.user.value!.role != 'admin') {
              return SizedBox();
            } else {
              return Padding(
                padding: REdgeInsets.all(15.r),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.dialog(CategoryEdit(categories: categories));
                        },
                        icon: Icon(Icons.edit, color: Colors.blue, size: 25.r)),
                    IconButton(
                        onPressed: () {
                          AwesomeDialog(
                            context: context,
                            width: 600.w,
                            dialogType: DialogType.warning,
                            animType: AnimType.bottomSlide,
                            title: 'WARNING'.tr,
                            desc:
                                'Are you sure you want to delete ${categories.name}?'
                                    .tr,
                            btnCancelOnPress: () {},
                            btnOkOnPress: () {
                              categoryController.delete(id: categories.id);
                            },
                          ).show();
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 25.r,
                        ))
                  ],
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}
