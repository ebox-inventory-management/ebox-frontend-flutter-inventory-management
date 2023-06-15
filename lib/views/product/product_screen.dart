import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/core/constants/base_url.dart';
import 'package:ebox_frontend_web_inventory/model/product.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: REdgeInsets.all(30.r),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: REdgeInsets.only(bottom: 30.w),
              child: Text(
                'Product',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
              ),
            ),
            Divider(),
            TextFormField(
              textInputAction: TextInputAction.next,
              obscureText: false,
              decoration: InputDecoration(
                focusColor: Colors.white,
                hoverColor: Colors.white,
                hintText: 'Product Name',
                hintStyle: TextStyle(fontSize: 14.sp),
                labelStyle: TextStyle(fontSize: 14.sp),
                filled: true,
                fillColor: Colors.white,
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15.r)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(15.r)),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Obx(() {
              if (productController.isProductLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (productController.productList.isNotEmpty) {
                  return ProductList(products: productController.productList);
                } else {
                  return Center(
                    child: Column(
                      children: [
                        Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/ebox-inventory-management.appspot.com/o/empty.png?alt=media&token=06b30b38-cac0-490e-ac6a-6373fe120a16',
                          scale: 4,
                        ),
                        Text(
                          'Product Not Found!',
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
