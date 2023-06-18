import 'package:ebox_frontend_web_inventory/model/import.dart';
import 'package:ebox_frontend_web_inventory/model/suppliers.dart';
import 'package:ebox_frontend_web_inventory/views/import/widgets/import_product_card.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/controllers.dart';
import '../../../model/products.dart';

class ImportProductList extends StatelessWidget {
  final List<Import> imports;
  const ImportProductList({super.key, required this.imports});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: imports.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        productController.getProductsById(id: imports[index].product_id);
        return ImportProductCard(import: imports[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 15.w,
        );
      },
    );
  }
}
