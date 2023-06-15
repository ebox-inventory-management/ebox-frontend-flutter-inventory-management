import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:ebox_frontend_web_inventory/model/product.dart';
import 'package:ebox_frontend_web_inventory/model/supplier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/controllers.dart';
import '../../../model/brand.dart';

class ProductDetail extends StatelessWidget {
  final Product product;
  const ProductDetail({super.key, required this.product});

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
                            size: 30.r,
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
                                width: 250.w,
                                height: 50.w,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.r))),
                                child: Center(
                                  child: Text(
                                    'Import Date: ${DateFormat('dd/MM/yyyy').format(product.created_at)}',
                                    style: TextStyle(
                                        fontSize: 16.sp, color: Colors.white),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 30.w,
                              ),
                              Container(
                                width: 250.w,
                                height: 50.w,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.r))),
                                child: Center(
                                  child: Text(
                                    'Update Date: ${DateFormat('dd/MM/yyyy').format(product.updated_at)}',
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
                                product.product_name,
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
                              'Product Quantity: ${product.product_quantity}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: Colors.red),
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            Text(
                              'Import Price: \$${product.import_price}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: Colors.red),
                            ),
                            SizedBox(
                              height: 5.w,
                            ),
                            Text(
                              'Export Price: \$${product.export_price}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18.sp,
                                  color: Colors.red),
                            ),
                            SizedBox(
                              height: 30.w,
                            ),
                            Text(
                              'Product Code: ${product.product_code}',
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Text(
                              'Product Garage: ${product.product_garage}',
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Text(
                              'Product Route: ${product.product_route}',
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.grey),
                            ),
                            SizedBox(
                              height: 30.w,
                            ),
                            Container(
                              width: 400.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: Center(
                                child: Text(
                                  'Buy Date: ${product.created_at}',
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Container(
                              width: 400.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: Center(
                                child: Text(
                                  'Expire Date: ${product.expire_date}',
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.w,
                            ),
                            Text(
                              'Category',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Container(
                              width: 250.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: Center(
                                child: Text(
                                  '${categoryController.category.value?.name}',
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.w,
                            ),
                            Text(
                              'Supplier',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Container(
                              width: 250.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: Center(
                                child: Text(
                                  '${supplierController.supplier.value?.name}',
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30.w,
                            ),
                            Text(
                              'Brand',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16.sp),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Container(
                              width: 250.w,
                              height: 50.w,
                              decoration: BoxDecoration(
                                  color: Colors.orangeAccent,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.r))),
                              child: Center(
                                child: Text(
                                  '${brandController.brand.value?.name}',
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
