import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/model/supplier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/controllers.dart';
import '../../../model/brand.dart';

class ProductDetail extends StatelessWidget {
  final Products product;
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
        child: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.all(30.r),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Product Detail',
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 450.w,
                            child: Text(
                              product.product_name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30.sp),
                            ),
                          ),
                          SizedBox(
                            height: 15.w,
                          ),
                          Text(
                            'Quantity: ${product.product_quantity}',
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
                            height: 5.w,
                          ),
                          Text(
                            'Product amount: \$${product.product_amount}',
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
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Text(
                            'Product Garage: ${product.product_garage}',
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          Text(
                            'Product Route: ${product.product_route}',
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.grey),
                          ),
                          SizedBox(
                            height: 30.w,
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
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 0.4.sw,
                            height: 0.4.sw,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.r)),
                                image: DecorationImage(
                                    image: NetworkImage(product.product_image),
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
                                'Create Date: ${product.created_at}',
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
                                'Update Date: ${product.created_at}',
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
