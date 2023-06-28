import 'package:collection/collection.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:ebox_frontend_web_inventory/model/suppliers.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../controller/controllers.dart';

class SupplierEdit extends StatefulWidget {
  final Suppliers suppliers;
  const SupplierEdit({super.key, required this.suppliers});

  @override
  State<SupplierEdit> createState() => _SupplierEditState();
}

class _SupplierEditState extends State<SupplierEdit> {
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

  TextEditingController addressController = TextEditingController();
  TextEditingController bankNameController = TextEditingController();
  TextEditingController bankNumberController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController shopNameController = TextEditingController();
  TextEditingController typeController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    addressController.dispose();
    bankNameController.dispose();
    bankNumberController.dispose();
    cityController.dispose();
    emailController.dispose();
    nameController.dispose();
    phoneController.dispose();
    shopNameController.dispose();
    typeController.dispose();
  }

  @override
  void initState() {
    super.initState();
    addressController.text = widget.suppliers.address;
    bankNameController.text = widget.suppliers.bank_name;
    bankNumberController.text = widget.suppliers.bank_number;
    cityController.text = widget.suppliers.city;
    emailController.text = widget.suppliers.email;
    nameController.text = widget.suppliers.name;
    phoneController.text = widget.suppliers.phone;
    shopNameController.text = widget.suppliers.shop_name;
    typeController.text = widget.suppliers.type;
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
                    children: [
                      Text(
                        'Edit Supplier',
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Supplier Name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: nameController,
                                // onChanged: (val) {
                                //   setState(() {
                                //     backgroundColor = val.isNotEmpty
                                //         ? Colors.orange
                                //         : Colors.grey;
                                //     foregroundColor = val.isNotEmpty
                                //         ? Colors.white
                                //         : Colors.white;
                                //   });
                                // },
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: widget.suppliers.name,
                                  hintStyle: TextStyle(fontSize: 16.sp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Email',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: emailController,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: widget.suppliers.email,
                                  hintStyle: TextStyle(fontSize: 16.sp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Phone',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: phoneController,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9,-]')),
                                ],
                                decoration: InputDecoration(
                                  hintText: widget.suppliers.phone,
                                  hintStyle: TextStyle(fontSize: 16.sp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Address',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: addressController,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: widget.suppliers.address,
                                  hintStyle: TextStyle(fontSize: 16.sp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'City',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: cityController,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: widget.suppliers.city,
                                  hintStyle: TextStyle(fontSize: 16.sp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Type',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: typeController,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: widget.suppliers.type,
                                  hintStyle: TextStyle(fontSize: 16.sp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Shop Name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: shopNameController,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: widget.suppliers.shop_name,
                                  hintStyle: TextStyle(fontSize: 16.sp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Bank Name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: bankNameController,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: widget.suppliers.bank_name,
                                  hintStyle: TextStyle(fontSize: 16.sp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            'Bank Number',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14.sp),
                          ),
                          Padding(
                            padding: REdgeInsets.only(bottom: 30.r, top: 10.r),
                            child: SizedBox(
                              width: 0.4.sw,
                              child: TextFormField(
                                controller: bankNumberController,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  hintText: widget.suppliers.bank_number,
                                  hintStyle: TextStyle(fontSize: 16.sp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0.r),
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
                          Padding(
                            padding: REdgeInsets.only(bottom: 15.r),
                            child: Text(
                              'Supplier Image',
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
                                    widget.suppliers.photo,
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
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        if (bankNameController.text.isEmpty ||
                            addressController.text.isEmpty ||
                            phoneController.text.isEmpty ||
                            bankNumberController.text.isEmpty ||
                            nameController.text.isEmpty ||
                            cityController.text.isEmpty ||
                            shopNameController.text.isEmpty ||
                            _imageFile == null ||
                            typeController.text.isEmpty) {
                          Get.snackbar('Something wrong!',
                              'You need to input all supplier information to update',
                              colorText: Colors.white,
                              margin: REdgeInsets.all(15),
                              backgroundColor: Colors.redAccent,
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(seconds: 2));
                          return;
                        } else {
                          supplierController.updateSupplier(
                              address: addressController.text,
                              bank_name: bankNameController.text,
                              bank_number: bankNameController.text,
                              city: cityController.text,
                              email: emailController.text,
                              name: nameController.text,
                              phone: phoneController.text,
                              photo: _imageFile!,
                              shop_name: shopNameController.text,
                              type: typeController.text,
                              id: widget.suppliers.id);
                        }
                      },
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: bankNameController.text.isEmpty ||
                                  addressController.text.isEmpty ||
                                  phoneController.text.isEmpty ||
                                  bankNumberController.text.isEmpty ||
                                  nameController.text.isEmpty ||
                                  cityController.text.isEmpty ||
                                  shopNameController.text.isEmpty ||
                                  _imageFile == null ||
                                  typeController.text.isEmpty
                              ? Colors.grey
                              : Colors.orange,
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
