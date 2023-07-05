import 'dart:convert';
import 'dart:html';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:ebox_frontend_web_inventory/api/product_service.dart';
import 'package:ebox_frontend_web_inventory/core/constants/base_url.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/views/compound_products/widgets/product_compound/product_compound_list.dart';
import 'package:ebox_frontend_web_inventory/views/compound_products/widgets/product_compound/selected_product_compound_card.dart';
import 'package:http/http.dart' as http;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../../../controller/controllers.dart';

class CompoundProductAdd extends StatefulWidget {
  const CompoundProductAdd({super.key});

  @override
  State<CompoundProductAdd> createState() => _CompoundProductAddState();
}

class _CompoundProductAddState extends State<CompoundProductAdd> {
  final List<String> productsName =
      productController.productsList.map((data) => data.product_name).toList();

  String? selectedValueProduct;

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
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
                        'Add Compound Product',
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
                            'Name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: nameController,
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
                            'Price',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: priceController,
                                keyboardType: TextInputType.number,
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
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Selected Product',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Obx(() {
                            if (compoundProductController
                                .productsCompound.isEmpty) {
                              return Padding(
                                padding:
                                    REdgeInsets.only(top: 15.r, bottom: 15.r),
                                child: Container(
                                  width: 0.4.sw,
                                  height: 0.6.sw,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.r))),
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/ebox-inventory-management.appspot.com/o/empty.png?alt=media&token=06b30b38-cac0-490e-ac6a-6373fe120a16',
                                          scale: 4,
                                        ),
                                        Text(
                                          'Empty Product!',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30.sp),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Padding(
                                padding:
                                    REdgeInsets.only(top: 15.r, bottom: 15.r),
                                child: Container(
                                  width: 0.4.sw,
                                  height: 0.6.sw,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15.r))),
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      padding: REdgeInsets.all(15.r),
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: compoundProductController
                                          .productsCompound.keys
                                          .toList()
                                          .length,
                                      itemBuilder: (context, index) =>
                                          SelectedProductCompoundCard(
                                            index: index,
                                            productCompound:
                                                compoundProductController
                                                    .productsCompound.keys
                                                    .toList()[index],
                                            quantity: compoundProductController
                                                .productsCompound.values
                                                .toList()[index],
                                          )),
                                ),
                              );
                            }
                          }),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Products List',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Obx(() {
                            if (productController.isProductsLoading.value) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              if (productController.productsList.isNotEmpty) {
                                return ProductCompoundList(
                                    products: productController.productsList);
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
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        if (descriptionController.text.isEmpty ||
                            nameController.text.isEmpty ||
                            descriptionController.text.isEmpty ||
                            priceController.text.isEmpty ||
                            priceController.text.isEmpty ||
                            selectedValueProduct == null) {
                          Get.snackbar('Something wrong!',
                              'You need to input all compound product information to add',
                              colorText: Colors.white,
                              margin: REdgeInsets.all(15.r),
                              backgroundColor: Colors.redAccent,
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 2));
                          return;
                        } else {
                          compoundProductController.createCompoundProduct(
                            description: descriptionController.text,
                            name: nameController.text,
                            price: int.parse(priceController.text),
                            productCompound: [],
                          );
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: descriptionController.text.isEmpty ||
                                  nameController.text.isEmpty ||
                                  descriptionController.text.isEmpty ||
                                  priceController.text.isEmpty ||
                                  priceController.text.isEmpty ||
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
