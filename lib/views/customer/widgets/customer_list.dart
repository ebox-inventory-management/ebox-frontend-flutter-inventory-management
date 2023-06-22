import 'package:ebox_frontend_web_inventory/model/customers.dart';
import 'package:ebox_frontend_web_inventory/model/suppliers.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_card.dart';
import 'package:ebox_frontend_web_inventory/views/suppliers/widgets/supplier_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../controller/controllers.dart';
import '../../../model/products.dart';
import 'customer_card.dart';

class CustomerList extends StatelessWidget {
  final List<Customers> customers;
  const CustomerList({super.key, required this.customers});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: customers.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CustomerCard(
          customers: customers[index],
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
