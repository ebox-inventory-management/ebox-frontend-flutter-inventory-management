import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  late final bool selected;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(15),
      child: Column(
        children: [
          Padding(
            padding: REdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 60.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15.r),
                              bottomLeft: Radius.circular(15.r))),
                      child: Center(
                        child: Text(
                          'TODAY',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      width: 100.w,
                      height: 40.w,
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      child: Center(
                        child: Text(
                          'LAST 7 DAYS',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      width: 100.w,
                      height: 40.w,
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      child: Center(
                        child: Text(
                          'THIS MONTH',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      width: 100.w,
                      height: 40.w,
                      decoration: BoxDecoration(color: Colors.blueAccent),
                      child: Center(
                        child: Text(
                          'THIS YEAR',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      width: 100.w,
                      height: 40.w,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15.r),
                              bottomRight: Radius.circular(15.r))),
                      child: Center(
                        child: Text(
                          'LAST YEAR',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
