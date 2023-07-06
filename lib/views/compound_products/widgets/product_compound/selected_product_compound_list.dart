import 'package:ebox_frontend_web_inventory/model/suppliers.dart';
import 'package:ebox_frontend_web_inventory/views/compound_products/widgets/product_compound/selected_product_compound_card.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controller/controllers.dart';
import '../../../../model/products.dart';
import 'add_product_compound_card.dart';
import 'package:get/get.dart';

class SelectedProductCompoundList extends StatelessWidget {
  const SelectedProductCompoundList({super.key});

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
        child: ListView.separated(
          shrinkWrap: true,
          padding: REdgeInsets.all(15.r),
          physics: const BouncingScrollPhysics(),
          itemCount:
              compoundProductController.productsCompound.keys.toList().length,
          itemBuilder: (context, index) => SelectedProductCompoundCard(
            index: index,
            productCompound:
                compoundProductController.productsCompound.keys.toList()[index],
            quantity: compoundProductController.productsCompound.values
                .toList()[index],
          ),
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 15.w,
            );
          },
        ),
      ),
    );
  }
}
