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
