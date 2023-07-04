import 'package:ebox_frontend_web_inventory/api/import_service.dart';
import 'package:ebox_frontend_web_inventory/api/product_service.dart';
import 'package:ebox_frontend_web_inventory/model/chart_data_product_quantity.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/export_service.dart';
import '../model/chart_data_import.dart';
import '../model/chart_data_export.dart';
import '../views/dashboard/dashboard_screen.dart';

class DashboardController extends GetxController {
  RxList<ChartDataImport> chartDataImportList =
      List<ChartDataImport>.empty(growable: true).obs;
  RxList<ChartDataExport> chartDataExportList =
      List<ChartDataExport>.empty(growable: true).obs;
  RxList<ChartDataProductQuantity> chartDataProductQuantity =
      List<ChartDataProductQuantity>.empty(growable: true).obs;

  RxBool isChartDataImportLoading = false.obs;
  RxBool isChartDataExportLoading = false.obs;
  RxBool isChartDataProductQuantityLoading = false.obs;

  var token;
  @override
  void onInit() async {
    getChartDataImport();
    getChartDataExport();
    getChartDataProductQuantity();
    super.onInit();
  }

  void getChartDataProductQuantity() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isChartDataProductQuantityLoading(true);
      //call api
      var result = await RemoteProductService().get(token: token);
      if (result != null) {
        //assign api result
        chartDataProductQuantity
            .assignAll(chartDataProductQuantityListFromJson(result.body));
      }
    } finally {
      isChartDataProductQuantityLoading(false);
    }
  }

  void getChartDataImport() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isChartDataImportLoading(true);
      //call api
      var result = await RemoteImportService().get(token: token);
      if (result != null) {
        //assign api result
        chartDataImportList.assignAll(chartDataImportListFromJson(result.body));
      }
    } finally {
      isChartDataImportLoading(false);
    }
  }

  void getChartDataExport() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token');
      isChartDataExportLoading(true);
      //call api
      var result = await RemoteExportService().get(token: token);
      if (result != null) {
        //assign api results
        chartDataExportList.assignAll(chartDataExportListFromJson(result.body));
      }
    } finally {
      isChartDataExportLoading(false);
    }
  }
}
