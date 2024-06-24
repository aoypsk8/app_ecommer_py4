import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:final_flutter_ewallet/controller/productController.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:final_flutter_ewallet/utils/helper/dialog_helper.dart';
import 'package:final_flutter_ewallet/utils/api/dio_client.dart';

class UserController extends GetxController {
  final storage = GetStorage();

  RxString Cus_ID = "".obs;
  RxString First_name = "".obs;
  RxString Last_name = "".obs;
  RxString Phone_Number = "".obs;
  RxString Address = "".obs;
  RxString Profile_img = "".obs;

  @override
  void onReady() async {
    super.onReady();
    Cus_ID.value = storage.read('Cus_ID').toString() ?? "";
    First_name.value = storage.read('First_name').toString() ?? "";
    Last_name.value = storage.read('Last_name').toString() ?? "";
    Phone_Number.value = storage.read('Phone_Number').toString() ?? "";
    Address.value = storage.read('Address').toString() ?? "";
    Profile_img.value = storage.read('Profile_img').toString() ?? "";
  }

  loginAuth(String phoneNumber, String password) async {
    var url = '/auth/customer/loginUser';
    var body = {
      "phoneNumber": phoneNumber,
      "password": password,
    };

    try {
      final response = await DioClient.post(url, body);
      if (response["status"] == "ok") {
        storage.write('token', response["token"]);
        storage.write('loginCheck', true);

        storage.write('Cus_ID', response["data"]['Cus_ID']);
        storage.write('First_name', response["data"]['First_name']);
        storage.write('Last_name', response["data"]['Last_name']);
        storage.write('Phone_Number', response["data"]['Phone_Number']);
        storage.write('Address', response["data"]['Address']);
        storage.write('Profile_img', response["data"]['Profile_img']);

        DialogHelper.showSuccessDialog(
          title: "ສຳເລັດ",
          description: response['message'].toString(),
          onClose: () {
            if (!Get.isRegistered<ProductController>()) {
              Get.lazyPut(() => ProductController());
              print("ProductController initialized");
              Get.offAllNamed('/nav');

              Cus_ID.value = storage.read('Cus_ID').toString() ?? "";
              First_name.value = storage.read('First_name').toString() ?? "";
              Last_name.value = storage.read('Last_name').toString() ?? "";
              Phone_Number.value =
                  storage.read('Phone_Number').toString() ?? "";
              Address.value = storage.read('Address').toString() ?? "";
              Profile_img.value = storage.read('Profile_img').toString() ?? "";
            } else {
              print("ProductController already registered");
              Get.offAllNamed('/nav');

              Cus_ID.value = storage.read('Cus_ID').toString() ?? "";
              First_name.value = storage.read('First_name').toString() ?? "";
              Last_name.value = storage.read('Last_name').toString() ?? "";
              Phone_Number.value =
                  storage.read('Phone_Number').toString() ?? "";
              Address.value = storage.read('Address').toString() ?? "";
              Profile_img.value = storage.read('Profile_img').toString() ?? "";
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
      print('Error making HTTP request: $e');
    }
  }

  registerAuth(
    String name,
    String surname,
    String phone,
    File image,
    String address,
    String password,
  ) async {
    var url = '/auth/customer/registerUser';
    dio.FormData formData = dio.FormData.fromMap({
      "First_name": name,
      "Last_name": surname,
      "Phone_Number": phone,
      "image": await dio.MultipartFile.fromFile(image.path,
          filename: image.path.split('/').last),
      "Address": address,
      "Password": password,
    });
    try {
      final response = await DioClient.post(url, formData);
      if (response["status"] == "ok") {
        DialogHelper.showSuccessDialog(
          title: "ສຳເລັດ",
          description: response['message'].toString(),
        );
        Get.offAndToNamed("/login");
      } else {
        DialogHelper.showErrorDialog(
          title: "ແຈ້ງເຕືອນ !!",
          description: response['message'].toString(),
        );
      }
    } catch (e) {
      print('Error making HTTP request: $e');
    }
  }
}
