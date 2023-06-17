import 'package:ebox_frontend_web_inventory/api/import_service.dart';
import 'package:ebox_frontend_web_inventory/api/product_service.dart';
import 'package:get/get.dart';
import '../api/export_service.dart';
import '../model/chart_data_expenses.dart';
import '../model/chart_data_incomes.dart';
import '../views/dashboard/dashboard_screen.dart';

class DashboardController extends GetxController {
  RxList<ChartDataExpenses> chartDataExpenseList =
      List<ChartDataExpenses>.empty(growable: true).obs;
  RxList<ChartDataIncomes> chartDataIncomeList =
      List<ChartDataIncomes>.empty(growable: true).obs;

  RxBool isChartDataExpenseLoading = false.obs;
  RxBool isChartDataIncomeLoading = false.obs;

  @override
  void onInit() async {
    getChartDataExpense();
    getChartDataIncome();
    super.onInit();
  }

  void getChartDataExpense() async {
    try {
      isChartDataExpenseLoading(true);
      //call api
      var result = await RemoteImportService().get();
      if (result != null) {
        //assign api result
        chartDataExpenseList
            .assignAll(chartDataExpensesListFromJson(result.body));
      }
    } finally {
      isChartDataExpenseLoading(false);
    }
  }

  void getChartDataIncome() async {
    try {
      isChartDataIncomeLoading(true);
      //call api
      var result = await RemoteExportService().get();
      if (result != null) {
        //assign api result
        chartDataIncomeList
            .assignAll(chartDataIncomesListFromJson(result.body));
      }
    } finally {
      isChartDataIncomeLoading(false);
    }
  }
}
