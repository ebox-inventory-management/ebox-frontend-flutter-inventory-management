import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/model/compound_products.dart';
import 'package:ebox_frontend_web_inventory/model/product_compound.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_detail.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductCompoundCard extends StatefulWidget {
  final Products product;
  final int price;

  const ProductCompoundCard({
    super.key,
    required this.product,
    required this.price,
  });

  @override
  State<ProductCompoundCard> createState() => _ProductCompoundCardState();
}

class _ProductCompoundCardState extends State<ProductCompoundCard> {
  @override
  initState() {
    super.initState();
    supplierController.getSupplierById(id: widget.product.supplier_id);
    categoryController.getCategoryById(id: widget.product.category_id);
    brandController.getBrandById(id: widget.product.brand_id);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.dialog(ProductDetail(
          product: widget.product,
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
                  image: DecorationImage(
                      image: NetworkImage(widget.product.product_image),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: REdgeInsets.only(left: 15.r, top: 10.r, bottom: 10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.product.product_name,
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'Quantity: ${widget.product.product_quantity}',
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Spacer(),
            Text(
              widget.price.toString(),
              style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}
