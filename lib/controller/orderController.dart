import 'dart:convert';
import 'dart:io';

import 'package:final_flutter_ewallet/controller/cartController.dart';
import 'package:final_flutter_ewallet/controller/userController.dart';
import 'package:final_flutter_ewallet/utils/api/dio_client.dart';
import 'package:final_flutter_ewallet/utils/helper/dialog_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart' as dio;

class OrderController extends GetxController {
  final storage = GetStorage();
  final userController = Get.find<UserController>();
  final cartController = Get.find<CartController>();
  // RxList<CartItem> carts = <CartItem>[].obs;

  var isLoading = true.obs;

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
                Get.offAndToNamed("/nav");
                cartController.fetchCart();
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
}
