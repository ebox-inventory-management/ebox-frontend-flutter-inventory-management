import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final List<ChartData> incomesData = [
    ChartData(DateTime(2015, 1), 6),
    ChartData(DateTime(2015, 2), 11),
    ChartData(DateTime(2015, 3), 9),
    ChartData(DateTime(2015, 4), 14),
    ChartData(DateTime(2015, 5), 10),
  ];

  final List<ChartData> expensesData = [
    ChartData(DateTime(2015, 1), 4),
    ChartData(DateTime(2015, 2), 5),
    ChartData(DateTime(2015, 3), 10),
    ChartData(DateTime(2015, 4), 11),
    ChartData(DateTime(2015, 5), 5),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: REdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: REdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: REdgeInsets.only(left: 5),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.white),
                        child: const Text(
                          'TODAY',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.only(left: 5),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.white),
                        child: const Text(
                          'LAST 7 DAYS',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.only(left: 5),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.white),
                        child: const Text(
                          'THIS MONTH',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.only(left: 5),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.white),
                        child: const Text(
                          'THIS YEAR',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.only(left: 5),
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blueGrey,
                            foregroundColor: Colors.white),
                        child: const Text(
                          'LAST YEAR',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: REdgeInsets.only(bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: REdgeInsets.only(right: 15),
                      child: Container(
                        width: 250.w,
                        height: 100.h,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: REdgeInsets.only(bottom: 10, left: 10),
                              child: Text(
                                'REVENUE',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                            Center(
                              child: Text(
                                '\$ 0.00',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 36.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.only(right: 15),
                      child: Container(
                        width: 250.w,
                        height: 100.h,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: REdgeInsets.only(bottom: 10, left: 10),
                              child: Text(
                                'PROFITS',
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                            Center(
                              child: Text(
                                '\$ 0.00',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 36.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: REdgeInsets.only(right: 15),
                      child: Container(
                        width: 250.w,
                        height: 100.h,
                        decoration: const BoxDecoration(color: Colors.white),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: REdgeInsets.only(bottom: 10, left: 10),
                              child: Text(
                                'PURCHASES',
                                style: TextStyle(color: Colors.redAccent),
                              ),
                            ),
                            Center(
                              child: Text(
                                '\$ 0.00',
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 36.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 285.w,
                      height: 100.h,
                      decoration: const BoxDecoration(color: Colors.white),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: REdgeInsets.only(bottom: 10, left: 10),
                            child: Text(
                              'VALUE IN STOCK (SALE PRICE - ALL TIME)',
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                          Center(
                            child: Text(
                              '\$ 0.00',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 36.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: REdgeInsets.only(bottom: 30),
                child: Container(
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Padding(
                        padding: REdgeInsets.all(15),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Incomes and expenses',
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: REdgeInsets.only(left: 5),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.blueGrey,
                                        foregroundColor: Colors.white),
                                    child: const Text(
                                      'TODAY',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: REdgeInsets.only(left: 5),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.blueGrey,
                                        foregroundColor: Colors.white),
                                    child: const Text(
                                      'LAST 7 DAYS',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: REdgeInsets.only(left: 5),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.blueGrey,
                                        foregroundColor: Colors.white),
                                    child: const Text(
                                      'THIS MONTH',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: REdgeInsets.only(left: 5),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.blueGrey,
                                        foregroundColor: Colors.white),
                                    child: const Text(
                                      'THIS YEAR',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: REdgeInsets.only(left: 5),
                                  child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        backgroundColor: Colors.blueGrey,
                                        foregroundColor: Colors.white),
                                    child: const Text(
                                      'LAST YEAR',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      Padding(
                        padding: REdgeInsets.all(15),
                        child: SfCartesianChart(
                          primaryXAxis: DateTimeAxis(
                              rangePadding: ChartRangePadding.none),
                          legend: Legend(isVisible: true),
                          series: <ChartSeries<ChartData, DateTime>>[
                            LineSeries<ChartData, DateTime>(
                                dataSource: incomesData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                name: 'incomes'),
                            LineSeries<ChartData, DateTime>(
                                dataSource: expensesData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                name: 'expenses'),
                          ],
                        ),
                      )
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
                              'Latest sales (max. 5)',
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
                              columnSpacing: 200.w,
                              dataTextStyle: TextStyle(
                                  fontSize: 16.sp, color: Colors.black54),
                              headingRowColor: const MaterialStatePropertyAll(
                                  Colors.blueGrey),
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
                              'Latest sales (max. 5)',
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
                              columnSpacing: 200.w,
                              dataTextStyle: TextStyle(
                                  fontSize: 16.sp, color: Colors.black54),
                              headingRowColor: const MaterialStatePropertyAll(
                                  Colors.blueGrey),
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
