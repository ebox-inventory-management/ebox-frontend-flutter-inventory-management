import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:ebox_frontend_web_inventory/controller/income_controller.dart';
import 'package:ebox_frontend_web_inventory/model/chart_data_export.dart';
import 'package:ebox_frontend_web_inventory/model/chart_data_product_quantity.dart';
import 'package:ebox_frontend_web_inventory/model/range_expenses.dart';
import 'package:ebox_frontend_web_inventory/model/range_incomes.dart';
import 'package:ebox_frontend_web_inventory/model/range_revenue.dart';
import 'package:ebox_frontend_web_inventory/views/dashboard/widgets/product_alert_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
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
  List<String> total = ['TODAY', 'THIS MONTH', 'THIS YEAR'];

  String? selectedValueTotal = 'TODAY';

  String? tempIncomes = incomeController.incomeToday.value?.today_income;
  String? tempExpenses = expenseController.expenseToday.value?.today_expense;
  String? tempRevenue = revenueController.revenueToday.value?.today_revenue;

  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();

  DateTime? _selectedStartDate;
  DateTime? _selectedEndDate;
  DateTime now = DateTime.now();

  @override
  void initState() {
    super.initState();
    _selectedStartDate = DateTime(now.year, now.month - 1, now.day);
    _selectedEndDate = DateTime(now.year, now.month, now.day + 1);
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.orange,
              onSurface: Colors.orange,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.orange,
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime(now.year, now.month - 1, now.day),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedStartDate) {
      setState(() {
        _selectedStartDate = picked;
      });
    }
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.orange,
              onSurface: Colors.orange,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.orange,
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: DateTime(now.year, now.month, now.day + 1),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedEndDate) {
      setState(() {
        _selectedEndDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(30.w),
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
                        } else if (selectedValueTotal == 'THIS MONTH') {
                          tempIncomes = incomeController
                              .incomesMonth.value?.total
                              .toString();
                          tempExpenses = expenseController
                              .expenseMonth.value?.total
                              .toString();
                          tempRevenue = revenueController
                              .revenueMonth.value?.total
                              .toString();
                        } else if (selectedValueTotal == 'THIS YEAR') {
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
              Padding(
                padding: REdgeInsets.only(top: 15.r, bottom: 15.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.multiline_chart,
                          color: Colors.orange,
                          size: 30.r,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          'Graph',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.orange,
                              fontSize: 20.sp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: TextFormField(
                            controller: startDateController,
                            keyboardType: TextInputType.datetime,
                            textInputAction: TextInputAction.done,
                            obscureText: false,
                            readOnly: true,
                            onTap: () async {
                              _selectStartDate(context);
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10.r)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10.r)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0.r),
                              ),
                              hintText: _selectedStartDate == null
                                  ? DateFormat('dd / MMMM / yyyy').format(
                                      DateTime(
                                          now.year, now.month - 1, now.day),
                                    )
                                  : DateFormat('dd / MMMM / yyyy')
                                      .format(_selectedStartDate!),
                              hintStyle: TextStyle(fontSize: 14.sp),
                              labelStyle: TextStyle(fontSize: 14.sp),
                              suffixIcon: Icon(
                                Icons.date_range,
                                size: 25.r,
                              ),
                              suffixIconColor: Colors.orange,
                            ),
                          ),
                        ),
                        Padding(
                          padding: REdgeInsets.only(left: 15.r, right: 15.r),
                          child: Text(
                            'To',
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 200.w,
                          child: TextFormField(
                            controller: endDateController,
                            keyboardType: TextInputType.datetime,
                            textInputAction: TextInputAction.done,
                            obscureText: false,
                            readOnly: true,
                            onTap: () async {
                              _selectEndDate(context);
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10.r)),
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(10.r)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0.r),
                              ),
                              hintText: _selectedEndDate == null
                                  ? DateFormat('dd / MMMM / yyyy')
                                      .format(DateTime.now())
                                  : DateFormat('dd / MMMM / yyyy')
                                      .format(_selectedEndDate!),
                              hintStyle: TextStyle(fontSize: 14.sp),
                              labelStyle: TextStyle(fontSize: 14.sp),
                              suffixIcon: Icon(
                                Icons.date_range,
                                size: 25.r,
                              ),
                              suffixIconColor: Colors.orange,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15.w,
                        ),
                        IconButton(
                            onPressed: () {
                              if (_selectedStartDate == null ||
                                  _selectedEndDate == null) {
                                Get.snackbar('Something wrong!',
                                    'You need to choose the date first!',
                                    colorText: Colors.white,
                                    margin: REdgeInsets.all(15.r),
                                    backgroundColor: Colors.redAccent,
                                    snackPosition: SnackPosition.BOTTOM,
                                    duration: const Duration(seconds: 2));
                              }
                              setState(() {
                                incomeController.getRange(
                                    start: DateTime(
                                            now.year, now.month - 1, now.day)
                                        .toString(),
                                    end: DateTime(
                                            now.year, now.month, now.day + 1)
                                        .toString());
                              });
                            },
                            icon: Icon(
                              Icons.search,
                              size: 25.r,
                              color: Colors.orange,
                            ))
                      ],
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
                        text: 'Income, Expense and Revenue',
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
                      LineSeries<RangeIncomes, DateTime>(
                          dataSource: incomeController.rangeIncomesList,
                          color: Colors.blueAccent,
                          isVisible: true,
                          isVisibleInLegend: true,
                          yAxisName: 'Income',
                          xAxisName: 'Time',
                          xValueMapper: (RangeIncomes data, _) =>
                              data.created_at,
                          yValueMapper: (RangeIncomes data, _) =>
                              data.income_amount,
                          name: 'Income',
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
                      LineSeries<RangeExpenses, DateTime>(
                          dataSource: expenseController.rangeExpensesList,
                          color: Colors.redAccent,
                          isVisible: true,
                          isVisibleInLegend: true,
                          yAxisName: 'Expense',
                          xAxisName: 'Time',
                          xValueMapper: (RangeExpenses data, _) =>
                              data.created_at,
                          yValueMapper: (RangeExpenses data, _) =>
                              data.income_amount,
                          name: 'Expense',
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
                      LineSeries<RangeRevenues, DateTime>(
                          dataSource: revenueController.rangeRevenuesList,
                          color: Colors.yellowAccent,
                          isVisible: true,
                          isVisibleInLegend: true,
                          yAxisName: 'Revenue',
                          xAxisName: 'Time',
                          xValueMapper: (RangeRevenues data, _) =>
                              data.created_at,
                          yValueMapper: (RangeRevenues data, _) => data.revenue,
                          name: 'Revenue',
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
                        primaryXAxis: DateTimeAxis(),
                        primaryYAxis: NumericAxis(),
                        tooltipBehavior: TooltipBehavior(enable: true),
                        zoomPanBehavior: ZoomPanBehavior(
                          enableDoubleTapZooming: true,
                        ),
                        series: <ChartSeries<dynamic, DateTime>>[
                          LineSeries<ChartDataImport, DateTime>(
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
                                  data.import_quantity,
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
                                  data.export_quantity,
                              name: 'Export',
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
                              text: 'Import (Quantity)',
                              textStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold)),
                          legend: Legend(isVisible: true),
                          selectionGesture: ActivationMode.singleTap,
                          series: <CircularSeries>[
                            // Render pie chart
                            PieSeries<ChartDataImport, String>(
                                explode: true,
                                explodeIndex: 0,
                                dataSource:
                                    dashboardController.chartDataImportList,
                                dataLabelSettings:
                                    DataLabelSettings(isVisible: true),
                                xValueMapper: (ChartDataImport data, _) =>
                                    data.product_name,
                                yValueMapper: (ChartDataImport data, _) =>
                                    data.import_quantity),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(() {
                if (productController.isProductsLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (productController.productsList.isNotEmpty) {
                    return Column(
                      children: [
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
                        ProductAlertList(
                            products: productController.productsList),
                      ],
                    );
                  } else {
                    return SizedBox();
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
