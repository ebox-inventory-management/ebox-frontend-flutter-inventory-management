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

class AddProductCompoundCard extends StatefulWidget {
  final Products product;
  final int index;

  const AddProductCompoundCard({
    super.key,
    required this.product,
    required this.index,
  });

  @override
  State<AddProductCompoundCard> createState() => _AddProductCompoundCardState();
}

class _AddProductCompoundCardState extends State<AddProductCompoundCard> {
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
            Obx(() {
              if (compoundProductController.productsCompound.entries
                  .map((data) => data.key.product_name)
                  .toList()
                  .contains(widget.product.product_name)) {
                return SizedBox(
                  width: 120.w,
                  height: 40.w,
                  child: Center(
                    child: SizedBox(
                      width: 120.w,
                      height: 40.w,
                      child: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 40.r,
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: GestureDetector(
                    onTap: () {
                      compoundProductController.addProduct(
                          productCompound: ProductCompound(
                            id: widget.product.id,
                            export_price: widget.product.export_price,
                            product_image: widget.product.product_image,
                            product_name: widget.product.product_name,
                          ),
                          context: context);
                    },
                    child: Container(
                        width: 120.w,
                        height: 40.w,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.r))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 25.r,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text(
                              'Select'.tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        )),
                  ),
                );
              }
            }),
            SizedBox(
              width: 15.r,
            ),
          ],
        ),
      ),
    );
  }
}
