import 'package:ebox_frontend_web_inventory/model/suppliers.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../controller/controllers.dart';
import '../../../../model/products.dart';
import 'add_product_compound_card.dart';

class ProductCompoundList extends StatelessWidget {
  final List<Products> products;
  const ProductCompoundList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 15.r, bottom: 15.r),
      child: Container(
        width: 0.4.sw,
        height: 0.8.sw,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.all(Radius.circular(15.r))),
        child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: products.length,
          padding: REdgeInsets.all(15.r),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return AddProductCompoundCard(
              product: products.reversed.toList()[index],
              index: index,
            );
          },
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
