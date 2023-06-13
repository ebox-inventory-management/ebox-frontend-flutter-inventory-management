import 'package:ebox_frontend_web_inventory/views/dashboard/widgets/finance_card.dart';
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
              SizedBox(
                height: 140.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return FinanceCard(
                      amount: '0.0',
                      name: 'PROFIT',
                    );
                  },
                ),
              ),
              Divider(),
              SizedBox(
                height: 15.h,
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
                              'Incomes',
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
                                        backgroundColor: Colors.orange,
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
                                        backgroundColor: Colors.orange,
                                        foregroundColor: Colors.white),
                                    child: Text(
                                      'LAST 7 DAYS',
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
                                        backgroundColor: Colors.orange,
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
                                        backgroundColor: Colors.orange,
                                        foregroundColor: Colors.white),
                                    child: Text(
                                      'THIS YEAR',
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
                                        backgroundColor: Colors.orange,
                                        foregroundColor: Colors.white),
                                    child: Text(
                                      'LAST YEAR',
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
                                name: 'Income'),
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
