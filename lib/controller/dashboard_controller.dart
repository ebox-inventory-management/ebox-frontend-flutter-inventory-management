import 'package:ebox_frontend_web_inventory/api/product_service.dart';
import 'package:get/get.dart';
import '../model/chart_data_expenses.dart';
import '../views/dashboard/dashboard_screen.dart';

class DashboardController extends GetxController {
  RxList<ChartDataExpenses> chartDataList =
      List<ChartDataExpenses>.empty(growable: true).obs;

  RxBool isChartDataLoading = false.obs;

  @override
  void onInit() async {
    getChartData();
    super.onInit();
  }

  void getChartData() async {
    try {
      isChartDataLoading(true);
      //call api
      var result = await RemoteProductService().get();
      if (result != null) {
        //assign api result
        chartDataList.assignAll(chartDataExpensesListFromJson(result.body));

        //save api result to local db
      }
    } finally {
      isChartDataLoading(false);
    }
  }
}
