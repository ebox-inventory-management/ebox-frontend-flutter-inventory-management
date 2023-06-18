import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/controllers.dart';
import '../../product/widgets/product_list.dart';

class QuantityCategoriesBrands extends StatefulWidget {
  const QuantityCategoriesBrands({super.key});

  @override
  State<QuantityCategoriesBrands> createState() =>
      _QuantityCategoriesBrandsState();
}

class _QuantityCategoriesBrandsState extends State<QuantityCategoriesBrands> {
  @override
  Widget build(BuildContext context) {
    final List<String> categoriesName =
        categoryController.categoriesList.map((data) => data.name).toList();
    final List<String> brandsName =
        brandController.brandsList.map((data) => data.name).toList();

    String? selectedValueCategory;
    String? selectedValueBrand;

    return Padding(
      padding: REdgeInsets.all(30.r),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Category with Brand',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
          ),
          Padding(
            padding: REdgeInsets.only(top: 15.w, bottom: 15.r),
            child: Divider(
              color: Colors.black.withOpacity(0.1),
              thickness: 5.w,
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Category',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
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
                          print(selectedValueCategory);
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 30.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Brand',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp),
                  ),
                  Padding(
                    padding: REdgeInsets.only(top: 15.r, bottom: 30.r),
                    child: CustomDropdownButton2(
                      buttonWidth: 0.2.sw,
                      buttonHeight: 40.w,
                      hint: 'Choose Brand',
                      dropdownItems: brandsName,
                      value: selectedValueBrand,
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
                          selectedValueBrand = index;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
          Obx(() {
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
          }),
        ]),
      ),
    );
  }
}
