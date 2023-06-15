import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/model/product.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    supplierController.getSupplierById(id: product.supplier_id);
    categoryController.getCategoryById(id: product.category_id);
    brandController.getBrandById(id: product.brand_id);
    return GestureDetector(
      onTap: () {
        Get.dialog(ProductDetail(
          product: product,
        ));
      },
      child: Container(
        width: 1.sw,
        height: 100.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
            color: Colors.white),
        child: Row(
          children: [
            Container(
              width: 100.w,
              height: 100.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: REdgeInsets.only(left: 15.r, top: 10.r, bottom: 10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.product_name,
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    product.product_code,
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: REdgeInsets.all(15.r),
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.edit, color: Colors.blue, size: 25.r)),
                  IconButton(
                      onPressed: () {
                        AwesomeDialog(
                          context: context,
                          dialogType: DialogType.warning,
                          animType: AnimType.bottomSlide,
                          title: 'WARNING'.tr,
                          desc:
                              'Would you sure like to delete ${product.product_name}?'
                                  .tr,
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            Get.snackbar('Deleted!', ''.tr,
                                colorText: Colors.white,
                                margin: REdgeInsets.all(15),
                                backgroundColor: Colors.green,
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 2));

                            productController.deleteProduct(id: product.id);
                          },
                        ).show();
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 25.r,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
