import 'package:final_flutter_ewallet/screen/product/models/productModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:final_flutter_ewallet/screen/type/models/productTypemodel.dart';
import 'package:final_flutter_ewallet/utils/helper/dialog_helper.dart';
import 'package:final_flutter_ewallet/utils/api/dio_client.dart';

class ProductController extends GetxController {
  final storage = GetStorage();
  RxList<ProductTypeModel> productType = <ProductTypeModel>[].obs;
  RxList<ProductModel> productNew = <ProductModel>[].obs;
  RxList<ProductModel> productAll = <ProductModel>[].obs;
  RxList<ProductModel> productByType = <ProductModel>[].obs;
  // RxList<ProductModel> productByType = <ProductModel>[].obs;
  var isLoading = true.obs; // Observable for loading state

  @override
  void onReady() {
    super.onReady();
    fetchProductType();
    fetchNewProduct();
    fetchAllProduct();
  }

  fetchProductType() async {
    isLoading.value = true; // Set loading state to true
    var url = '/productType/getAll';
    try {
      final response = await DioClient.get(url);
      if (response["status"] == "ok") {
        productType.value = (response['data'] as List)
            .map((json) => ProductTypeModel.fromJson(json))
            .toList();
      } else {
        DialogHelper.showErrorDialog(
          title: "ແຈ້ງເຕືອນ !!",
          description: response['message'].toString(),
        );
      }
    } catch (e) {
      DialogHelper.showErrorDialog(
        title: "ແຈ້ງເຕືອນ !!",
        description: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }

  fetchNewProduct() async {
    isLoading.value = true;
    var url = '/product/getNew';
    try {
      final response = await DioClient.get(url);
      if (response["status"] == "ok") {
        productNew.value = (response['data'] as List)
            .map((json) => ProductModel.fromJson(json))
            .toList();
      } else {
        DialogHelper.showErrorDialog(
          title: "ແຈ້ງເຕືອນ !!",
          description: response['message'].toString(),
        );
      }
    } catch (e) {
      DialogHelper.showErrorDialog(
        title: "ແຈ້ງເຕືອນ !!",
        description: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }

  fetchAllProduct() async {
    isLoading.value = true;
    var url = '/product/getAll';
    try {
      final response = await DioClient.get(url);
      if (response["status"] == "ok") {
        productAll.value = (response['data'] as List)
            .map((json) => ProductModel.fromJson(json))
            .toList();
      } else {
        DialogHelper.showErrorDialog(
          title: "ແຈ້ງເຕືອນ !!",
          description: response['message'].toString(),
        );
      }
    } catch (e) {
      DialogHelper.showErrorDialog(
        title: "ແຈ້ງເຕືອນ !!",
        description: e.toString(),
      );
    } finally {
      isLoading.value =
          false; // Set loading state to false regardless of success or failure
    }
  }

  fetchProductByType(var typeId) async {
    var url = '/product/getProductByType/${typeId}';
    try {
      final response = await DioClient.get(url, loading: false);
      print(response);
      if (response["status"] == "ok") {
        productByType.value = (response['data'] as List)
            .map((json) => ProductModel.fromJson(json))
            .toList();
      } else {
        DialogHelper.showErrorDialog(
          title: "ແຈ້ງເຕືອນ !!",
          description: response['message'].toString(),
        );
      }
    } catch (e) {
      DialogHelper.showErrorDialog(
        title: "ແຈ້ງເຕືອນ !!",
        description: e.toString(),
      );
    } finally {
      isLoading.value = false;
    }
  }
}
