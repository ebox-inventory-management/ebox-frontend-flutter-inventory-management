import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/controllers.dart';
import '../import/widgets/import_product_list.dart';
import '../product/widgets/product_add.dart';

class ExportScreen extends StatelessWidget {
  const ExportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: REdgeInsets.all(30.r),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              'Import',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
            ),
            Padding(
              padding: REdgeInsets.only(top: 15.w, bottom: 15.r),
              child: Divider(
                color: Colors.black.withOpacity(0.1),
                thickness: 5.w,
              ),
            ),
            Material(
              borderRadius: BorderRadius.circular(15),
              child: Obx(
                () => TextField(
                  controller: productController.searchProductsController,
                  onSubmitted: (value) {
                    // productController.getVendorByName(keyword: value);
                  },
                  onChanged: (value) {
                    productController.searchVal.value = value;
                  },
                  cursorColor: Colors.orange,
                  decoration: InputDecoration(
                    prefixIconColor: Colors.grey,
                    prefixIcon: Icon(
                      Icons.search,
                      size: 20.r,
                    ),
                    suffixIconColor: Colors.grey,
                    suffixIcon: productController.searchVal.value.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              FocusScope.of(context).requestFocus(FocusNode());

                              productController.searchProductsController
                                  .clear();
                              productController.searchVal.value = '';
                              productController.getProducts();
                            },
                            icon: Icon(
                              Icons.clear,
                              size: 20.r,
                            ))
                        : null,
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Search products'.tr,
                    hintStyle: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                        fontWeight: FontWeight.w300),
                    contentPadding: REdgeInsets.only(top: 30),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30.r)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(30.r)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Obx(() {
              if (importController.isImportLoading.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (productController.productList.isNotEmpty) {
                  return ImportProductList(
                      imports: importController.importList);
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(const ProductAdd());
        },
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          size: 30.w,
        ),
      ),
    );
  }
}
