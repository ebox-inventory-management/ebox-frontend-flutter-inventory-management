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
        child: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.all(30.r),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Supplier Detail',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.sp),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.cancel,
                            size: 40.r,
                            color: Colors.grey,
                          ))
                    ],
                  ),
                  Padding(
                    padding: REdgeInsets.only(top: 15.w, bottom: 15.r),
                    child: Divider(
                      color: Colors.black.withOpacity(0.1),
                      thickness: 5.w,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: REdgeInsets.only(left: 30.r, right: 30.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 450.w,
                              child: Text(
                                suppliers.name,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30.sp),
                              ),
                            ),
                            SizedBox(
                              height: 15.w,
                            ),
                            Text(
                              'Phone Number',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Container(
                              width: 400.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: Center(
                                child: Text(
                                  suppliers.phone,
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15.w,
                            ),
                            Text(
                              'Email',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Container(
                              width: 400.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: Center(
                                child: Text(
                                  suppliers.email,
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.w,
                            ),
                            Text(
                              'Address',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Container(
                              width: 400.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: Center(
                                child: Text(
                                  suppliers.address,
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.w,
                            ),
                            Text(
                              'City',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Container(
                              width: 400.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: Center(
                                child: Text(
                                  suppliers.city,
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.w,
                            ),
                            Text(
                              'Type',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Container(
                              width: 400.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: Center(
                                child: Text(
                                  suppliers.type,
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.w,
                            ),
                            Text(
                              'Shop Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Container(
                              width: 400.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: Center(
                                child: Text(
                                  suppliers.shop_name,
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.w,
                            ),
                            Text(
                              'Bank Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Container(
                              width: 400.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: Center(
                                child: Text(
                                  suppliers.bank_name,
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.w,
                            ),
                            Text(
                              'Bank Number',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Container(
                              width: 400.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: Center(
                                child: Text(
                                  suppliers.bank_number,
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 0.4.sw,
                            height: 0.4.sw,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.r)),
                                image: DecorationImage(
                                    image: NetworkImage(suppliers.photo),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            height: 30.w,
                          ),
                          Container(
                            width: 0.4.sw,
                            height: 50.w,
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r))),
                            child: Center(
                              child: Text(
                                'Create Date: ${suppliers.created_at}',
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.w,
                          ),
                          Container(
                            width: 0.4.sw,
                            height: 50.w,
                            decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.r))),
                            child: Center(
                              child: Text(
                                'Update Date: ${suppliers.created_at}',
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
