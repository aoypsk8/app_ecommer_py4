import 'dart:convert';
import 'dart:io';

import 'package:final_flutter_ewallet/controller/cartController.dart';
import 'package:final_flutter_ewallet/controller/productController.dart';
import 'package:final_flutter_ewallet/controller/userController.dart';
import 'package:final_flutter_ewallet/screen/cart/billScreen.dart';
import 'package:final_flutter_ewallet/screen/product/models/orderModel.dart';
import 'package:final_flutter_ewallet/screen/product/models/productModelOrder.dart';
import 'package:final_flutter_ewallet/utils/api/dio_client.dart';
import 'package:final_flutter_ewallet/utils/helper/dialog_helper.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart' as dio;

class OrderController extends GetxController {
  final storage = GetStorage();
  final userController = Get.find<UserController>();
  final cartController = Get.find<CartController>();

  // RxList<CartItem> carts = <CartItem>[].obs;
  RxList<OrderModel> orders = <OrderModel>[].obs;
  RxList<ProductOrderModel> productOrders = <ProductOrderModel>[].obs;

  var isLoading = true.obs;

  DateTime dateOrder = (DateTime.now());
  RxString imageOrder = "".obs;
  RxString totalOrder = "".obs;
  RxList productOrder = <Map<String, dynamic>>[].obs;

  payment(String phone, String location, File image,
      CartController cartController) async {
    var url = '/order/create';
    var cart = cartController.carts.first;
    var products = cart.products
        .map(
          (item) => {
            "Product_ID": item.productId,
            "quantity": item.amount,
            "Price": item.price
          },
        )
        .toList();
    dio.FormData formData = dio.FormData.fromMap({
      "Cus_ID": userController.Cus_ID.value,
      "Product": jsonEncode(products),
      "Location": location,
      "phone": phone,
      "image": await dio.MultipartFile.fromFile(
        image.path,
        filename: image.path.split('/').last,
      ),
    });

    try {
      final response = await DioClient.post(url, formData, key: "data-form");
      print(response);
      var orderid = response['orderId'];
      print(orderid);
      if (response["status"] == "ok") {
        DialogHelper.showSuccessDialog(
          title: "ສຳເລັດ",
          description: response['message'].toString(),
          onClose: () async {
            //remove cart
            try {
              var body = {"cus_ID": userController.Cus_ID.value};
              print(body);
              var urlRemoveCart = "/cart/delete";
              final respone = await DioClient.delete(
                urlRemoveCart,
                jsonEncode(body),
              );
              if (respone['status'] == "ok") {
                try {
                  var urlGetOrderByID = '/orders/getByID/${orderid}';
                  final responseOrderByID =
                      await DioClient.get(urlGetOrderByID, loading: false);
                  print(responseOrderByID);
                  var orderData = responseOrderByID["data"];
                  //productOrders

                  dateOrder = DateTime.parse(orderData["order_date"]);
                  imageOrder.value = orderData["ImagePay"].toString();
                  totalOrder.value = orderData["total"].toString();
                  productOrders.value = (orderData['products'] as List)
                      .map((json) => ProductOrderModel.fromJson(json))
                      .toList();

                  Get.offAndToNamed("/bill_result");
                  cartController.fetchCart();
                } catch (e) {
                  DialogHelper.showErrorDialog(
                    title: "ແຈ້ງເຕືອນ !!",
                    description: e.toString(),
                  );
                }
              }
            } catch (e) {
              DialogHelper.showErrorDialog(
                title: "ແຈ້ງເຕືອນ !!",
                description: e.toString(),
              );
            }
          },
        );
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

  fetchHistoryBuy() async {
    isLoading.value = true;
    print(userController.Cus_ID);
    var url = '/orders/getByCustomer/${userController.Cus_ID}';
    try {
      final response = await DioClient.get(url, loading: false);
      print(response);
      if (response["status"] == "ok") {
        orders.value = (response['data'] as List)
            .map((json) => OrderModel.fromJson(json))
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

  fetchOrderByIdOnly(orderid) async {
    try {
      var urlGetOrderByID = '/orders/getByID/${orderid}';
      final responseOrderByID =
          await DioClient.get(urlGetOrderByID, loading: false);
      print(responseOrderByID);
      var orderData = responseOrderByID["data"];
      //productOrders

      dateOrder = DateTime.parse(orderData["order_date"]);
      imageOrder.value = orderData["ImagePay"].toString();
      totalOrder.value = orderData["total"].toString();
      productOrders.value = (orderData['products'] as List)
          .map((json) => ProductOrderModel.fromJson(json))
          .toList();

      // Get.offAndToNamed("/bill_result", arguments: {'view': true});
      Get.to(ResultBillScreen(
        view: true,
      ));
      cartController.fetchCart();
    } catch (e) {
      DialogHelper.showErrorDialog(
        title: "ແຈ້ງເຕືອນ !!",
        description: e.toString(),
      );
    }
  }
}
