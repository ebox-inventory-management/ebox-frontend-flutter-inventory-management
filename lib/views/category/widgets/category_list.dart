import 'package:ebox_frontend_web_inventory/model/categories.dart';
import 'package:ebox_frontend_web_inventory/model/supplier.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_card.dart';
import 'package:ebox_frontend_web_inventory/views/suppliers/widgets/supplier_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/controllers.dart';
import '../../../model/product.dart';
import '../../../model/suppliers.dart';
import 'category_card.dart';

class CategoryList extends StatelessWidget {
  final List<Categories> categories;
  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 0.8.sh,
      child: ListView.separated(
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
          return Divider();
        },
      ),
    );
  }
}