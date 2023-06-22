import 'package:ebox_frontend_web_inventory/model/brands.dart';
import 'package:ebox_frontend_web_inventory/model/categories.dart';
import 'package:ebox_frontend_web_inventory/model/customers.dart';
import 'package:ebox_frontend_web_inventory/model/suppliers.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_card.dart';
import 'package:ebox_frontend_web_inventory/views/suppliers/widgets/supplier_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/controllers.dart';
import '../../../model/products.dart';
import 'brand_card.dart';

class BrandList extends StatelessWidget {
  final List<Brands> brands;
  const BrandList({super.key, required this.brands});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: brands.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return BrandCard(
          brands: brands[index],
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
