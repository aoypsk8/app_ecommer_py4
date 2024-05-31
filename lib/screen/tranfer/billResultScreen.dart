// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers

import 'dart:math';

import 'package:final_flutter_ewallet/screen/widgets/btn.dart';
import 'package:final_flutter_ewallet/screen/widgets/buildNameAndCardNumber.dart';
import 'package:final_flutter_ewallet/screen/widgets/build_DotLine.dart';
import 'package:final_flutter_ewallet/screen/widgets/custom.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';
import 'package:sizer/sizer.dart';

class ResultBillScreen extends StatefulWidget {
  const ResultBillScreen({super.key, this.view = false});
  final bool? view;

  @override
  State<ResultBillScreen> createState() => _ResultBillScreenState();
}

class _ResultBillScreenState extends State<ResultBillScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          color: const Color(0xffD2D3D5),
          child: Stack(
            children: [
              Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      buildTextSuccess(),
                      const SizedBox(
                        height: 5,
                      ),
                      ClipPath(
                        clipper: MyCustomClipper(),
                        child: Container(
                          padding: const EdgeInsets.only(top: 40),
                          width: Get.width,
                          height: 30,
                          margin: const EdgeInsets.symmetric(horizontal: 34),
                          decoration: const BoxDecoration(
                            color: color_fff,
                          ),
                        ),
                      ),
                      ClipPath(
                        clipper: TriangleClipper(),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 34),
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.circular(7.0)),
                            color: color_fff,
                          ),
                          width: Get.width,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Column(
                              children: [
                                const TextFont(
                                  text: '20 Jul, 2023    15:12 ',
                                  fontSize: 12,
                                  color: color_777,
                                  fontWeight: FontWeight.w500,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 250,
                                  child: Image.asset(
                                    MyIcon.bill,
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const TextFont(
                                        text: 'ລາຍລະອຽດ',
                                        fontSize: 15,
                                        color: color_2d3,
                                        fontWeight: FontWeight.w700,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 15,
                                          vertical: 5,
                                        ),
                                        child: Column(
                                          children: List.generate(
                                            5,
                                            (index) => listC(),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      buildPaymentAmount(),
                                      const SizedBox(height: 20),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 34),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: ShapeDecoration(
                            color: cr_fff.withOpacity(0.2),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const TextFont(
                                text: 'ແບ່ງບັນ',
                                color: color_777,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                              const SizedBox(width: 10),
                              SvgPicture.asset(
                                MyIcon.ic_share,
                                fit: BoxFit.cover,
                                color: color_777,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 14,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 34),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: ShapeDecoration(
                            color: color_777,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFont(
                                text: 'ປິດ',
                                color: cr_fff,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              )
            ],
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
              fontSize: 12,
            ),
            TextFont(
              text: "2",
              color: color_636,
              fontSize: 10,
            ),
            TextFont(
              text: "9,000,000 ກີບ",
              color: color_636,
              fontSize: 11,
            ),
            TextFont(
              text: "/ ອັນ",
              color: color_636,
              fontSize: 10,
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

  Widget buildTextSuccess() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          MyIcon.ic_check,
          fit: BoxFit.cover,
          width: 6.w,
        ),
        const SizedBox(width: 10),
        const TextFont(
          text: 'ສຳເລັດ',
          fontWeight: FontWeight.w700,
          color: color_2d3,
          fontSize: 16,
        ),
      ],
    );
  }

  Widget buildPaymentAmount() {
    return Container(
      decoration: ShapeDecoration(
        color: color_636.withOpacity(0.6),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6, bottom: 6),
            child: Column(
              children: [
                const TextFont(
                  text: 'ຈຳນວນເງີນ',
                  color: color_fff,
                  fontWeight: FontWeight.w700,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: const Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      TextFont(
                        text: "10,000",
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: color_fff,
                      ),
                      SizedBox(width: 5),
                      TextFont(
                        text: 'kip',
                        fontWeight: FontWeight.w500,
                        color: color_fff,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
