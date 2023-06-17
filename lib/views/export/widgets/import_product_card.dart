import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/model/import.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_detail.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ImportProductCard extends StatelessWidget {
  final Import import;

  const ImportProductCard({super.key, required this.import});

  @override
  Widget build(BuildContext context) {
    TextEditingController quantityController = TextEditingController();

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
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aHVtYW58ZW58MHx8MHx8fDA%3D&w=1000&q=80'),
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: REdgeInsets.only(left: 15.r, top: 10.r, bottom: 10.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  productController.product.value?.product_name ?? 'Not Yet',
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'Total Price: \$${import.total_import_price}',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: REdgeInsets.all(15.r),
            child: Row(
              children: [
                Text(
                  'Quantity: ',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey),
                ),
                SizedBox(
                  width: 0.1.sw,
                  child: TextFormField(
                    controller: quantityController,
                    textInputAction: TextInputAction.next,
                    obscureText: false,
                    decoration: InputDecoration(
                      hintText: '${import.import_quantity}',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0.r),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
