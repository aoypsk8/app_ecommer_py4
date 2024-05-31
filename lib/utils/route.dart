import 'package:final_flutter_ewallet/screen/auth/loginScreen.dart';
import 'package:final_flutter_ewallet/screen/auth/registerScreen.dart';
import 'package:final_flutter_ewallet/screen/nav/navigator_bottom.dart';
import 'package:final_flutter_ewallet/screen/tranfer/billResultScreen.dart';
import 'package:final_flutter_ewallet/screen/tranfer/detailTranferScreen.dart';
import 'package:final_flutter_ewallet/screen/tranfer/reviewBeforeTranfer.dart';
import 'package:final_flutter_ewallet/screen/tranfer/tranferScreen.dart';
import 'package:get/route_manager.dart';

class AppRoute {
  static List<GetPage> routes = [
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: '/register',
      page: () => const RegisterScreen(),
    ),
    // GetPage(
    //   name: '/tranfer',
    //   page: () => const TranferScreen(),
    // ),
    // GetPage(
    //   name: '/detail_tranfer',
    //   page: () => const DetailTranferScreen(),
    // ),
    // GetPage(
    //   name: '/review_before_tranfer',
    //   page: () => const ReviewBeforeTranfer(),
    // ),
    // GetPage(
    //   name: '/bill_result',
    //   page: () => const ResultBillScreen(),
    // )
    // GetPage(
    //   name: '/login',
    //   page: () => const LoginScreen(),
    // ),
    // GetPage(
    //   name: '/register',
    //   page: () => const RegisterScreen(),
    // ),
    GetPage(
      name: '/nav',
      page: () => const NavigatorBottom(),
    ),
    // GetPage(
    //   name: '/conversation',
    //   page: () => const ConversationPage(),
    // ),
  ];
}
