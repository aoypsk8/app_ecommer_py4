import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:final_flutter_ewallet/controller/orderController.dart';
import 'package:final_flutter_ewallet/screen/product/models/orderModel.dart';
import 'package:final_flutter_ewallet/screen/widgets/formatTime.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HistoryBuyScreen extends StatefulWidget {
  const HistoryBuyScreen({super.key});

  @override
  State<HistoryBuyScreen> createState() => _HistoryBuyScreenState();
}

class _HistoryBuyScreenState extends State<HistoryBuyScreen> {
  final orderController = Get.find<OrderController>();
  final fn = NumberFormat("#,###", "en_US");
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: cr_fff,
        body: Column(
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
                                text: "ປະຫວັດການສັ່ງຊື້",
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const TextFont(
                            text: "ການເຄື່ອນໄຫວທັງໝົດ",
                            color: color_636,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 20),
                          Column(
                            children: List.generate(
                              orderController.orders.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: cardHis(orderController.orders[index]),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardHis(OrderModel order) {
    return InkWell(
      onTap: () {
        orderController.fetchOrderByIdOnly(order.orderId);
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: color_14b,
                        borderRadius: BorderRadiusDirectional.circular(5)),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: SvgPicture.asset(MyIcon.correct),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TextFont(
                            text: "ລະຫັດ : ${order.orderId} ",
                            color: color_636,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          TextFont(
                            text: order.status == 0
                                ? " ກຳລັງດຳເນີນການ"
                                : " ສຳເລັດ",
                            color: order.status == 0 ? color_ffa : color_14b,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      TextFont(
                        text: order.getFormattedOrderDate(),
                        color: color_999,
                        fontSize: 15,
                      ),
                    ],
                  ),
                ],
              ),
              TextFont(
                text: "${fn.format(order.total)} ກີບ",
                color: color_636,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          const Divider(
            thickness: sqrt2,
            color: Color.fromARGB(22, 0, 0, 0),
          ),
        ],
      ),
    );
  }
}
