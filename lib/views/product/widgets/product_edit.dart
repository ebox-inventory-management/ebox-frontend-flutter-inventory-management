import 'package:collection/collection.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/controllers.dart';
import '../../../model/products.dart';

class ProductEdit extends StatefulWidget {
  final Products product;

  const ProductEdit({super.key, required this.product});

  @override
  State<ProductEdit> createState() => _ProductEditState();
}

class _ProductEditState extends State<ProductEdit> {
  final List<String> categoriesName =
      categoryController.categoriesList.map((data) => data.name).toList();
  final List<String> brandsName =
      brandController.brandsList.map((data) => data.name).toList();
  final List<String> suppliersName =
      supplierController.suppliersList.map((data) => data.name).toList();

  String? selectedValueCategory;
  String? selectedValueBrand;
  String? selectedValueSupplier;

  DateTime? _selectedBuyDate;
  DateTime? _selectedExpireDate;

  Color backgroundColor = Colors.grey;
  Color foregroundColor = Colors.white;

  Future<void> _selectBuyDate(BuildContext context) async {
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
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedBuyDate) {
      setState(() {
        _selectedBuyDate = picked;
        debugPrint('$_selectedBuyDate');
      });
    }
  }

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
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedExpireDate) {
      setState(() {
        _selectedExpireDate = picked;
        debugPrint(_selectedExpireDate as String?);
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
  TextEditingController productCodeController = TextEditingController();
  TextEditingController productGarageController = TextEditingController();
  TextEditingController productRouteController = TextEditingController();
  TextEditingController buyDateController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();
  TextEditingController importPriceController = TextEditingController();
  TextEditingController exportPriceController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    productCodeController.dispose();
    productGarageController.dispose();
    productRouteController.dispose();
    buyDateController.dispose();
    expireDateController.dispose();
    importPriceController.dispose();
    exportPriceController.dispose();
    productQuantityController.dispose();
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
                        'Edit ${widget.product.product_name}',
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
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                            width: 500.w,
                            height: 500.w,
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
                                  print(selectedValueCategory);
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
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30.w,
                          ),
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
                                onChanged: (val) {
                                  setState(() {
                                    backgroundColor = val.isNotEmpty
                                        ? Colors.orange
                                        : Colors.grey;
                                    foregroundColor = val.isNotEmpty
                                        ? Colors.white
                                        : Colors.white;
                                  });
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
                            'Product Quantity',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: productQuantityController,
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
                            'Buy Date',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 15, top: 10),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () => _selectBuyDate(context),
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
                                SizedBox(
                                  width: 15.w,
                                ),
                                SizedBox(
                                  width: 270.w,
                                  child: TextFormField(
                                    controller: buyDateController,
                                    keyboardType: TextInputType.datetime,
                                    textInputAction: TextInputAction.done,
                                    obscureText: false,
                                    readOnly: true,
                                    onTap: () async {
                                      _selectBuyDate(context);
                                    },
                                    decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0.r),
                                      ),
                                      hintText: _selectedBuyDate == null
                                          ? DateFormat('dd / MMMM / yyyy')
                                              .format(DateTime.now())
                                          : DateFormat('dd / MMMM / yyyy')
                                              .format(_selectedBuyDate!),
                                      hintStyle: TextStyle(fontSize: 14.sp),
                                      labelStyle: TextStyle(fontSize: 14.sp),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                                GestureDetector(
                                  onTap: () => _selectBuyDate(context),
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
                                SizedBox(
                                  width: 15.w,
                                ),
                                SizedBox(
                                  width: 270.w,
                                  child: TextFormField(
                                    controller: expireDateController,
                                    keyboardType: TextInputType.datetime,
                                    textInputAction: TextInputAction.done,
                                    obscureText: false,
                                    readOnly: true,
                                    onTap: () async {
                                      _selectExpireDate(context);
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
                            productQuantityController.text.isEmpty) {
                          Get.snackbar('Something wrong!',
                              'You need to input all product information to import',
                              colorText: Colors.white,
                              margin: REdgeInsets.all(15),
                              backgroundColor: Colors.redAccent,
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 2));
                          return;
                        } else {
                          Get.snackbar(
                              'Added Product!', 'You have been add product'.tr,
                              colorText: Colors.white,
                              margin: REdgeInsets.all(15),
                              backgroundColor: Colors.green,
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 2));
                          productController.updateProduct(
                              category_id: 1,
                              supplier_id: 1,
                              brand_id: 1,
                              product_name: productNameController.text,
                              product_code: productCodeController.text,
                              product_garage: productGarageController.text,
                              product_route: productRouteController.text,
                              product_image:
                                  '${_imageFile?.name}${DateTime.now()}',
                              buy_date: _selectedBuyDate.toString(),
                              expire_date: _selectedExpireDate.toString(),
                              buying_price: importPriceController.text,
                              price: exportPriceController.text,
                              product_quantity: 1,
                              id: widget.product.id);
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
                          'Update',
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
