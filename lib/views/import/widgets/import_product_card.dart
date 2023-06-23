import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/model/import.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_detail.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ImportProductCard extends StatelessWidget {
  final Import import;

  const ImportProductCard({super.key, required this.import});

  @override
  Widget build(BuildContext context) {
    productController.getProductsById(id: import.product_id);

    return GestureDetector(
      onTap: () => Get.dialog(
        ProductDetail(
            product: Products(
                id: productController.product.value!.id,
                product_name: productController.product.value!.product_name,
                product_amount: productController.product.value!.product_amount,
                product_code: productController.product.value!.product_code,
                product_quantity:
                    productController.product.value!.product_quantity,
                product_garage: productController.product.value!.product_garage,
                product_route: productController.product.value!.product_route,
                product_image: productController.product.value!.product_image,
                expire_date: productController.product.value!.expire_date,
                import_price: productController.product.value!.import_price,
                export_price: productController.product.value!.export_price,
                created_at: productController.product.value!.created_at,
                updated_at: productController.product.value!.updated_at,
                category_id: productController.product.value!.category_id,
                supplier_id: productController.product.value!.supplier_id,
                brand_id: productController.product.value!.brand_id)),
      ),
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
                    productController.product.value?.product_name ?? 'Not Yet',
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Total Price: \$${import.total_import_price}',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: REdgeInsets.all(15.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quantity: ${import.import_quantity}',
                    style: TextStyle(fontSize: 16.sp, color: Colors.black),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  Text(
                    'Imported Date: ${import.created_at}',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
