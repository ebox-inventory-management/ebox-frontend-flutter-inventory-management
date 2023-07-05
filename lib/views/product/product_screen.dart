import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/core/constants/base_url.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_add.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(30.w),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Icon(
                  Icons.inventory,
                  size: 30.r,
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  'Product',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
                ),
              ],
            ),
            Padding(
              padding: REdgeInsets.only(top: 15.w, bottom: 15.r),
              child: Divider(
                color: Colors.black.withOpacity(0.1),
                thickness: 5.w,
              ),
            ),
            Material(
              borderRadius: BorderRadius.circular(15),
              child: Obx(
                () => TextField(
                  controller: productController.searchProductsController,
                  onSubmitted: (value) {
                    productController.getProductsByKeyword(keyword: value);
                  },
                  onChanged: (value) {
                    if (value.isEmpty) {
                      productController.getProducts();
                    } else {
                      productController.searchVal.value = value;
                    }
                  },
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                    prefixIconColor: Colors.grey,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20.r,
                    ),
                    suffixIconColor: Colors.grey,
                    suffixIcon: productController.searchVal.value.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              FocusScope.of(context).requestFocus(FocusNode());

                              productController.searchProductsController
                                  .clear();
                              productController.searchVal.value = '';
                              productController.getProducts();
                            },
                            icon: Icon(
                              Icons.clear,
                              size: 20.r,
                            ))
                        : null,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search products'.tr,
                    hintStyle: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300),
                    contentPadding: REdgeInsets.only(top: 30),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30.r)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30.r)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: REdgeInsets.only(top: 30.w, bottom: 15.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
                  TextButton(
                      onPressed: () {
                        Get.dialog(const ProductAdd());
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
                              Icons.add,
                              size: 30.r,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'Add Product',
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
              if (productController.isProductsLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (productController.productsList.isNotEmpty) {
                  return ProductList(products: productController.productsList);
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
