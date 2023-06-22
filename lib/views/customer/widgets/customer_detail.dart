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
import '../../../model/customers.dart';

class CustomerDetail extends StatelessWidget {
  final Customers customers;
  const CustomerDetail({super.key, required this.customers});

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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SizedBox(),
                      Spacer(),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 700.w,
                            height: 700.w,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.r)),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
                                    fit: BoxFit.cover)),
                          ),
                          SizedBox(
                            height: 15.w,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 300.w,
                                height: 50.w,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.r))),
                                child: Center(
                                  child: Text(
                                    'Create Date: ${customers.created_at}',
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Container(
                                width: 300.w,
                                height: 50.w,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.r))),
                                child: Center(
                                  child: Text(
                                    'Update Date: ${customers.created_at}',
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: REdgeInsets.only(left: 30.r, right: 30.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 450.w,
                              child: Text(
                                customers.name,
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
                                  customers.phone,
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
                                  customers.email,
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
                                  customers.address,
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
                                  customers.city,
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
                                  customers.shop_name,
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
                                  customers.bank_name,
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
                                  customers.bank_number,
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
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
