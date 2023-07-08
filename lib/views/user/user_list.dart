import 'package:ebox_frontend_web_inventory/model/customers.dart';
import 'package:ebox_frontend_web_inventory/model/suppliers.dart';
import 'package:ebox_frontend_web_inventory/model/users.dart';
import 'package:ebox_frontend_web_inventory/views/product/widgets/product_card.dart';
import 'package:ebox_frontend_web_inventory/views/suppliers/widgets/supplier_card.dart';
import 'package:ebox_frontend_web_inventory/views/user/user_add.dart';
import 'package:ebox_frontend_web_inventory/views/user/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../controller/controllers.dart';
import '../../../model/products.dart';

class UserList extends StatelessWidget {
  final List<Users> users;
  const UserList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.person,
              size: 30.r,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              'User',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
            ),
          ],
        ),
        Padding(
          padding: REdgeInsets.only(top: 15.w, bottom: 15.r),
          child: Divider(
            color: Colors.black.withOpacity(0.1),
            thickness: 5.w,
          ),
        ),
        Material(
          borderRadius: BorderRadius.circular(15),
          child: Obx(
            () => TextField(
              controller: authController.searchUsersController,
              onSubmitted: (value) {
                authController.getUsersByKeyword(keyword: value);
              },
              onChanged: (value) {
                if (value.isEmpty) {
                  authController.getUsers();
                } else {
                  authController.searchVal.value = value;
                }
              },
              cursorColor: Colors.orange,
              decoration: InputDecoration(
                prefixIconColor: Colors.grey,
                prefixIcon: Icon(
                  Icons.search,
                  size: 20.r,
                ),
                suffixIconColor: Colors.grey,
                suffixIcon: authController.searchVal.value.isNotEmpty
                    ? IconButton(
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());

                          authController.searchUsersController.clear();
                          authController.searchVal.value = '';
                          authController.getUsers();
                        },
                        icon: Icon(
                          Icons.clear,
                          size: 20.r,
                        ))
                    : null,
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search user'.tr,
                hintStyle: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                    fontWeight: FontWeight.w300),
                contentPadding: REdgeInsets.only(top: 30),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(30.r)),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(30.r)),
              ),
            ),
          ),
        ),
        Padding(
          padding: REdgeInsets.only(top: 30.w, bottom: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              TextButton(
                  onPressed: () {
                    Get.dialog(const UserAdd());
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  ),
                  child: Padding(
                    padding: REdgeInsets.all(15.r),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          size: 30.r,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'Add User',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
        ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: users.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return UserCard(
              users: users.reversed.toList()[index],
              index: index,
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              height: 15.w,
            );
          },
        ),
      ],
    );
  }
}
