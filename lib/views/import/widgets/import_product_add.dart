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

class ImportProductAdd extends StatefulWidget {
  const ImportProductAdd({super.key});

  @override
  State<ImportProductAdd> createState() => _ImportProductAddState();
}

class _ImportProductAddState extends State<ImportProductAdd> {
  final List<String> importProductsName =
      productController.productList.map((data) => data.product_name).toList();

  String? selectedValueProductImport;

  Color backgroundColor = Colors.grey;
  Color foregroundColor = Colors.white;

  TextEditingController importQuantityController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    importQuantityController.dispose();
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
                    Text(
                      'Import Product',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.sp),
                    ),
                    Padding(
                      padding: REdgeInsets.only(top: 15.w, bottom: 15.r),
                      child: Divider(
                        color: Colors.black.withOpacity(0.1),
                        thickness: 5.w,
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
                          controller: importQuantityController,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          onChanged: (val) {
                            setState(() {
                              backgroundColor =
                                  val.isNotEmpty ? Colors.orange : Colors.grey;
                              foregroundColor =
                                  val.isNotEmpty ? Colors.white : Colors.white;
                            });
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0.r),
                            ),
                          ),
                        ),
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
                        dropdownItems: importProductsName,
                        value: selectedValueProductImport,
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
                            selectedValueProductImport = index;
                          });
                        },
                      ),
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          if (importQuantityController.text.isEmpty ||
                              selectedValueProductImport == null) {
                            Get.snackbar('Something wrong!',
                                'You need to input all information to import',
                                colorText: Colors.white,
                                margin: REdgeInsets.all(15),
                                backgroundColor: Colors.redAccent,
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 2));
                            return;
                          } else {
                            Get.snackbar('Imported Product!',
                                'You have been import product'.tr,
                                colorText: Colors.white,
                                margin: REdgeInsets.all(15),
                                backgroundColor: Colors.green,
                                snackPosition: SnackPosition.BOTTOM,
                                duration: const Duration(seconds: 2));
                            importController.create(
                                productId: 2,
                                product_quantity:
                                    int.parse(importQuantityController.text));
                            Get.back();
                          }
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: foregroundColor,
                            backgroundColor: backgroundColor,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.r)))),
                        child: Padding(
                          padding: REdgeInsets.only(
                              top: 15.r, bottom: 15.r, left: 30.r, right: 30.r),
                          child: Text(
                            'Add',
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
