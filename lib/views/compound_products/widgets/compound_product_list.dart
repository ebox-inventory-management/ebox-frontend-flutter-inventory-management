import 'package:ebox_frontend_web_inventory/model/compound_products.dart';
import 'package:ebox_frontend_web_inventory/model/suppliers.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/controllers.dart';
import '../../../model/products.dart';
import 'compound_product_card.dart';

class CompoundProductList extends StatelessWidget {
  final List<CompoundProducts> compoundProductList;
  const CompoundProductList({super.key, required this.compoundProductList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: compoundProductList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CompoundProductCard(
          compoundProducts: compoundProductList[index],
          index: index,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 15.w,
        );
      },
    );
  }
}
