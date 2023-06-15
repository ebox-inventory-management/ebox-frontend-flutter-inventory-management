import 'package:ebox_frontend_web_inventory/controller/income_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import '../../controller/controllers.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final List<ChartData> incomesData = [
    ChartData(DateTime(DateTime.now().year, DateTime.now().month - 4), 6),
    ChartData(DateTime(DateTime.now().year, DateTime.now().month - 3), 11),
    ChartData(DateTime(DateTime.now().year, DateTime.now().month - 2), 9),
    ChartData(DateTime(DateTime.now().year, DateTime.now().month - 1), 14),
    ChartData(DateTime(DateTime.now().year, DateTime.now().month), 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: REdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: REdgeInsets.only(bottom: 30.r),
                child: Row(
                  children: [
                    Icon(
                      Icons.dashboard,
                      size: 30.r,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Dashboard',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 30.sp),
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(
                height: 15.w,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.attach_money_sharp,
                        color: Colors.orange,
                        size: 30.r,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        'Total Incomes',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.orange,
                            fontSize: 20.sp),
                      ),
                    ],
                  ),
                  SizedBox(),
                ],
              ),
              SizedBox(
                height: 15.w,
              ),
              Row(
                children: [
                  Container(
                    width: 300.w,
                    height: 200.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.r)),
                        color: Colors.white),
                    child: Padding(
                      padding: REdgeInsets.all(20.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TODAY',
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.green),
                          ),
                          Center(
                            child: Text(
                              '\$${incomeController.incomeToday.value?.today_income}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 30.sp),
                            ),
                          ),
                          SizedBox()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Container(
                    width: 300.w,
                    height: 200.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.r)),
                        color: Colors.white),
                    child: Padding(
                      padding: REdgeInsets.all(20.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'THIS MONTH',
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.green),
                          ),
                          Center(
                            child: Text(
                              '\$${incomeController.incomesMonthList.length}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 30.sp),
                            ),
                          ),
                          SizedBox()
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.w,
                  ),
                  Container(
                    width: 300.w,
                    height: 200.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.r)),
                        color: Colors.white),
                    child: Padding(
                      padding: REdgeInsets.all(20.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'THIS YEAR',
                            style:
                                TextStyle(fontSize: 16.sp, color: Colors.green),
                          ),
                          Center(
                            child: Text(
                              '\$${incomeController.incomesYearList.length}',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 30.sp),
                            ),
                          ),
                          SizedBox()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              SizedBox(
                height: 15.h,
              ),
              Padding(
                padding: REdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.auto_graph,
                              color: Colors.orange,
                              size: 30.r,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Incomes Graph',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.orange,
                                  fontSize: 20.sp),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: REdgeInsets.only(left: 5),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.yellow[600],
                                    foregroundColor: Colors.white),
                                child: Text(
                                  'TODAY',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp),
                                ),
                              ),
                            ),
                            Padding(
                              padding: REdgeInsets.only(left: 5),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.yellow[600],
                                    foregroundColor: Colors.white),
                                child: Text(
                                  'THIS MONTH',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp),
                                ),
                              ),
                            ),
                            Padding(
                              padding: REdgeInsets.only(left: 5),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                    backgroundColor: Colors.yellow[600],
                                    foregroundColor: Colors.white),
                                child: Text(
                                  'THIS YEAR',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.sp),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.w,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.r))),
                      child: Padding(
                        padding: REdgeInsets.all(15.r),
                        child: SfCartesianChart(
                          primaryXAxis: DateTimeAxis(
                              rangePadding: ChartRangePadding.none),
                          legend: Legend(isVisible: true),
                          series: <ChartSeries<ChartData, DateTime>>[
                            LineSeries<ChartData, DateTime>(
                                dataSource: incomesData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                name: 'Income'),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Divider(),
              Padding(
                padding: REdgeInsets.only(bottom: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: REdgeInsets.all(15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Latest Import',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                          padding: REdgeInsets.all(15),
                          child: DataTable(
                              columnSpacing: 30.w,
                              dataTextStyle: TextStyle(
                                  fontSize: 16.sp, color: Colors.black54),
                              headingRowColor:
                                  const MaterialStatePropertyAll(Colors.orange),
                              headingTextStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              columns: const [
                                DataColumn(
                                  label: Text(
                                    'Created at',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Reference',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Customer',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Grand total',
                                  ),
                                ),
                              ],
                              rows: [
                                DataRow(
                                  cells: [
                                    DataCell(Text('2023-04-03 00:33:52')),
                                    DataCell(Text('REF-00579')),
                                    DataCell(Text('3')),
                                    DataCell(Text('\$ 0.0')),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(Text('2023-04-03 00:33:52')),
                                    DataCell(Text('REF-00579')),
                                    DataCell(Text('3')),
                                    DataCell(Text('\$ 0.00')),
                                  ],
                                )
                              ])),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: REdgeInsets.only(bottom: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: REdgeInsets.all(15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Latest Export',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                          padding: REdgeInsets.all(15),
                          child: DataTable(
                              columnSpacing: 30.w,
                              dataTextStyle: TextStyle(
                                  fontSize: 16.sp, color: Colors.black54),
                              headingRowColor:
                                  const MaterialStatePropertyAll(Colors.orange),
                              headingTextStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                              columns: const [
                                DataColumn(
                                  label: Text(
                                    'Created at',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Reference',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Supplier',
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Grand total',
                                  ),
                                ),
                              ],
                              rows: [
                                DataRow(
                                  cells: [
                                    DataCell(Text('2023-04-03 00:33:52')),
                                    DataCell(Text('REF-00579')),
                                    DataCell(Text('3')),
                                    DataCell(Text('\$ 0.00')),
                                  ],
                                ),
                                DataRow(
                                  cells: [
                                    DataCell(Text('2023-04-03 00:33:52')),
                                    DataCell(Text('REF-00579')),
                                    DataCell(Text('3')),
                                    DataCell(Text('\$ 0.00')),
                                  ],
                                )
                              ])),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final DateTime x;
  final double? y;
}
