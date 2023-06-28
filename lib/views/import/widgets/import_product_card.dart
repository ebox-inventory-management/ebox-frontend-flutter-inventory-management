import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/model/import.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_detail.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ImportProductCard extends StatelessWidget {
  final Import import;

  const ImportProductCard({super.key, required this.import});

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
                  import.product_name,
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Total Price: \$${import.total_import_price}',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: REdgeInsets.all(15.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Quantity: ${import.import_quantity}',
                  style: TextStyle(fontSize: 16.sp, color: Colors.black),
                ),
                SizedBox(
                  height: 5.w,
                ),
                Text(
                  'Imported Date: ${import.created_at}',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
