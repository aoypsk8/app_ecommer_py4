import 'package:final_flutter_ewallet/controller/userController.dart';
import 'package:final_flutter_ewallet/screen/cart/models/cartModel.dart';
import 'package:final_flutter_ewallet/utils/api/dio_client.dart';
import 'package:final_flutter_ewallet/utils/helper/dialog_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class CartController extends GetxController {
  final storage = GetStorage();
  final userController = Get.find<UserController>();
  RxList<CartItem> carts = <CartItem>[].obs;

  var isLoading = true.obs;

  @override
  void onReady() {
    super.onReady();
    fetchCart();
  }

  fetchCart() async {
    isLoading.value = true;
    var url = '/cart/getAll';
    var body = {"Cus_id": userController.Cus_ID.value};
    try {
      final response = await DioClient.post(url, body);
      if (response["status"] == "ok") {
        carts.value = (response['data'] as List)
            .map((json) => CartItem.fromJson(json))
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

  // ignore: non_constant_identifier_names
  increaseQuantity(var product_id) async {
    var url = '/cart/increaseQuantity';
    var body = {
      "cus_ID": userController.Cus_ID.value,
      "Product_ID": product_id
    };
    try {
      final response = await DioClient.post(url, body);
      if (response['status'] == "ok") {
        fetchCart();
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
    }
  }

  // ignore: non_constant_identifier_names
  decreaseQuantity(var product_id) async {
    var url = '/cart/decreaseQuantity';
    var body = {
      "cus_ID": userController.Cus_ID.value,
      "Product_ID": product_id
    };
    try {
      await DioClient.post(url, body);
      fetchCart();
    } catch (e) {
      DialogHelper.showErrorDialog(
        title: "ແຈ້ງເຕືອນ !!",
        description: e.toString(),
      );
    }
  }

  deleteProductInsideCart(var product_id) async {
    var url = '/cart/deleteProductInsideCart';
    var body = {
      "cus_ID": userController.Cus_ID.value,
      "Product_ID": product_id
    };
    try {
      await DioClient.post(url, body);
      fetchCart();
    } catch (e) {
      DialogHelper.showErrorDialog(
        title: "ແຈ້ງເຕືອນ !!",
        description: e.toString(),
      );
    }
  }

  // ignore: non_constant_identifier_names
  addToCart(var product_id, var amount) async {
    var url = '/cart/addToCart';
    var body = {
      "cus_ID": userController.Cus_ID.value,
      "Product_ID": product_id,
      "amount": amount
    };
    try {
      final response = await DioClient.post(url, body);
      if (response['status'] == "ok") {
        fetchCart();
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
    }
  }
}
