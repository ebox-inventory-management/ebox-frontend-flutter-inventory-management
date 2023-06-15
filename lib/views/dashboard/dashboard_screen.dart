import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:ebox_frontend_web_inventory/controller/income_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:get/get.dart';
import '../../controller/controllers.dart';
import '../../model/chart_data.dart';
import '../product/widgets/product_list.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<String> incomeName = ['TODAY', 'MONTH', 'YEAR'];

  String? selectedValueGraphIncomes = 'TODAY';

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
              Padding(
                padding: REdgeInsets.only(top: 15.w, bottom: 15.w),
                child: Row(
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
                          'Total Income',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                              fontSize: 20.sp),
                        ),
                      ],
                    ),
                    SizedBox()
                    // CustomDropdownButton2(
                    //   buttonWidth: 0.2.sw,
                    //   buttonHeight: 40.w,
                    //   hint: 'Choose Incomes',
                    //   dropdownItems: incomeName,
                    //   value: selectedValueGraphIncomes,
                    //   buttonDecoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(15.r),
                    //     color: Colors.white,
                    //   ),
                    //   dropdownWidth: 0.2.sw,
                    //   dropdownDecoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(15.r),
                    //     color: Colors.white,
                    //   ),
                    //   icon: Icon(
                    //     Icons.arrow_drop_down,
                    //     size: 40.r,
                    //     color: Colors.orange,
                    //   ),
                    //   onChanged: (index) {
                    //     setState(() {
                    //       selectedValueGraphIncomes = index;
                    //     });
                    //   },
                    // ),
                  ],
                ),
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
                              '\$${incomeController.incomesMonth.value?.total}',
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
                              '\$${incomeController.incomesYearList.value?.total}',
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
              Padding(
                padding: REdgeInsets.only(top: 15.w, bottom: 15.w),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.r))),
                  child: Padding(
                    padding: REdgeInsets.all(15.r),
                    child: SfCartesianChart(
                      primaryXAxis:
                          DateTimeAxis(rangePadding: ChartRangePadding.none),
                      legend: Legend(isVisible: true),
                      series: <ChartSeries<ChartData, DateTime>>[
                        // LineSeries<ChartData, DateTime>(
                        //     dataSource: dashboardController.incomesChartData,
                        //     xValueMapper: (ChartData data, _) => data.created_at,
                        //     yValueMapper: (ChartData data, _) => data.import_price,
                        //     name: 'Income'),
                        LineSeries<ChartData, DateTime>(
                            dataSource: dashboardController.chartDataList,
                            color: Colors.redAccent,
                            isVisible: true,
                            isVisibleInLegend: true,
                            yAxisName: 'Expense',
                            xAxisName: 'Time',
                            xValueMapper: (ChartData data, _) =>
                                data.created_at,
                            yValueMapper: (ChartData data, _) =>
                                data.import_price,
                            name: 'Expense'),
                      ],
                    ),
                  ),
                ),
              ),
              const Divider(),
              Padding(
                padding: REdgeInsets.only(top: 15.w, bottom: 15.w),
                child: Row(
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
                          'Latest Import (5 Products)',
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
              ),
              Obx(() {
                if (productController.isProductLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (productController.productList.isNotEmpty) {
                    return ProductList(products: productController.productList);
                  } else {
                    return Center(
                      child: Column(
                        children: [
                          Image.network(
                            'https://firebasestorage.googleapis.com/v0/b/ebox-inventory-management.appspot.com/o/empty.png?alt=media&token=06b30b38-cac0-490e-ac6a-6373fe120a16',
                            scale: 4,
                          ),
                          Text(
                            'Product Not Found!',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.sp),
                          ),
                        ],
                      ),
                    );
                  }
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
