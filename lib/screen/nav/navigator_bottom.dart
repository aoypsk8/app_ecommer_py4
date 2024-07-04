import 'package:final_flutter_ewallet/controller/cartController.dart';
import 'package:final_flutter_ewallet/controller/orderController.dart';
import 'package:final_flutter_ewallet/controller/productController.dart';
import 'package:final_flutter_ewallet/screen/cart/cartScreen.dart';
import 'package:final_flutter_ewallet/screen/nav/historyScreen.dart';
import 'package:final_flutter_ewallet/screen/nav/homeScreen.dart';
import 'package:final_flutter_ewallet/screen/nav/settingScreen.dart';
import 'package:final_flutter_ewallet/screen/type/typeScreen.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigatorBottom extends StatefulWidget {
  const NavigatorBottom({super.key});

  @override
  State<NavigatorBottom> createState() => _NavigatorBottomState();
}

class _NavigatorBottomState extends State<NavigatorBottom> {
  int selectedIndex = 0;
  List<Widget> pageList = [];
  @override
  void initState() {
    // cartController.carts.clear();
    Get.lazyPut(() => ProductController());
    Get.lazyPut(() => CartController());
    Get.lazyPut(() => OrderController());
    pageList.add(HomeScreen());
    pageList.add(TypeScreen());
    pageList.add(CartScreen());
    pageList.add(SettingScreen());

    super.initState();
  }

  void onItemMenu(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: pageList,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
              label: tr('ໜ້າຫລັກ'),
              icon: SvgPicture.asset(
                MyIcon.homei,
                color: selectedIndex == 0 ? color_ef8 : color_636,
              )),
          BottomNavigationBarItem(
              label: tr('ປະເພດ'),
              icon: SvgPicture.asset(
                MyIcon.typei,
                color: selectedIndex == 1 ? color_ef8 : color_636,
              )),
          BottomNavigationBarItem(
              label: tr('ກະຕ່າ'),
              icon: SvgPicture.asset(
                MyIcon.carti,
                color: selectedIndex == 2 ? color_ef8 : color_636,
              )),
          BottomNavigationBarItem(
              label: tr('ຜູ້ໃຊ້'),
              icon: SvgPicture.asset(
                MyIcon.profilei,
                color: selectedIndex == 3 ? color_ef8 : color_636,
              )),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: color_ef8,
        unselectedItemColor: color_636,
        selectedLabelStyle: GoogleFonts.notoSansLao(),
        unselectedLabelStyle: GoogleFonts.notoSansLao(),
        onTap: onItemMenu,
      ),
    );
  }
}
