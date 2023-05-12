import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinanceCard extends StatelessWidget {
  final String name;
  final String amount;
  FinanceCard({super.key, required this.name, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(right: 15),
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Padding(
          padding: REdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style:
                    TextStyle(color: Colors.green, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                '\$ $amount',
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
