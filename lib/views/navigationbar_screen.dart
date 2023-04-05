import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:ebox_frontend_web_inventory/views/dashboard/dashboard_screen.dart';
import 'package:ebox_frontend_web_inventory/views/items/items_screen.dart';
import 'package:ebox_frontend_web_inventory/views/purchases/purchases_screen.dart';
import 'package:ebox_frontend_web_inventory/views/sales/sales_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/auth_controller.dart';
import 'package:get/get.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<NavigationBarScreen> {
  PageController page = PageController();
  SideMenuController sideMenu = SideMenuController();
  @override
  void initState() {
    sideMenu.addListener((p0) {
      page.jumpToPage(p0);
    });
    super.initState();
  }

  final authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
            padding: REdgeInsets.all(10),
            child: Center(
              child: Text(
                'eBox',
                style: TextStyle(
                    color: Colors.orangeAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp),
              ),
            )),
        actions: [
          Padding(
            padding: REdgeInsets.all(10),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.notifications,
                  color: Colors.grey,
                )),
          ),
          Padding(
            padding: REdgeInsets.all(10),
            child: OutlinedButton(
              onPressed: () {},
              child: Text('Admin'),
            ),
          ),
          Padding(
            padding: REdgeInsets.all(10),
            child: TextButton(
                onPressed: () {},
                child: Text('en'),
                style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.white),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.orangeAccent))),
          )
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            controller: sideMenu,
            style: SideMenuStyle(
                showTooltip: false,
                displayMode: SideMenuDisplayMode.auto,
                hoverColor: Colors.orangeAccent[100],
                selectedColor: Colors.orangeAccent,
                selectedTitleTextStyle: const TextStyle(color: Colors.white),
                selectedIconColor: Colors.white,
                backgroundColor: Colors.white),
            footer: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Version 1.0.0',
                style: TextStyle(fontSize: 15),
              ),
            ),
            items: [
              SideMenuItem(
                priority: 0,
                title: 'Dashboard',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.dashboard),
              ),
              SideMenuItem(
                priority: 1,
                title: 'Items',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.list),
              ),
              SideMenuItem(
                priority: 2,
                title: 'Purchases',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.handshake),
              ),
              SideMenuItem(
                priority: 3,
                title: 'Sales',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.money),
              ),
              SideMenuItem(
                priority: 4,
                title: 'Quantity adjustments',
                onTap: (page, _) {
                  sideMenu.changePage(page);
                },
                icon: const Icon(Icons.list_alt_sharp),
              ),
              SideMenuItem(
                priority: 5,
                title: 'Transfers',
                onTap: (page, _) {
                  sideMenu.changePage(5);
                },
                icon: const Icon(Icons.change_circle_outlined),
              ),
              SideMenuItem(
                priority: 6,
                title: 'Suppliers',
                onTap: (page, _) {
                  sideMenu.changePage(6);
                },
                icon: const Icon(Icons.factory),
              ),
              SideMenuItem(
                priority: 7,
                title: 'Customers',
                onTap: (page, _) {
                  sideMenu.changePage(7);
                },
                icon: const Icon(Icons.groups),
              ),
              SideMenuItem(
                priority: 8,
                title: 'Categories',
                onTap: (page, _) {
                  sideMenu.changePage(8);
                },
                icon: const Icon(Icons.category),
              ),
              SideMenuItem(
                priority: 9,
                title: 'Brands',
                onTap: (page, _) {
                  sideMenu.changePage(9);
                },
                icon: const Icon(Icons.branding_watermark),
              ),
              SideMenuItem(
                priority: 10,
                title: 'Warehouses',
                onTap: (page, _) {
                  sideMenu.changePage(10);
                },
                icon: const Icon(Icons.warehouse),
              ),
              SideMenuItem(
                priority: 11,
                title: 'Users',
                onTap: (page, _) {
                  sideMenu.changePage(11);
                },
                icon: const Icon(Icons.person),
              ),
              SideMenuItem(
                priority: 12,
                title: 'Alerts',
                onTap: (page, _) {
                  sideMenu.changePage(12);
                },
                icon: const Icon(Icons.notifications),
              ),
              SideMenuItem(
                priority: 13,
                onTap: (page, _) {},
                title: 'Exit',
                icon: Icon(Icons.exit_to_app),
              ),
            ],
          ),
          Expanded(
            child: PageView(
              controller: page,
              children: [
                DashBoardScreen(),
                ItemsScreen(),
                PurchasesScreen(),
                SalesScreen(),
                ItemsScreen(),
                ItemsScreen(),
                ItemsScreen(),
                ItemsScreen(),
                ItemsScreen(),
                ItemsScreen(),
                ItemsScreen(),
                ItemsScreen(),
                ItemsScreen(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
