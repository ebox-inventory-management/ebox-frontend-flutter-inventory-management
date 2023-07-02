import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/core/constants/base_url.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/views/export/widgets/export_product_add.dart';
import 'package:ebox_frontend_web_inventory/views/export/widgets/export_product_list.dart';
import 'package:ebox_frontend_web_inventory/views/import/widgets/import_product_add.dart';
import 'package:ebox_frontend_web_inventory/views/import/widgets/import_product_list.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_add.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ExportScreen extends StatelessWidget {
  const ExportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: REdgeInsets.all(30.r),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Icon(
                  Icons.upload,
                  size: 30.r,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Export',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
                ),
              ],
            ),
            Padding(
              padding: REdgeInsets.only(top: 15.r),
              child: Divider(
                color: Colors.black.withOpacity(0.1),
                thickness: 5.w,
              ),
            ),
            Padding(
              padding: REdgeInsets.only(top: 30.w, bottom: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'History Exports',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.sp,
                        color: Colors.grey),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.dialog(const ExportProductAdd());
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
                              Icons.download,
                              size: 30.r,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'Export Product',
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
              if (exportController.isExportLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (exportController.exportList.isNotEmpty) {
                  return ExportProductList(
                      exports: exportController.exportList);
                } else {
                  return Center(
                    child: Column(
                      children: [
                        Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/ebox-inventory-management.appspot.com/o/delivery.png?alt=media&token=d7d350d3-a537-4fee-aa4c-87b0de4f4801',
                          scale: 4,
                        ),
                        Text(
                          'No export any product yet!',
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
