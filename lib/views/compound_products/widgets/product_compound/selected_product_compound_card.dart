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

class SelectedProductCompoundCard extends StatefulWidget {
  final ProductCompound productCompound;
  final int quantity;
  final int index;

  const SelectedProductCompoundCard({
    super.key,
    required this.index,
    required this.productCompound,
    required this.quantity,
  });

  @override
  State<SelectedProductCompoundCard> createState() =>
      _SelectedProductCompoundCardState();
}

class _SelectedProductCompoundCardState
    extends State<SelectedProductCompoundCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    image: NetworkImage(widget.productCompound.product_image),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: REdgeInsets.only(left: 15.r, top: 10.r, bottom: 10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.productCompound.product_name,
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  '\$ ${widget.productCompound.export_price}',
                  style: TextStyle(
                      fontSize: 24.sp,
                      color: Colors.red,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              compoundProductController.removeProduct(
                  productCompound: widget.productCompound);
            },
            icon: Icon(
              Icons.remove_circle,
              color: Colors.red,
              size: 30.r,
            ),
          ),
          Padding(
            padding: REdgeInsets.only(left: 10.r, right: 5.r),
            child: Text(
              widget.quantity.toString(),
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
          ),
          IconButton(
            onPressed: () {
              compoundProductController.addProduct(
                  context: context, productCompound: widget.productCompound);
            },
            icon: Icon(
              Icons.add_circle,
              color: Colors.green,
              size: 30.r,
            ),
          ),
          SizedBox(
            width: 15.r,
          )
        ],
      ),
    );
  }
}
