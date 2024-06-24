import 'package:final_flutter_ewallet/controller/productController.dart';
import 'package:final_flutter_ewallet/controller/userController.dart';
import 'package:final_flutter_ewallet/screen/product/historyBuyScree.dart';
import 'package:final_flutter_ewallet/screen/widgets/btn.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sizer/sizer.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final LocalAuthentication localAuth = LocalAuthentication();
  final userController = Get.find<UserController>();
  final textScaleFactor = Get.mediaQuery.textScaleFactor;
  final storage = GetStorage();
  bool supportBiometric = false;
  bool? isSwitched = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: cr_fff,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 220 * textScaleFactor,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(2.00, -2.00),
                    end: const Alignment(-2, 1),
                    colors: [color_ffa.withOpacity(0.5), color_ee4],
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: Opacity(
                        opacity: 0.5,
                        child: SvgPicture.asset(
                          MyIcon.bg_gradient2,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Expanded(
                      child: buidlPhoneName(),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 20),
                    child: Container(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        shadows: const [
                          BoxShadow(
                            color: Colors.black12,
                            spreadRadius: 0,
                            blurRadius: 20,
                            offset: Offset(2, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const TextFont(
                              text: 'ຂໍ້ມູນສ່ວນຕົວ',
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: color_777,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            buildTextDetail("ຂໍ້ມູນສ່ວນບຸກຄົນ", () {
                              print("object");
                            }),
                            const SizedBox(
                              height: 15,
                            ),
                            buildTextDetail("ປະຫວັດການສັ່ງຊື້", () {
                              Get.to(const HistoryBuyScreen());
                            }),
                            const SizedBox(
                              height: 15,
                            ),
                            const TextFont(
                              text: 'ຊ່ວຍເຫລືອ',
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: color_777,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            buildTextDetail("ກ່ຽວກັບ ພວກເຮົາ", () {
                              print("object");
                            }),
                            const SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Btn(
                    func: () {
                      storage.erase(); //clear
                      Get.offAndToNamed("/login");
                      if (Get.isRegistered<ProductController>()) {
                        Get.delete<ProductController>();
                      }
                    },
                    textSize: 15,
                    color: color_eee,
                    text: "ອອກຈາກລະບົບ",
                    textColor: color_777,
                    borderColor: color_eee,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextDetail(String text, VoidCallback func) {
    return InkWell(
      onTap: func,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFont(
            text: text,
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: color_2d3,
          ),
          SvgPicture.asset(
            MyIcon.arrow_right,
            fit: BoxFit.contain,
          )
        ],
      ),
    );
  }

  Widget buidlPhoneName() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 25.w,
          height: 25.w,
          decoration: BoxDecoration(
            color: color_fff.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(70.0),
            child: userController.Profile_img.value.length > 5
                ? Image.network(
                    userController.Profile_img.value,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    'https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png',
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFont(
              text: userController.First_name.value,
              fontWeight: FontWeight.w500,
              color: color_fff,
              fontSize: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextFont(
                  text: 'ເບີໂທລະສັບ :',
                  color: color_fff,
                  fontSize: 14,
                ),
                TextFont(
                  text: '${userController.Phone_Number.value}',
                  color: color_fff,
                  fontSize: 17,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
