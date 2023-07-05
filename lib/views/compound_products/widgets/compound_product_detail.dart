import 'package:ebox_frontend_web_inventory/model/category.dart';
import 'package:ebox_frontend_web_inventory/model/compound_products.dart';
import 'package:ebox_frontend_web_inventory/model/product.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/model/supplier.dart';
import 'package:ebox_frontend_web_inventory/views/compound_products/widgets/product_compound/product_compound_card.dart';

import 'package:ebox_frontend_web_inventory/views/product/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/controllers.dart';
import '../../../model/brand.dart';
import '../../product/widgets/product_card.dart';

class CompoundProductDetail extends StatelessWidget {
  final CompoundProducts compoundProducts;
  final int index;
  const CompoundProductDetail(
      {super.key, required this.compoundProducts, required this.index});

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
                        'Compound Product Detail',
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
                              compoundProducts.name,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30.sp),
                            ),
                          ),
                          SizedBox(
                            height: 15.w,
                          ),
                          Text(
                            compoundProducts.price.toString(),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18.sp,
                                color: Colors.red),
                          ),
                          SizedBox(
                            height: 30.w,
                          ),
                          Text(
                            compoundProducts.description,
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.grey),
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
                                'Create Date: ${compoundProducts.created_at}',
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
                                'Update Date: ${compoundProducts.updated_at}',
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 0.4.sw,
                        decoration: BoxDecoration(
                            color: Colors.grey[100],
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              itemCount: compoundProducts.product_id.length,
                              shrinkWrap: true,
                              padding: REdgeInsets.all(15.r),
                              itemBuilder: (context, index) {
                                return ProductCompoundCard(
                                  product: Products(
                                      id: compoundProducts.product_id[index],
                                      product_name:
                                          compoundProducts.product_name[index],
                                      product_url:
                                          compoundProducts.product_url[index],
                                      product_amount: compoundProducts
                                          .product_amount[index],
                                      product_code:
                                          compoundProducts.product_code[index],
                                      product_quantity: compoundProducts
                                          .product_quantity[index],
                                      product_garage: compoundProducts
                                          .product_garage[index],
                                      product_route:
                                          compoundProducts.product_route[index],
                                      product_image:
                                          compoundProducts.product_image[index],
                                      expire_date:
                                          compoundProducts.expire_date[index],
                                      import_price:
                                          compoundProducts.import_price[index],
                                      export_price:
                                          compoundProducts.export_price[index],
                                      created_at: compoundProducts
                                          .product_created_at[index],
                                      updated_at: compoundProducts
                                          .product_updated_at[index],
                                      category_id:
                                          compoundProducts.category_id[index],
                                      supplier_id:
                                          compoundProducts.supplier_id[index],
                                      brand_id:
                                          compoundProducts.brand_id[index]),
                                  price: compoundProducts.price,
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(
                                  height: 15.w,
                                );
                              },
                            )
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
