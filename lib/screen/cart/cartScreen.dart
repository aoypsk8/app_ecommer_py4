import 'dart:math';

import 'package:final_flutter_ewallet/screen/widgets/btn.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FooterLayout(
        footer: Container(
          height: MediaQuery.of(context).size.height - 83.h,
          color: cr_fff,
          child: Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFont(
                        text: "ຍອດລວມ",
                        color: color_ef8,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                      TextFont(
                        text: "53,900,000 ກີບ",
                        color: color_ef8,
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
                Btn(
                  func: () {},
                  textSize: 15,
                  color: color_ef8,
                  borderColor: cr_fff,
                  text: "ຈ່າຍເງີນ",
                  textColor: color_fff,
                ),
              ],
            ),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextFont(
                      text: "ກະຕ່າ",
                      color: color_3c4,
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                    const TextFont(
                      text: "ກະຕ່າສິນຄ້າ",
                      color: color_3c4,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    const SizedBox(height: 25),
                    Column(
                      children: List.generate(
                        10,
                        (index) => cartCard(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cartCard() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 25.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(15),
                      color: color_f1f,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const TextFont(
                                  text: "iPhone 16 Pro Max",
                                  color: color_3c4,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                                SvgPicture.asset(MyIcon.x),
                              ],
                            ),
                            const TextFont(
                              text: "example text  Lorem Ipsum...",
                              color: color_636,
                              fontSize: 12,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Row(
                              children: [
                                TextFont(
                                  text: "8,900,000",
                                  color: color_3c4,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                ),
                                TextFont(
                                  text: " ກີບ",
                                  color: color_3c4,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 6.w,
                                  height: 6.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: color_d9d9,
                                    ),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(
                                      4,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 0,
                                      horizontal: 4,
                                    ),
                                    child: SvgPicture.asset(MyIcon.minus),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 2,
                                  ),
                                  child: TextFont(
                                    text: " 4 ",
                                    color: color_3c4,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Container(
                                  width: 6.w,
                                  height: 6.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: color_d9d9,
                                    ),
                                    borderRadius:
                                        BorderRadiusDirectional.circular(
                                      4,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 0,
                                      horizontal: 0,
                                    ),
                                    child: SvgPicture.asset(MyIcon.plus),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider(
            thickness: sqrt2,
            color: Colors.black12,
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
