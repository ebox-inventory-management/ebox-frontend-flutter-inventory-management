import 'package:ebox_frontend_web_inventory/controller/category_controller.dart';
import 'package:ebox_frontend_web_inventory/controller/product_controller.dart';
import 'package:ebox_frontend_web_inventory/controller/dashboard_controller.dart';
import 'package:ebox_frontend_web_inventory/controller/supplier_controller.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';
import 'import_controller.dart';

ProductController productController = Get.put(ProductController());
AuthController authController = Get.put(AuthController());
ImportController importController = Get.put(ImportController());
CategoryController categoryController = Get.put(CategoryController());
DashboardController dashboardController = Get.put(DashboardController());
SupplierController supplierController = Get.put(SupplierController());
