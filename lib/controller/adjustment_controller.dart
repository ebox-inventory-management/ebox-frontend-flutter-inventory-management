import 'package:ebox_frontend_web_inventory/model/products.dart';
import 'package:get/get.dart';

import '../api/adjustment_service.dart';

class AdjustmentController extends GetxController {
  RxList<Products> productsByCategoryList =
      List<Products>.empty(growable: true).obs;
  RxList<Products> productsByCategoryBrandList =
      List<Products>.empty(growable: true).obs;
  RxList<Products> productsByCategorySupplierList =
      List<Products>.empty(growable: true).obs;

  RxBool isProductsByCategoryLoading = false.obs;
  RxBool isProductsByCategorySupplierLoading = false.obs;
  RxBool isProductsByCategoryBrandLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
  }

  void getProductsByCategory({required int id}) async {
    try {
      isProductsByCategoryLoading(true);
      //call api
      var result =
          await RemoteAdjustmentService.getProductsByCategoryId(id: id);
      if (result != null) {
        //assign api result
        productsByCategoryList.assignAll(productsListFromJson(result.body));

        //save api result to local db
      }
    } finally {
      isProductsByCategoryLoading(false);
    }
  }

  void getProductsByCategoryBrand({
    required int categoryId,
    required int brandId,
  }) async {
    try {
      isProductsByCategoryBrandLoading(true);
      //call api
      var result = await RemoteAdjustmentService.getProductsByCategoryBrandId(
          brandId: brandId, categoryId: categoryId);
      if (result != null) {
        //assign api result
        productsByCategoryBrandList
            .assignAll(productsListFromJson(result.body));

        //save api result to local db
      }
    } finally {
      isProductsByCategoryBrandLoading(false);
    }
  }

  void getProductsByCategorySupplier({
    required int categoryId,
    required int supplierId,
  }) async {
    try {
      isProductsByCategorySupplierLoading(true);
      //call api
      var result =
          await RemoteAdjustmentService.getProductsByCategorySupplierId(
              supplierId: supplierId, categoryId: categoryId);
      if (result != null) {
        //assign api result
        productsByCategorySupplierList
            .assignAll(productsListFromJson(result.body));

        //save api result to local db
      }
    } finally {
      isProductsByCategorySupplierLoading(false);
    }
  }
}
