import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/model/compound_products.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/views/compound_products/widgets/compound_product_detail.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_detail.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CompoundProductCard extends StatefulWidget {
  final CompoundProducts compoundProducts;
  final int index;

  const CompoundProductCard(
      {super.key, required this.compoundProducts, required this.index});

  @override
  State<CompoundProductCard> createState() => _CompoundProductCardState();
}

class _CompoundProductCardState extends State<CompoundProductCard> {
  @override
  initState() {
    super.initState();
    supplierController.getSupplierById(
        id: widget.compoundProducts.supplier_id[widget.index]);
    categoryController.getCategoryById(
        id: widget.compoundProducts.category_id[widget.index]);
    brandController.getBrandById(
        id: widget.compoundProducts.brand_id[widget.index]);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.dialog(CompoundProductDetail(
          compoundProducts: widget.compoundProducts,
          index: widget.index,
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
                      image: NetworkImage(
                          widget.compoundProducts.product_image[widget.index]),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: REdgeInsets.only(left: 15.r, top: 10.r, bottom: 10.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.compoundProducts.name,
                    style:
                        TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    widget.compoundProducts.price.toString(),
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
                      onPressed: () {
                        AwesomeDialog(
                          context: context,
                          width: 600.w,
                          dialogType: DialogType.warning,
                          animType: AnimType.bottomSlide,
                          title: 'WARNING'.tr,
                          desc:
                              'Are you sure you want to delete ${widget.compoundProducts.name}?'
                                  .tr,
                          btnCancelOnPress: () {},
                          btnOkOnPress: () {
                            compoundProductController.deleteCompoundProduct(
                                id: widget.compoundProducts.id,
                                name: widget.compoundProducts.name);
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
