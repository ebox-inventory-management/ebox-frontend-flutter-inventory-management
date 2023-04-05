import 'package:ebox_frontend_web_inventory/views/authentication/sign_in_screen.dart';
import 'package:ebox_frontend_web_inventory/views/authentication/sign_up_screen.dart';
import 'package:ebox_frontend_web_inventory/views/navigationbar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';

import 'bindings/auth_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1440, 776),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            initialBinding: AuthBinding(),
            initialRoute: '/signin',
            getPages: [
              GetPage(name: '/signin', page: () => SignInScreen()),
              GetPage(name: '/navigation', page: () => NavigationBarScreen()),
              GetPage(name: '/signup', page: () => SignUpScreen())
            ],
            debugShowCheckedModeBanner: false,
            title: 'eBox Inventory Management',
            theme: ThemeData(
              primarySwatch: Colors.orange,
            ),
            builder: EasyLoading.init(),
          );
        });
  }
}
