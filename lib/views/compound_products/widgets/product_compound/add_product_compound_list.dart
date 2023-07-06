import 'package:ebox_frontend_web_inventory/model/suppliers.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controller/controllers.dart';
import '../../../../model/products.dart';
import 'add_product_compound_card.dart';
import 'package:get/get.dart';

class AddProductCompoundList extends StatelessWidget {
  final List<Products> products;
  const AddProductCompoundList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 15.r, bottom: 15.r),
      child: Container(
        width: 0.4.sw,
        height: 0.6.sw,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.all(Radius.circular(15.r))),
        child: Column(
          children: [
            Padding(
              padding: REdgeInsets.all(15.r),
              child: Material(
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
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());

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
                      hintText: 'Search products',
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
            ),
            ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: products.length,
              padding: REdgeInsets.all(15.r),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AddProductCompoundCard(
                  product: products[index],
                  index: index,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 15.w,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
