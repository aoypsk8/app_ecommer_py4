import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
      body: SafeArea(
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
                  Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 20.w,
                            width: 20.w,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadiusDirectional.circular(15),
                              color: color_f1f,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFont(
                                text: "iPhone 16 Pro Max",
                                color: color_3c4,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                              TextFont(
                                text: "example text  Lorem Ipsum...",
                                color: color_636,
                                fontSize: 12,
                              ),
                              Row(
                                children: [
                                  Row(
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
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1,
                                            color: color_d9d9,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 8,
                                            horizontal: 4,
                                          ),
                                          child: SvgPicture.asset(MyIcon.minus),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
