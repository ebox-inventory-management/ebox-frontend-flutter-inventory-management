import 'dart:convert';
import 'dart:html';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:ebox_frontend_web_inventory/api/product_service.dart';
import 'package:ebox_frontend_web_inventory/core/constants/base_url.dart';
import 'package:http/http.dart' as http;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../../../controller/controllers.dart';

class ProductAdd extends StatefulWidget {
  const ProductAdd({super.key});

  @override
  State<ProductAdd> createState() => _ProductAddState();
}

class _ProductAddState extends State<ProductAdd> {
  final List<String> categoriesName =
      categoryController.categoriesList.map((data) => data.name).toList();
  final List<String> brandsName =
      brandController.brandsList.map((data) => data.name).toList();
  final List<String> suppliersName =
      supplierController.suppliersList.map((data) => data.name).toList();

  String? selectedValueCategory;
  String? selectedValueBrand;
  String? selectedValueSupplier;

  DateTime? _selectedExpireDate;

  Future<void> _selectExpireDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.orange,
              onSurface: Colors.orange,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.orange,
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedExpireDate) {
      setState(() {
        _selectedExpireDate = picked;
      });
    }
  }

  // Variable to hold the selected image file
  PlatformFile? _imageFile;
  // Method to pick and display an image file
  Future<void> _pickImage() async {
    try {
      // Pick an image file using file_picker package
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
      );

      // If user cancels the picker, do nothing
      if (result == null) return;

      // If user picks an image, update the state with the new image file
      setState(() {
        _imageFile = result.files.first;
      });
      // final base64Image = base64Encode(_imageFile!.bytes!);
      // print('image: $base64Image');
      // final base64DecondeImage = base64Decode(base64Image);
      // print(base64DecondeImage);
    } catch (e) {
      // If there is an error, show a snackbar with the error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

  TextEditingController productNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  TextEditingController productCodeController = TextEditingController();
  TextEditingController productGarageController = TextEditingController();
  TextEditingController productRouteController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();
  TextEditingController importPriceController = TextEditingController();
  TextEditingController exportPriceController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    productCodeController.dispose();
    productGarageController.dispose();
    productRouteController.dispose();
    expireDateController.dispose();
    importPriceController.dispose();
    exportPriceController.dispose();
    descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 0.9.sw,
        height: 0.9.sh,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15.w))),
          child: SingleChildScrollView(
            child: Padding(
              padding: REdgeInsets.all(30.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add Product',
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Product Name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: productNameController,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Description',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: descriptionController,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Import Price',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: importPriceController,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Export Price',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: exportPriceController,
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Product Code',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: productCodeController,
                                textInputAction: TextInputAction.next,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                obscureText: false,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Product Garage',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: productGarageController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Product Route',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: productRouteController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Category',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
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
                                  selectedValueCategory = index;
                                  categoryController.getCategoryByName(
                                      name: selectedValueCategory!);
                                });
                              },
                            ),
                          ),
                          Text(
                            'Brand',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
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
                                  selectedValueBrand = index;
                                  brandController.getBrandByName(
                                      name: selectedValueBrand!);
                                });
                              },
                            ),
                          ),
                          Text(
                            'Supplier',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(top: 15.r, bottom: 30.r),
                            child: CustomDropdownButton2(
                              buttonWidth: 0.2.sw,
                              buttonHeight: 40.w,
                              hint: 'Choose Supplier',
                              dropdownItems: suppliersName,
                              value: selectedValueSupplier,
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
                                  selectedValueSupplier = index;
                                  supplierController.getSupplierByName(
                                      name: selectedValueSupplier!);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: REdgeInsets.only(bottom: 15.r),
                            child: Text(
                              'Product Image',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.sp),
                            ),
                          ),
                          // If image file is not null, display it using Image widget
                          Container(
                            width: 0.4.sw,
                            height: 0.4.sw,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                15.r,
                              ),
                            ),
                            child: _imageFile == null
                                ? Image.network(
                                    'https://shop.mevid.hu/wp-content/uploads/2019/11/image.jpg',
                                    fit: BoxFit.cover,
                                  )
                                : Image.memory(
                                    Uint8List.fromList(_imageFile!.bytes!),
                                    fit: BoxFit.cover,
                                  ),
                          ),

                          SizedBox(
                            height: 30.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              _pickImage();
                            },
                            child: Container(
                              width: 200.w,
                              height: 60.w,
                              decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.r))),
                              child: Center(
                                child: Text(
                                  'Choose image',
                                  style: TextStyle(
                                      fontSize: 16.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.w,
                          ),
                          Text(
                            'Expire Date',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 15, top: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 200.w,
                                  child: TextFormField(
                                    controller: expireDateController,
                                    keyboardType: TextInputType.datetime,
                                    textInputAction: TextInputAction.done,
                                    obscureText: false,
                                    readOnly: true,
                                    onTap: () async {
                                      _selectExpireDate(context);
                                    },
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0.r),
                                      ),
                                      hintText: _selectedExpireDate == null
                                          ? DateFormat('dd / MMMM / yyyy')
                                              .format(DateTime.now())
                                          : DateFormat('dd / MMMM / yyyy')
                                              .format(_selectedExpireDate!),
                                      hintStyle: TextStyle(fontSize: 14.sp),
                                      labelStyle: TextStyle(fontSize: 14.sp),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                GestureDetector(
                                  onTap: () => _selectExpireDate(context),
                                  child: Center(
                                    child: CircleAvatar(
                                        radius: 30.r,
                                        backgroundColor: Colors.orange,
                                        foregroundColor: Colors.white,
                                        child: Icon(
                                          Icons.edit,
                                          size: 25.r,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        if (productCodeController.text.isEmpty ||
                            productNameController.text.isEmpty ||
                            exportPriceController.text.isEmpty ||
                            importPriceController.text.isEmpty ||
                            productCodeController.text.isEmpty ||
                            productGarageController.text.isEmpty ||
                            productGarageController.text.isEmpty ||
                            _imageFile == null ||
                            _selectedExpireDate == null ||
                            selectedValueCategory == null ||
                            selectedValueSupplier == null ||
                            selectedValueBrand == null) {
                          Get.snackbar('Something wrong!',
                              'You need to input all product information to add',
                              colorText: Colors.white,
                              margin: REdgeInsets.all(15.r),
                              backgroundColor: Colors.redAccent,
                              snackPosition: SnackPosition.TOP,
                              duration: const Duration(seconds: 30));
                          return;
                        } else {
                          productController.createProduct(
                            category_id: categoryController.category.value!.id,
                            supplier_id: supplierController.supplier.value!.id,
                            brand_id: brandController.brand.value!.id,
                            product_name: productNameController.text,
                            product_code: productCodeController.text,
                            product_garage: productGarageController.text,
                            product_route: productRouteController.text,
                            product_image: _imageFile!,
                            expire_date: _selectedExpireDate.toString(),
                            import_price: int.parse(importPriceController.text),
                            export_price: int.parse(exportPriceController.text),
                            description: descriptionController.text,
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: productCodeController.text.isEmpty ||
                                  productNameController.text.isEmpty ||
                                  exportPriceController.text.isEmpty ||
                                  importPriceController.text.isEmpty ||
                                  productCodeController.text.isEmpty ||
                                  productGarageController.text.isEmpty ||
                                  productGarageController.text.isEmpty ||
                                  selectedValueCategory == null ||
                                  selectedValueSupplier == null ||
                                  selectedValueBrand == null
                              ? Colors.grey
                              : Colors.green,
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
    );
  }
}
