import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:ebox_frontend_web_inventory/controller/income_controller.dart';
import 'package:ebox_frontend_web_inventory/model/chart_data_expense.dart';
import 'package:ebox_frontend_web_inventory/model/chart_data_product_quantity.dart';
import 'package:ebox_frontend_web_inventory/views/dashboard/widgets/product_alert_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:get/get.dart';
import '../../controller/controllers.dart';
import '../../model/chart_data_import.dart';
import '../product/widgets/product_list.dart';
import 'dart:math' as math;

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  List<String> total = ['TODAY', 'MONTH', 'YEAR'];

  String? selectedValueTotal = 'TODAY';

  String? tempIncomes = incomeController.incomeToday.value?.today_income;
  String? tempExpenses = expenseController.expenseToday.value?.today_expense;
  String? tempRevenue = revenueController.revenueToday.value?.today_revenue;

  @override
  void initState() {
    importController;
    exportController;
    incomeController;
    expenseController;
    revenueController;
    categoryController;
    brandController;
    supplierController;
    dashboardController;
    super.initState();
  }

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
              Row(
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.sp),
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
                        'Total',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.orange,
                            fontSize: 20.sp),
                      ),
                    ],
                  ),
                  CustomDropdownButton2(
                    buttonWidth: 0.2.sw,
                    buttonHeight: 40.w,
                    hint: 'Choose Date',
                    dropdownItems: total,
                    value: selectedValueTotal,
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Colors.white,
                    ),
                    dropdownWidth: 0.2.sw,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      color: Colors.white,
                    ),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      size: 40.r,
                      color: Colors.orange,
                    ),
                    onChanged: (index) {
                      setState(() {
                        selectedValueTotal = index;
                        if (selectedValueTotal == 'TODAY') {
                          tempIncomes =
                              incomeController.incomeToday.value?.today_income;
                          tempExpenses = expenseController
                              .expenseToday.value?.today_expense;
                          tempRevenue = revenueController
                              .revenueToday.value?.today_revenue;
                        } else if (selectedValueTotal == 'MONTH') {
                          tempIncomes = incomeController
                              .incomesMonth.value?.total
                              .toString();
                          tempExpenses = expenseController
                              .expenseMonth.value?.total
                              .toString();
                          tempRevenue = revenueController
                              .revenueMonth.value?.total
                              .toString();
                        } else if (selectedValueTotal == 'YEAR') {
                          tempIncomes = incomeController
                              .incomesYear.value?.total
                              .toString();
                          tempExpenses = expenseController
                              .expenseYear.value?.total
                              .toString();
                          tempRevenue = revenueController
                              .revenueYear.value?.total
                              .toString();
                        }
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: REdgeInsets.only(top: 15.r, bottom: 15.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 380.w,
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
                              'INCOMES',
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.green),
                            ),
                            Center(
                              child: Text(
                                '\$$tempIncomes',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20.sp),
                              ),
                            ),
                            SizedBox()
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 380.w,
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
                              'EXPENSES',
                              style:
                                  TextStyle(fontSize: 16.sp, color: Colors.red),
                            ),
                            Center(
                              child: Text(
                                '\$$tempExpenses',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20.sp),
                              ),
                            ),
                            SizedBox()
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 380.w,
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
                              'REVENUE',
                              style: TextStyle(
                                  fontSize: 16.sp, color: Colors.yellow),
                            ),
                            Center(
                              child: Text(
                                '\$$tempRevenue',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20.sp),
                              ),
                            ),
                            SizedBox()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.r))),
                child: Padding(
                  padding: REdgeInsets.all(15.r),
                  child: SfCartesianChart(
                    title: ChartTitle(
                        text: 'Import and Export (Product Quantity)',
                        textStyle: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    primaryXAxis: DateTimeAxis(),
                    primaryYAxis: NumericAxis(),
                    legend: Legend(isVisible: true),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    zoomPanBehavior: ZoomPanBehavior(
                      enableDoubleTapZooming: true,
                    ),
                    series: <ChartSeries<dynamic, DateTime>>[
                      LineSeries<ChartDataImport, DateTime>(
                          dataSource: dashboardController.chartDataImportList,
                          color: Colors.blueAccent,
                          isVisible: true,
                          isVisibleInLegend: true,
                          yAxisName: 'Import',
                          xAxisName: 'Time',
                          xValueMapper: (ChartDataImport data, _) =>
                              data.created_at,
                          yValueMapper: (ChartDataImport data, _) =>
                              data.total_import_price,
                          name: 'Import',
                          enableTooltip: true,
                          markerSettings: MarkerSettings(
                              isVisible: true,
                              height: 4.w,
                              width: 4.w,
                              shape: DataMarkerType.circle,
                              color: Colors.white,
                              borderColor: Colors.black),
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                          )),
                      LineSeries<ChartDataExport, DateTime>(
                          dataSource: dashboardController.chartDataExportList,
                          color: Colors.redAccent,
                          isVisible: true,
                          isVisibleInLegend: true,
                          yAxisName: 'Export',
                          xAxisName: 'Time',
                          xValueMapper: (ChartDataExport data, _) =>
                              data.created_at,
                          yValueMapper: (ChartDataExport data, _) =>
                              data.total_export_price,
                          name: 'Exports',
                          enableTooltip: true,
                          markerSettings: const MarkerSettings(
                              isVisible: true,
                              height: 4,
                              width: 4,
                              shape: DataMarkerType.circle,
                              color: Colors.white,
                              borderColor: Colors.black),
                          dataLabelSettings: const DataLabelSettings(
                            isVisible: true,
                          )),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 0.5.sw,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15.r))),
                    child: Padding(
                      padding: REdgeInsets.all(15.r),
                      child: SfCartesianChart(
                        title: ChartTitle(
                            text: 'Import and Export (Product Quantity)',
                            textStyle: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold)),
                        legend: Legend(isVisible: true),
                        primaryXAxis: DateTimeCategoryAxis(),
                        primaryYAxis: NumericAxis(),
                        tooltipBehavior: TooltipBehavior(enable: true),
                        zoomPanBehavior: ZoomPanBehavior(
                          enableDoubleTapZooming: true,
                        ),
                        series: <ChartSeries<dynamic, DateTime>>[
                          BarSeries<ChartDataImport, DateTime>(
                              dataSource:
                                  dashboardController.chartDataImportList,
                              color: Colors.blueAccent,
                              isVisible: true,
                              isVisibleInLegend: true,
                              yAxisName: 'Import',
                              xAxisName: 'Time',
                              xValueMapper: (ChartDataImport data, _) =>
                                  data.created_at,
                              yValueMapper: (ChartDataImport data, _) =>
                                  data.total_import_price,
                              name: 'Import',
                              enableTooltip: true,
                              markerSettings: MarkerSettings(
                                  isVisible: true,
                                  height: 4.w,
                                  width: 4.w,
                                  shape: DataMarkerType.circle,
                                  color: Colors.white,
                                  borderColor: Colors.black),
                              dataLabelSettings: const DataLabelSettings(
                                isVisible: true,
                              )),
                          BarSeries<ChartDataExport, DateTime>(
                              dataSource:
                                  dashboardController.chartDataExportList,
                              color: Colors.redAccent,
                              isVisible: true,
                              isVisibleInLegend: true,
                              yAxisName: 'Export',
                              xAxisName: 'Time',
                              xValueMapper: (ChartDataExport data, _) =>
                                  data.created_at,
                              yValueMapper: (ChartDataExport data, _) =>
                                  data.total_export_price,
                              name: 'Export',
                              enableTooltip: true,
                              markerSettings: const MarkerSettings(
                                  isVisible: true,
                                  height: 4,
                                  width: 4,
                                  shape: DataMarkerType.circle,
                                  color: Colors.white,
                                  borderColor: Colors.black),
                              dataLabelSettings: const DataLabelSettings(
                                isVisible: true,
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: REdgeInsets.only(top: 15.w, bottom: 15.w),
                    child: Container(
                      width: 0.3.sw,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(15.r))),
                      child: Padding(
                        padding: REdgeInsets.all(15.r),
                        child: SfCircularChart(
                          title: ChartTitle(
                              text: 'Product Quantity',
                              textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold)),
                          legend: Legend(isVisible: true),
                          selectionGesture: ActivationMode.singleTap,
                          series: <CircularSeries>[
                            // Render pie chart
                            PieSeries<ChartDataProductQuantity, String>(
                                explode: true,
                                explodeIndex: 0,
                                dataSource: dashboardController
                                    .chartDataProductQuantity,
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: true),
                                xValueMapper:
                                    (ChartDataProductQuantity data, _) =>
                                        data.product_name,
                                yValueMapper:
                                    (ChartDataProductQuantity data, _) =>
                                        data.product_quantity)
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: REdgeInsets.only(bottom: 15.r, top: 15.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.notifications,
                          color: Colors.red,
                          size: 30.r,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'All these product have less than 5',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                              fontSize: 20.sp),
                        ),
                      ],
                    ),
                    SizedBox()
                  ],
                ),
              ),
              Obx(() {
                if (productController.isProductsLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (productController.productsList.isNotEmpty) {
                    return ProductAlertList(
                        products: productController.productsList);
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
