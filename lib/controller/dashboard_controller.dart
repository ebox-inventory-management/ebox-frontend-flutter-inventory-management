import 'package:ebox_frontend_web_inventory/api/import_service.dart';
import 'package:ebox_frontend_web_inventory/api/product_service.dart';
import 'package:ebox_frontend_web_inventory/model/chart_data_product_quantity.dart';
import 'package:get/get.dart';
import '../api/export_service.dart';
import '../model/chart_data_import.dart';
import '../model/chart_data_expense.dart';
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

  @override
  void onInit() async {
    getChartDataImport();
    getChartDataExport();
    getChartDataProductQuantity();
    super.onInit();
  }

  void getChartDataProductQuantity() async {
    try {
      isChartDataProductQuantityLoading(true);
      //call api
      var result = await RemoteProductService().get();
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
      isChartDataImportLoading(true);
      //call api
      var result = await RemoteImportService().get();
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
      isChartDataExportLoading(true);
      //call api
      var result = await RemoteExportService().get();
      if (result != null) {
        //assign api results
        chartDataExportList.assignAll(chartDataExportListFromJson(result.body));
      }
    } finally {
      isChartDataExportLoading(false);
    }
  }
}
