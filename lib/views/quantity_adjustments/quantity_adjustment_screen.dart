import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/core/constants/base_url.dart';
import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_add.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_list.dart';
import 'package:ebox_frontend_web_inventory/views/quantity_adjustments/widgets/quantity_categories.dart';
import 'package:ebox_frontend_web_inventory/views/quantity_adjustments/widgets/quantity_categories_brands.dart';
import 'package:ebox_frontend_web_inventory/views/quantity_adjustments/widgets/quantity_categories_suppliers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';

class QuantityAdjustmentScreen extends StatefulWidget {
  const QuantityAdjustmentScreen({super.key});

  @override
  State<QuantityAdjustmentScreen> createState() =>
      _QuantityAdjustmentScreenState();
}

class _QuantityAdjustmentScreenState extends State<QuantityAdjustmentScreen> {
  int _selectedIndex = 0;

  List listScreen = [
    const QuantityCategories(),
    const QuantityCategoriesBrands(),
    const QuantityCategoriesSuppliers(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey[100],
      body: listScreen.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.black.withOpacity(0.4),
        selectedItemColor: Colors.orange,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category with Brand'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category with Supplier'),
        ],
      ),
    );
  }
}
