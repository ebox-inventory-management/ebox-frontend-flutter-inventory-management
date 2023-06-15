import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/model/categories.dart';
import 'package:ebox_frontend_web_inventory/model/product.dart';
import 'package:ebox_frontend_web_inventory/model/suppliers.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_detail.dart';
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
          Container(
            width: 100.w,
            height: 100.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.r)),
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
                    fit: BoxFit.cover)),
          ),
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
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: REdgeInsets.all(15.r),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit, color: Colors.blue, size: 25.r)),
                IconButton(
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.warning,
                        animType: AnimType.bottomSlide,
                        title: 'WARNING'.tr,
                        desc:
                            'Would you sure like to delete ${categories.name}?'
                                .tr,
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          Get.snackbar('Deleted!', ''.tr,
                              colorText: Colors.white,
                              margin: REdgeInsets.all(15),
                              backgroundColor: Colors.green,
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 2));

                          productController.deleteProduct(id: categories.id);
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
          )
        ],
      ),
    );
  }
}
