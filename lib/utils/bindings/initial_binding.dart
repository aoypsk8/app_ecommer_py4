import 'package:final_flutter_ewallet/controller/cartController.dart';
import 'package:final_flutter_ewallet/controller/homeController.dart';
import 'package:final_flutter_ewallet/controller/orderController.dart';
import 'package:final_flutter_ewallet/controller/productController.dart';
import 'package:final_flutter_ewallet/controller/userController.dart';
import 'package:get/get.dart';

class InitialBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
    Get.put(HomeController());

    // Get.put(PaymentController());

    Get.lazyPut<ProductController>(() => ProductController());
    Get.lazyPut<CartController>(() => CartController());
    Get.lazyPut<OrderController>(() => OrderController());
    // Get.lazyPut<HomeController>(() => HomeController());
    // Get.lazyPut<UserController>(() => UserController());
    // Get.lazyPut<PaymentController>(() => PaymentController());
    // Get.lazyPut<LogsController>(() => LogsController());
  }
}
