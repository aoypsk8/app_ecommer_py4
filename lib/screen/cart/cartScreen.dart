import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:final_flutter_ewallet/controller/cartController.dart';
import 'package:final_flutter_ewallet/controller/orderController.dart';
import 'package:final_flutter_ewallet/screen/cart/models/cartModel.dart';
import 'package:final_flutter_ewallet/screen/cart/paymentScreen.dart';
import 'package:final_flutter_ewallet/screen/widgets/btn.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:keyboard_attachable/keyboard_attachable.dart';
import 'package:sizer/sizer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartController = Get.find<CartController>();
  final fn = NumberFormat('#,###', 'en_US');

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: FooterLayout(
          footer: Container(
            height: MediaQuery.of(context).size.height - 83.h,
            color: cr_fff,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const TextFont(
                          text: "ຍອດລວມ",
                          color: color_ef8,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                        if (cartController.carts.isNotEmpty)
                          TextFont(
                            text:
                                "${fn.format(cartController.carts.first.totalCartAmount)} ກີບ",
                            color: color_ef8,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                      ],
                    ),
                  ),
                  Btn(
                    func: () {
                      // print(cartController.carts.length);
                      // print(cartController.carts.first.products.length);
                      Get.lazyPut(() => OrderController());
                      Get.to(PaymentScreen());
                    },
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
                      if (cartController.carts.isNotEmpty)
                        Column(
                          children: cartController.carts.isNotEmpty
                              ? List.generate(
                                  cartController.carts.first.products.length,
                                  (index) => cartCard(cartController
                                      .carts.first.products[index]),
                                )
                              : [
                                  const Center(
                                    child: TextFont(
                                      text: "ບໍ່ມີສິນຄ້າໃນກະຕ່າ",
                                      color: Colors.grey,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cartCard(ProductCart cartItem) {
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
                    ),
                    child: ClipRRect(
                      child: Image.network(
                        cartItem.productImg.toString(),
                        fit: BoxFit.cover,
                      ),
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
                                TextFont(
                                  text: cartItem.productName,
                                  color: color_3c4,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                                InkWell(
                                    onTap: () {
                                      cartController.deleteProductInsideCart(
                                          cartItem.productId);
                                      setState(() {});
                                    },
                                    child: SvgPicture.asset(MyIcon.x)),
                              ],
                            ),
                            TextFont(
                              text: cartItem.description,
                              color: color_636,
                              fontSize: 12,
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                TextFont(
                                  text: fn.format(int.parse(cartItem.price)),
                                  color: color_3c4,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                ),
                                const TextFont(
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
                                InkWell(
                                  onTap: () {
                                    //-
                                    cartController
                                        .decreaseQuantity(cartItem.productId);
                                    setState(() {});
                                  },
                                  child: Container(
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 2,
                                  ),
                                  child: TextFont(
                                    text: " ${cartItem.amount} ",
                                    color: color_3c4,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    //+
                                    cartController
                                        .increaseQuantity(cartItem.productId);
                                    setState(() {});
                                  },
                                  child: Container(
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
