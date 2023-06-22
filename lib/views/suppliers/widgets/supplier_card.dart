import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/model/suppliers.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_detail.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_edit.dart';
import 'package:ebox_frontend_web_inventory/views/suppliers/widgets/supplier_detail.dart';
import 'package:ebox_frontend_web_inventory/views/suppliers/widgets/supplier_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SupplierCard extends StatelessWidget {
  final Suppliers suppliers;
  final int index;
  const SupplierCard({super.key, required this.suppliers, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.dialog(SupplierDetail(
          suppliers: suppliers,
        ));
      },
      child: Container(
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
                    suppliers.name,
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Phone Number: ${suppliers.phone}',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
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
                      onPressed: () {
                        Get.dialog(SupplierEdit(suppliers: suppliers));
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
                              'Are you sure you want to delete ${suppliers.name}?'
                                  .tr,
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            supplierController.delete(id: suppliers.id);
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
      ),
    );
  }
}
