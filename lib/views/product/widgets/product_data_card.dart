import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDataCard extends StatelessWidget {
  final String name;
  final String data;
  const ProductDataCard({super.key, required this.name, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: REdgeInsets.only(top: 30.w, bottom: 15.w),
          child: Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
          ),
        ),
        Container(
          width: 250.w,
          height: 50.w,
          decoration: BoxDecoration(
              color: Colors.orangeAccent,
              borderRadius: BorderRadius.all(Radius.circular(10.r))),
          child: Center(
            child: Text(
              '${data}',
              style: TextStyle(fontSize: 16.sp, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
