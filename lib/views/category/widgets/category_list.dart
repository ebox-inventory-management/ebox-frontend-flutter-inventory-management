import 'package:ebox_frontend_web_inventory/model/categories.dart';
import 'package:ebox_frontend_web_inventory/model/customers.dart';
import 'package:ebox_frontend_web_inventory/model/suppliers.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_card.dart';
import 'package:ebox_frontend_web_inventory/views/suppliers/widgets/supplier_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/controllers.dart';
import '../../../model/products.dart';
import 'category_card.dart';

class CategoryList extends StatelessWidget {
  final List<Categories> categories;
  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: categories.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CategoryCard(
          categories: categories[index],
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
