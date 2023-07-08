import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../model/compound_products.dart';
import '../../../../model/products.dart';
import 'product_compound_card.dart';

class ProductCompoundList extends StatelessWidget {
  final List<ProductsCompound> productsCompounds;
  const ProductCompoundList({super.key, required this.productsCompounds});

  @override
  Widget build(BuildContext context) {
    if (productsCompounds.isEmpty) {
      return Center(
        child: Column(
          children: [
            Image.asset(
              'assets/images/empty.png',
              scale: 4,
            ),
            Text(
              'Product has been deleted!',
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp),
            ),
          ],
        ),
      );
    } else {
      return Container(
        width: 0.4.sw,
        height: 0.6.sw,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.all(Radius.circular(15.r))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: productsCompounds.length,
              shrinkWrap: true,
              padding: REdgeInsets.all(15.r),
              itemBuilder: (context, index) {
                return ProductCompoundCard(
                  product: Products(
                      id: productsCompounds[index].id!,
                      product_name: productsCompounds[index].productName!,
                      product_url: productsCompounds[index].url!,
                      product_amount: productsCompounds[index].productAmount!,
                      product_code: productsCompounds[index].productCode!,
                      product_quantity:
                          productsCompounds[index].productQuantity!,
                      product_garage: productsCompounds[index].productGarage!,
                      product_route: productsCompounds[index].productRoute!,
                      product_image: productsCompounds[index].productImage!,
                      expire_date: productsCompounds[index].expireDate!,
                      import_price: productsCompounds[index].importPrice!,
                      export_price: productsCompounds[index].exportPrice!,
                      created_at: productsCompounds[index].createdAt!,
                      updated_at: productsCompounds[index].updatedAt!,
                      category_id: productsCompounds[index].categoryId!,
                      supplier_id: productsCompounds[index].supplierId!,
                      brand_id: productsCompounds[index].brandId!,
                      unit: productsCompounds[index].unit!,
                      description: productsCompounds[index].description!),
                  price: productsCompounds[index].exportPrice!,
                  quantity: productsCompounds[index].pivot!.productQuantity!,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 15.w,
                );
              },
            )
          ],
        ),
      );
    }
  }
}
