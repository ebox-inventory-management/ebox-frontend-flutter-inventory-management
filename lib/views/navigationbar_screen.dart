import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ebox_frontend_web_inventory/controller/controllers.dart';
import 'package:ebox_frontend_web_inventory/model/users.dart';
import 'package:ebox_frontend_web_inventory/views/category/category_screen.dart';

import 'package:ebox_frontend_web_inventory/views/dashboard/dashboard_screen.dart';
import 'package:ebox_frontend_web_inventory/views/export/export_screen.dart';
import 'package:ebox_frontend_web_inventory/views/import/import_screen.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_add.dart';
import 'package:ebox_frontend_web_inventory/views/product/product_screen.dart';
import 'package:ebox_frontend_web_inventory/views/suppliers/supplier_screen.dart';
import 'package:ebox_frontend_web_inventory/views/user/user_edit.dart';
import 'package:ebox_frontend_web_inventory/views/user/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sidebarx/sidebarx.dart';

import 'brand/brand_screen.dart';
import 'compound_products/compound_product_screen.dart';
import 'customer/customer_screen.dart';

class NavigationBarScreen extends StatefulWidget {
  NavigationBarScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<NavigationBarScreen> createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  final _key = GlobalKey<ScaffoldState>();
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    incomeController.getIncomeToday();
    incomeController.getIncomeThisMonth();
    incomeController.getIncomeThisYear();
    expenseController.getExpenseToday();
    expenseController.getExpenseThisMonth();
    expenseController.getExpenseThisYear();
    revenueController.getRevenueToday();
    revenueController.getRevenueThisMonth();
    revenueController.getRevenueThisYear();
    dashboardController.getChartDataExport();
    dashboardController.getChartDataImport();
    compoundProductController.getCompoundProducts();
    supplierController.getSuppliers();
    customerController.getCustomers();
    categoryController.getCategories();
    brandController.getBrands();
    importController.getImports();
    exportController.getExports();
    authController.getUsers();
    productController.getProducts();
    dashboardController.getChartDataProductQuantity();
    incomeController.getRange(
        start: DateTime(now.year, now.month, now.day).toString(),
        end: DateTime(now.year, now.month, now.day + 1).toString());
    expenseController.getRange(
        start: DateTime(now.year, now.month, now.day).toString(),
        end: DateTime(now.year, now.month, now.day + 1).toString());
    revenueController.getRange(
        start: DateTime(now.year, now.month, now.day).toString(),
        end: DateTime(now.year, now.month, now.day + 1).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Obx(() {
          if (authController.user.value == null) {
            return Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/empty.png',
                    scale: 4,
                  ),
                  Text(
                    'You need to sign in first!',
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.sp),
                  ),
                  SizedBox(
                    height: 15.w,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/signin');
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white),
                    child: Padding(
                      padding: REdgeInsets.all(15.r),
                      child: Text(
                        'Click here to sign in',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30.sp),
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            final isSmallScreen = MediaQuery.of(context).size.width < 600;
            return Scaffold(
              backgroundColor: Colors.grey[100],
              key: _key,
              appBar: isSmallScreen
                  ? AppBar(
                      backgroundColor: Colors.white,
                      title: Text(_getTitleByIndex(_controller.selectedIndex)),
                      leading: IconButton(
                        onPressed: () {
                          // if (!Platform.isAndroid && !Platform.isIOS) {
                          //   _controller.setExtended(true);
                          // }
                          _key.currentState?.openDrawer();
                        },
                        icon: const Icon(Icons.menu),
                      ),
                    )
                  : null,
              drawer: CustomeSidebarX(controller: _controller),
              body: Row(
                children: [
                  if (!isSmallScreen) CustomeSidebarX(controller: _controller),
                  Expanded(
                    child: Center(
                      child: _ScreensExample(
                        controller: _controller,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        });
      },
    );
  }
}

class CustomeSidebarX extends StatelessWidget {
  CustomeSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;
  String profileImage = authController.user.value?.image ??
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';
  String name = authController.user.value?.name ?? 'Not Yet';
  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: REdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
        ),
        hoverColor: Colors.black.withOpacity(0.1),
        textStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: REdgeInsets.only(left: 30),
        selectedItemTextPadding: REdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: Colors.white),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: Colors.white.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [Colors.orange, Colors.white],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 30.r,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.grey,
          size: 20.r,
        ),
        selectedIconTheme: IconThemeData(
          color: Colors.white,
          size: 20.r,
        ),
      ),
      extendedTheme: SidebarXTheme(
        width: 200.w,
        textStyle: TextStyle(fontSize: 16.sp, overflow: TextOverflow.ellipsis),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
      ),
      footerDivider: Divider(),
      headerBuilder: (context, extended) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              if (authController.user.value!.role != 'admin') {
                return SizedBox();
              } else {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    IconButton(
                        onPressed: () {
                          Get.dialog(UserEdit(
                              users: Users(
                                  id: authController.user.value!.id,
                                  email: authController.user.value!.email,
                                  role: authController.user.value!.role,
                                  name: authController.user.value!.name,
                                  image: authController.user.value!.image,
                                  created_at:
                                      authController.user.value!.created_at,
                                  updated_at:
                                      authController.user.value!.updated_at)));
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ))
                  ],
                );
              }
            }),
            SizedBox(
              height: 15.h,
            ),
            CircleAvatar(
              radius: 60.r,
              foregroundImage: NetworkImage(profileImage),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'Role: ${authController.user.value?.role ?? 'Not Yet'}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
            ),
            Divider(),
          ],
        );
      },
      items: [
        const SidebarXItem(
          icon: Icons.dashboard,
          label: 'Dashboard',
        ),
        const SidebarXItem(
          icon: Icons.inventory,
          label: 'Product',
        ),
        const SidebarXItem(
          icon: Icons.download,
          label: 'Import',
        ),
        const SidebarXItem(
          icon: Icons.upload,
          label: 'Export',
        ),
        const SidebarXItem(
          icon: Icons.list_alt,
          label: 'Compound Products',
        ),
        const SidebarXItem(
          icon: Icons.factory,
          label: 'Supplier',
        ),
        const SidebarXItem(
          icon: Icons.groups,
          label: 'Customer',
        ),
        const SidebarXItem(
          icon: Icons.category,
          label: 'Category',
        ),
        const SidebarXItem(
          icon: Icons.branding_watermark,
          label: 'Brand',
        ),
        const SidebarXItem(
          icon: Icons.person,
          label: 'User',
        ),
        SidebarXItem(
          icon: Icons.exit_to_app,
          label: 'Exit',
          onTap: () {
            AwesomeDialog(
              context: context,
              width: 600.w,
              dialogType: DialogType.warning,
              animType: AnimType.bottomSlide,
              title: 'WARNING'.tr,
              desc: 'Are you sure you want to sign out your account?'.tr,
              btnCancelOnPress: () {},
              btnOkOnPress: () {
                Get.snackbar('Sign out successful!', ''.tr,
                    colorText: Colors.white,
                    margin: REdgeInsets.all(15),
                    backgroundColor: Colors.green,
                    snackPosition: SnackPosition.BOTTOM,
                    duration: const Duration(seconds: 2));

                authController.signOut();
              },
            ).show();
          },
        ),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return DashBoardScreen();
          case 1:
            return ProductScreen();
          case 2:
            return ImportScreen();
          case 3:
            return ExportScreen();
          case 4:
            return CompoundProductScreen();
          case 5:
            return SupplierScreen();
          case 6:
            return CustomerScreen();
          case 7:
            return CategoryScreen();
          case 8:
            return BrandScreen();
          case 9:
            return UserScreen();

          default:
            return Center(
              child: Image.asset(
                'assets/images/404.png',
                scale: 2,
              ),
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Dashboard';
    case 1:
      return 'Product';
    case 2:
      return 'Import';
    case 3:
      return 'Export';
    case 4:
      return 'Export';
    case 5:
      return 'Supplier';
    case 6:
      return 'Customer';
    case 7:
      return 'Category';
    case 8:
      return 'Brand';
    case 9:
      return 'User';

    case 10:
      return 'Exit';

    default:
      return 'Not found page';
  }
}
