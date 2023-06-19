import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/model/supplier.dart';
import 'package:ebox_frontend_web_inventory/model/suppliers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/controllers.dart';
import '../../../model/brand.dart';
import '../../product/widgets/product_list.dart';

class SupplierDetail extends StatelessWidget {
  final Suppliers suppliers;
  const SupplierDetail({super.key, required this.suppliers});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 0.9.sw,
        height: 0.9.sh,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15.r))),
        child: Padding(
          padding: REdgeInsets.all(30.r),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: REdgeInsets.only(top: 30.w, bottom: 15.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Products from ${suppliers.name}',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.sp,
                          color: Colors.grey),
                    ),
                    SizedBox(),
                  ],
                ),
              ),
              // Obx(() {
              //   return null;
              // }),
            ]),
          ),
        ),
      ),
    );
  }
}
