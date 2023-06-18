import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/controllers.dart';
import '../../product/widgets/product_list.dart';

class QuantityCategories extends StatefulWidget {
  const QuantityCategories({super.key});

  @override
  State<QuantityCategories> createState() => _QuantityCategoriesState();
}

class _QuantityCategoriesState extends State<QuantityCategories> {
  @override
  Widget build(BuildContext context) {
    final List<String> categoriesName =
        categoryController.categoriesList.map((data) => data.name).toList();

    String? selectedValueCategory;

    return Padding(
      padding: REdgeInsets.all(30.r),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Category',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
          ),
          Padding(
            padding: REdgeInsets.only(top: 15.w, bottom: 15.r),
            child: Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 5.w,
            ),
          ),
          Text(
            'Category',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
          ),
          Padding(
            padding: REdgeInsets.only(top: 15.r, bottom: 30.r),
            child: CustomDropdownButton2(
              buttonWidth: 0.2.sw,
              buttonHeight: 40.w,
              hint: 'Choose Category',
              dropdownItems: categoriesName,
              value: selectedValueCategory,
              buttonDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Colors.white,
              ),
              dropdownWidth: 0.2.sw,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.r),
                color: Colors.white,
              ),
              icon: Icon(
                Icons.arrow_drop_down,
                size: 40.r,
                color: Colors.orange,
              ),
              onChanged: (index) {
                setState(() {
                  selectedValueCategory = index;
                  productController.getProductsByName(
                      name: selectedValueCategory!);
                  quantityAdjustmentController.getProductsByCategory(
                      id: productController.product.value!.id);
                });
              },
            ),
          ),
          Obx(() {
            if (quantityAdjustmentController.productsByCategoryList.isEmpty) {
              if (productController.isProductsLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (productController.productList.isNotEmpty) {
                  return ProductList(products: productController.productList);
                } else {
                  return Center(
                    child: Column(
                      children: [
                        Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/ebox-inventory-management.appspot.com/o/empty.png?alt=media&token=06b30b38-cac0-490e-ac6a-6373fe120a16',
                          scale: 4,
                        ),
                        Text(
                          'Product Not Found!',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp),
                        ),
                      ],
                    ),
                  );
                }
              }
            } else {
              if (quantityAdjustmentController
                  .isProductsByCategoryLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (quantityAdjustmentController
                    .productsByCategoryList.isNotEmpty) {
                  return ProductList(
                      products:
                          quantityAdjustmentController.productsByCategoryList);
                } else {
                  return Center(
                    child: Column(
                      children: [
                        Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/ebox-inventory-management.appspot.com/o/empty.png?alt=media&token=06b30b38-cac0-490e-ac6a-6373fe120a16',
                          scale: 4,
                        ),
                        Text(
                          'Product Not Found!',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp),
                        ),
                      ],
                    ),
                  );
                }
              }
            }
          }),
        ]),
      ),
    );
  }
}
