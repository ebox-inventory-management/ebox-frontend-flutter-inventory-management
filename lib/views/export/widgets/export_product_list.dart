import 'package:ebox_frontend_web_inventory/model/export.dart';
import 'package:ebox_frontend_web_inventory/model/import.dart';
import 'package:ebox_frontend_web_inventory/model/suppliers.dart';
import 'package:ebox_frontend_web_inventory/views/import/widgets/import_product_card.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/controllers.dart';
import '../../../model/products.dart';
import 'export_product_card.dart';

class ExportProductList extends StatelessWidget {
  final List<Export> exports;
  const ExportProductList({super.key, required this.exports});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: exports.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return ExportProductCard(export: exports.reversed.toList()[index]);
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 15.w,
        );
      },
    );
  }
}
