import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/model/categories.dart';
import 'package:ebox_frontend_web_inventory/model/customers.dart';
import 'package:ebox_frontend_web_inventory/model/product.dart';
import 'package:ebox_frontend_web_inventory/model/suppliers.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomerCard extends StatelessWidget {
  final Customers customers;
  final int index;

  const CustomerCard({super.key, required this.customers, required this.index});

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
                        'https://cdn-icons-png.flaticon.com/512/4143/4143107.png'),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: REdgeInsets.only(left: 15.r, top: 10.r, bottom: 10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  customers.name,
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
                ),
                Text(
                  customers.phone,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
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
                        width: 600.w,
                        dialogType: DialogType.warning,
                        animType: AnimType.bottomSlide,
                        title: 'WARNING'.tr,
                        desc: 'Would you sure like to delete ${customers.name}?'
                            .tr,
                        btnCancelOnPress: () {},
                        btnOkOnPress: () {
                          Get.snackbar('Deleted!', ''.tr,
                              colorText: Colors.white,
                              margin: REdgeInsets.all(15),
                              backgroundColor: Colors.green,
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 2));

                          productController.deleteProduct(id: customers.id);
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
