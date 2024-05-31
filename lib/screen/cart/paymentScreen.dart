import 'dart:math';

import 'package:final_flutter_ewallet/screen/tranfer/billResultScreen.dart';
import 'package:final_flutter_ewallet/screen/widgets/btn.dart';
import 'package:final_flutter_ewallet/screen/widgets/formField.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';
import 'package:sizer/sizer.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cr_fff,
      body: FooterLayout(
        footer: Btn(
          color: color_ff7.withOpacity(0.8),
          borderColor: cr_fff,
          func: () {
            // doLogin();
            Get.to(ResultBillScreen());
          },
          text: "ຈ່າຍເງີນ",
        ),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 12.5.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: const Alignment(2.00, -2.00),
                      end: const Alignment(0, 8),
                      colors: [color_ffa.withOpacity(0.9), color_ee4],
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        top: 0,
                        child: SvgPicture.asset(
                          MyIcon.bg_gradient2,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 7.h,
                        left: 0,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 0, top: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () => Get.back(),
                                    child: const Icon(
                                      Icons.arrow_back_ios,
                                      color: color_fff,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const TextFont(
                                    text: "ຈ່າຍເງີນ",
                                    color: color_fff,
                                    fontSize: 17,
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          TextFont(
                            text: "ຊື່ : ",
                            color: color_3c4,
                            fontSize: 15,
                          ),
                          TextFont(
                            text: "ພົງສະຫວັນ ພົງສະກົນ",
                            color: color_636,
                            fontSize: 15,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const TextFont(
                        text: "ເບີໂທລະສັບ :",
                        color: color_636,
                        fontSize: 15,
                      ),
                      const SizedBox(height: 10),
                      buildFormField(
                        controller: _numberController,
                        hinText: "ປ້ອນເບີໂທລະສັບ",
                        hintTextColor: color_636.withOpacity(0.4),
                        hintTextInputColor: color_636,
                        // color: cr_red,
                      ),
                      const SizedBox(height: 10),
                      const TextFont(
                        text: "ສະຖານທີ່ສົ່ງ :",
                        color: color_636,
                        fontSize: 15,
                      ),
                      const SizedBox(height: 10),
                      BuildTextAreaValidate(
                        controller: _descriptionController,
                        name: 'Description',
                        hintText: "dokarao, xaysedtha, Vientaine",
                      ),
                      const SizedBox(height: 10),
                      const TextFont(
                        text: "ລາຍການ :",
                        color: color_636,
                        fontSize: 15,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: color_636.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadiusDirectional.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Column(
                                children: List.generate(
                                  5,
                                  (index) => listC(),
                                ),
                              ),
                              const SizedBox(height: 50),
                              const Divider(
                                thickness: sqrt2,
                                color: Color.fromARGB(67, 0, 0, 0),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextFont(
                                      text: "ຍອດລວມ : ",
                                      color: color_636,
                                      fontSize: 20,
                                    ),
                                    Row(
                                      children: [
                                        TextFont(
                                          text: "99,000,000 ",
                                          color: color_636,
                                          fontSize: 20,
                                        ),
                                        TextFont(
                                          text: "ກີບ",
                                          color: color_636,
                                          fontSize: 15,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Image.asset(MyIcon.qrCode),
                              const TextFont(
                                text: "ແນບຮູບພາບ",
                                color: color_3c4,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              const TextFont(
                                text: "ແນບຮູບພາບຫລັກຖານສຳຫລັບ",
                                color: color_3c4,
                                fontSize: 12,
                              ),
                              const TextFont(
                                text: "ການຊຳລະເງີນທຸກຄັ້ງ",
                                color: color_3c4,
                                fontSize: 12,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(color: color_3c4),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: TextFont(
                                text: "ເລືອກຮູບພາບ",
                                color: color_fff,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: Container(
                          width: double.infinity,
                          decoration: const BoxDecoration(color: color_3c4),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Center(
                              child: TextFont(
                                text: "ຖ່າຍຮູບ",
                                color: color_fff,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listC() {
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFont(
              text: "iPhone 16 Pro Max",
              color: color_636,
              fontSize: 15,
            ),
            TextFont(
              text: "2",
              color: color_636,
              fontSize: 13,
            ),
            TextFont(
              text: "9,000,000 ກີບ",
              color: color_636,
              fontSize: 14,
            ),
            TextFont(
              text: "/ ອັນ",
              color: color_636,
              fontSize: 13,
            ),
          ],
        ),
        Divider(
          thickness: sqrt2,
          color: Color.fromARGB(67, 0, 0, 0),
        ),
      ],
    );
  }
}
