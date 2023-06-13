import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuantityAdjustmentsScreen extends StatelessWidget {
  const QuantityAdjustmentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(
                text: 'Sales',
              ),
              Tab(
                text: 'Returns',
              ),
            ],
          ),
          title: const Text(
            'Sales',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
          ],
        ),
      ),
    );
  }
}
