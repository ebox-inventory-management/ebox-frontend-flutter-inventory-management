import 'dart:convert';
import 'dart:html';

import 'package:collection/collection.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:ebox_frontend_web_inventory/api/product_service.dart';
import 'package:ebox_frontend_web_inventory/core/constants/base_url.dart';
import 'package:ebox_frontend_web_inventory/model/add_product_compound.dart';
import 'package:ebox_frontend_web_inventory/model/compound_products.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/views/compound_products/widgets/product_compound/add_product_compound_list.dart';
import 'package:ebox_frontend_web_inventory/views/compound_products/widgets/product_compound/product_compound_list.dart';
import 'package:ebox_frontend_web_inventory/views/compound_products/widgets/product_compound/selected_product_compound_card.dart';
import 'package:ebox_frontend_web_inventory/views/compound_products/widgets/product_compound/selected_product_compound_list.dart';
import 'package:http/http.dart' as http;

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../../../controller/controllers.dart';

class CompoundProductEdit extends StatefulWidget {
  final Compounds compounds;
  const CompoundProductEdit({super.key, required this.compounds});

  @override
  State<CompoundProductEdit> createState() => _CompoundProductEditState();
}

class _CompoundProductEditState extends State<CompoundProductEdit> {
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
  void initState() {
    super.initState();
    nameController.text = widget.compounds.name!;
    descriptionController.text = widget.compounds.description!;
    priceController.text = widget.compounds.price.toString();
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
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: REdgeInsets.all(30.r),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Edit Compound Product',
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp),
                                ),
                                Padding(
                                  padding:
                                      REdgeInsets.only(bottom: 30.r, top: 10.r),
                                  child: SizedBox(
                                    width: 0.4.sw,
                                    child: TextFormField(
                                      controller: nameController,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0.r),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  'Price',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp),
                                ),
                                Padding(
                                  padding:
                                      REdgeInsets.only(bottom: 30.r, top: 10.r),
                                  child: SizedBox(
                                    width: 0.4.sw,
                                    child: TextFormField(
                                      controller: priceController,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0.r),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Description',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp),
                                ),
                                Padding(
                                  padding:
                                      REdgeInsets.only(bottom: 30.r, top: 10.r),
                                  child: SizedBox(
                                    width: 0.4.sw,
                                    child: TextFormField(
                                      controller: descriptionController,
                                      textInputAction: TextInputAction.next,
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0.r),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    SizedBox(
                      height: 15.w,
                    ),
                    ProductCompoundList(
                      productsCompounds: widget.compounds.products!,
                    ),
                    SizedBox(
                      height: 15.w,
                    ),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          if (nameController.text.isEmpty ||
                              priceController.text.isEmpty ||
                              descriptionController.text.isEmpty) {
                            print(compoundProductController
                                .productWithQuantityJson);
                            Get.snackbar('Something wrong!',
                                'You need to input all compound product information to update',
                                colorText: Colors.white,
                                margin: REdgeInsets.all(15.r),
                                backgroundColor: Colors.redAccent,
                                snackPosition: SnackPosition.TOP,
                                duration: const Duration(seconds: 30));
                            return;
                          } else {
                            compoundProductController.updateCompoundProduct(
                              description: descriptionController.text,
                              name: nameController.text,
                              price: priceController.text,
                              id: widget.compounds.id!,
                            );
                          }
                        },
                        style: TextButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: nameController.text.isEmpty ||
                                    priceController.text.isEmpty ||
                                    descriptionController.text.isEmpty
                                ? Colors.grey
                                : Colors.green,
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
      ),
    );
  }
}
