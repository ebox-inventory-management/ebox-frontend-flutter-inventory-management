import 'package:ebox_frontend_web_inventory/controller/controllers.dart';

import 'package:ebox_frontend_web_inventory/views/dashboard/dashboard_screen.dart';
import 'package:ebox_frontend_web_inventory/views/items/items_screen.dart';
import 'package:ebox_frontend_web_inventory/views/purchases/purchases_screen.dart';
import 'package:ebox_frontend_web_inventory/views/sales/sales_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

class NavigationBarScreen extends StatelessWidget {
  NavigationBarScreen({
    Key? key,
  }) : super(key: key);
  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.width < 600;
        return Scaffold(
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
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: Colors.black.withOpacity(0.1),
        textStyle: TextStyle(color: Colors.black.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: REdgeInsets.only(left: 30),
        selectedItemTextPadding: REdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.white),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [Colors.orange, Colors.white],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.white,
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
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
      footerDivider: Divider(),
      headerBuilder: (context, extended) {
        return Padding(
          padding: REdgeInsets.all(16.0),
          child: Column(
            children: [
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
            ],
          ),
        );
      },
      items: [
        const SidebarXItem(
          icon: Icons.dashboard,
          label: 'Dashboard',
        ),
        const SidebarXItem(
          icon: Icons.list,
          label: 'Items',
        ),
        const SidebarXItem(
          icon: Icons.handshake,
          label: 'Purchases',
        ),
        const SidebarXItem(
          icon: Icons.money,
          label: 'Sales',
        ),
        const SidebarXItem(
          icon: Icons.list_alt_sharp,
          label: 'Quantity adjustments',
        ),
        const SidebarXItem(
          icon: Icons.change_circle_outlined,
          label: 'Transfers',
        ),
        const SidebarXItem(
          icon: Icons.factory,
          label: 'Suppliers',
        ),
        const SidebarXItem(
          icon: Icons.groups,
          label: 'Customers',
        ),
        const SidebarXItem(
          icon: Icons.category,
          label: 'Categories',
        ),
        const SidebarXItem(
          icon: Icons.branding_watermark,
          label: 'Brands',
        ),
        const SidebarXItem(
          icon: Icons.warehouse,
          label: 'Warehouses',
        ),
        const SidebarXItem(
          icon: Icons.person,
          label: 'Users',
        ),
        const SidebarXItem(
          icon: Icons.notifications,
          label: 'Alerts',
        ),
        SidebarXItem(
          icon: Icons.exit_to_app,
          label: 'Exit',
          onTap: () {
            authController.signOut();
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
            return ItemsScreen();
          case 2:
            return PurchasesScreen();
          case 3:
            return SalesScreen();
          default:
            return ItemsScreen();
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
      return 'Item';
    case 2:
      return 'Purchases';
    case 3:
      return 'Sales';
    case 4:
      return 'Quantity adjustments';
    case 5:
      return 'Transfers';
    case 6:
      return 'Suppliers';
    case 7:
      return 'Customers';
    case 8:
      return 'Categories';
    case 9:
      return 'Brands';
    case 10:
      return 'Warehouses';
    case 11:
      return 'Users';
    case 12:
      return 'Alerts';
    case 13:
      return 'Exit';
    default:
      return 'Not found page';
  }
}
