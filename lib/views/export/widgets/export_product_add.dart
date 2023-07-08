import 'package:collection/collection.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/controllers.dart';

class ExportProductAdd extends StatefulWidget {
  const ExportProductAdd({super.key});

  @override
  State<ExportProductAdd> createState() => _ExportProductAddState();
}

class _ExportProductAddState extends State<ExportProductAdd> {
  final List<String> productsName =
      productController.productsList.map((data) => data.product_name).toList();

  String? selectedValueProduct;

  TextEditingController exportQuantityController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    exportQuantityController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 0.9.sw,
        height: 0.9.sh,
        child: Padding(
          padding: REdgeInsets.all(30.r),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15.w))),
            child: Padding(
              padding: REdgeInsets.all(30.r),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Export Product',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30.sp),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.cancel,
                              size: 40.r,
                              color: Colors.grey,
                            ))
                      ],
                    ),
                    Padding(
                      padding: REdgeInsets.only(top: 15.w, bottom: 15.r),
                      child: Divider(
                        color: Colors.black.withOpacity(0.1),
                        thickness: 5.w,
                      ),
                    ),
                    Text(
                      'Product',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                    ),
                    Padding(
                      padding: REdgeInsets.only(top: 15.r, bottom: 30.r),
                      child: CustomDropdownButton2(
                        buttonWidth: 0.2.sw,
                        buttonHeight: 40.w,
                        hint: 'Choose Product',
                        dropdownItems: productsName,
                        value: selectedValueProduct,
                        buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          color: Colors.grey[100],
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
                            selectedValueProduct = index;
                            productController.getProductsByName(
                                name: selectedValueProduct!);
                          });
                        },
                      ),
                    ),
                    Text(
                      'Product Quantity',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.sp),
                    ),
                    Padding(
                      padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                      child: SizedBox(
                        width: 0.4.sw,
                        child: TextFormField(
                          controller: exportQuantityController,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {});
                          },
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.allow(
                                RegExp(r'[0-9,-]')),
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0.r),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          if (exportQuantityController.text.isEmpty ||
                              selectedValueProduct == null) {
                            Get.snackbar('Something wrong!',
                                'You need to input all information to export',
                                colorText: Colors.white,
                                margin: REdgeInsets.all(15),
                                backgroundColor: Colors.redAccent,
                                snackPosition: SnackPosition.TOP,
                                duration: const Duration(seconds: 30));
                            return;
                          } else {
                            exportController.create(
                                productId: productController.product.value!.id,
                                product_quantity:
                                    int.parse(exportQuantityController.text));
                          }
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor:
                                exportQuantityController.text.isEmpty ||
                                        selectedValueProduct == null
                                    ? Colors.grey
                                    : Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.r)))),
                        child: Padding(
                          padding: REdgeInsets.only(
                              top: 15.r, bottom: 15.r, left: 30.r, right: 30.r),
                          child: Text(
                            'Export',
                            style: TextStyle(fontSize: 20.sp),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
