import 'dart:math';

import 'package:final_flutter_ewallet/screen/widgets/btn.dart';
import 'package:final_flutter_ewallet/screen/widgets/build_DotLine.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';
import 'package:sizer/sizer.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_f4f4,
      body: FooterLayout(
        footer: Container(
          height: MediaQuery.of(context).size.height - 85.h,
          color: cr_fff,
          child: Column(
            children: [
              const Divider(
                thickness: sqrt2,
                color: Color.fromARGB(16, 0, 0, 0),
              ),
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
                text: "ເພີ່ມເຂົ້າກະຕ່າ",
                textColor: color_fff,
              ),
            ],
          ),
        ),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: cr_fff,
                      // shape: BoxShape.circle,

                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(8, 0, 0, 0),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(3, 3),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: color_636,
                        ),
                      ),
                    ),
                  ),
                ),
                SafeArea(
                    child: Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Container(
                                width: 170,
                                height: 290,
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () => FocusScope.of(context)
                                    .requestFocus(FocusNode()),
                                behavior: HitTestBehavior.opaque,
                                child: Container(
                                  width: double.infinity,
                                  height: double.infinity,
                                  decoration: const BoxDecoration(
                                    color: cr_fff,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromARGB(8, 0, 0, 0),
                                        spreadRadius: 2,
                                        blurRadius: 3,
                                        offset: Offset(3, -3),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const TextFont(
                                            text: "Iphone 15ProMax",
                                            color: color_3c4,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          SizedBox(height: 1.h),
                                          const TextFont(
                                            text:
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                                            color: color_3c4,
                                            maxLines: 6,
                                            fontSize: 12,
                                          ),
                                          SizedBox(height: 1.h),
                                          const TextFont(
                                            text: "ສິນຄ້າໃນຮ້ານຍັງ ( 23 )",
                                            color: color_3c4,
                                            fontSize: 19,
                                          ),
                                          SizedBox(height: 2.h),
                                          const buildDotLine(
                                            color: color_ddd,
                                            dashlenght: 12,
                                          ),
                                          SizedBox(height: 2.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  const TextFont(
                                                    text: "ລາຄາ",
                                                    color: color_3c4,
                                                    fontSize: 19,
                                                  ),
                                                  SizedBox(width: 1.h),
                                                  const TextFont(
                                                    text: "8,900,000",
                                                    color: color_3c4,
                                                    fontSize: 24,
                                                  ),
                                                  SizedBox(width: 1.h),
                                                  const TextFont(
                                                    text: " ກີບ",
                                                    color: color_3c4,
                                                    fontSize: 19,
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  Container(
                                                    width: 6.w,
                                                    height: 6.w,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: color_ef8,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        vertical: 0,
                                                        horizontal: 4,
                                                      ),
                                                      child: SvgPicture.asset(
                                                        MyIcon.minus,
                                                        color: cr_fff,
                                                      ),
                                                    ),
                                                  ),
                                                  const Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 4,
                                                    ),
                                                    child: TextFont(
                                                      text: " 4 ",
                                                      color: color_3c4,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 6.w,
                                                    height: 6.w,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: color_ef8,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        vertical: 0,
                                                        horizontal: 4,
                                                      ),
                                                      child: SvgPicture.asset(
                                                        MyIcon.plus,
                                                        color: cr_fff,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
