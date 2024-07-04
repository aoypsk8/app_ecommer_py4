// ignore_for_file: sort_child_properties_last, avoid_unnecessary_containers

import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:easy_localization/easy_localization.dart';
import 'package:final_flutter_ewallet/controller/orderController.dart';
import 'package:final_flutter_ewallet/controller/productController.dart';
import 'package:final_flutter_ewallet/screen/product/models/productModelOrder.dart';
import 'package:final_flutter_ewallet/screen/widgets/custom.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/helper/dialog_helper.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scroll_screenshot/scroll_screenshot.dart';
import 'package:sizer/sizer.dart';

class ResultBillScreen extends StatefulWidget {
  const ResultBillScreen({super.key, this.view = false});
  final bool? view;

  @override
  State<ResultBillScreen> createState() => _ResultBillScreenState();
}

class _ResultBillScreenState extends State<ResultBillScreen> {
  final prodcutController = Get.find<ProductController>();
  final orderController = Get.find<OrderController>();

  final fn = NumberFormat("#,###", "en_US");

  String getFormattedOrderDate(orderDate) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy HH:mm:ss');
    return formatter.format(orderDate);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _captureAndSaveScreenshot();
    });
  }

  final GlobalKey _globalKey = GlobalKey();
  Future<void> _captureAndSaveScreenshot() async {
    try {
      String? base64String =
          await ScrollScreenshot.captureAndSaveScreenshot(_globalKey);
      if (base64String != null) {
        Uint8List imageBytes = base64Decode(base64String);
        // Get application documents directory
        final directory = await getApplicationDocumentsDirectory();
        final String imagePath =
            '${directory.path}/screenshot_${DateTime.now().millisecondsSinceEpoch}.jpg';
        // Save bytes as a file
        File imageFile = File(imagePath);
        await imageFile.writeAsBytes(imageBytes);
        // Save file to gallery
        await GallerySaver.saveImage(imageFile.path);

        DialogHelper.showSuccessDialog(description: 'ບັນທືກສຳເລັດ');
      }
    } catch (e) {
      print('Screenshot capture error: $e');
      DialogHelper.showErrorDialog(description: 'ເກີດຂໍ້ຜິດພາດ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        // ignore: deprecated_member_use
        child: WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            body: Container(
              color: const Color(0xffD2D3D5),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(158, 255, 255, 255),
                      Color.fromARGB(123, 203, 203, 203),
                    ],
                  ),
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: RepaintBoundary(
                      key: _globalKey,
                      child: Container(
                        color: const Color(0xffD2D3D5),
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(158, 255, 255, 255),
                                Color.fromARGB(123, 203, 203, 203),
                              ],
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                buildTextSuccess(),
                                const SizedBox(
                                  height: 16,
                                ),
                                ClipPath(
                                  clipper: MyCustomClipper(),
                                  child: Container(
                                    padding: const EdgeInsets.only(top: 40),
                                    width: Get.width,
                                    height: 30,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 34),
                                    decoration: const BoxDecoration(
                                      color: color_fff,
                                    ),
                                  ),
                                ),
                                ClipPath(
                                  clipper: TriangleClipper(),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 34),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(7.0)),
                                      color: color_fff,
                                    ),
                                    width: Get.width,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          child: Column(
                                            children: [
                                              TextFont(
                                                text: getFormattedOrderDate(
                                                        orderController
                                                            .dateOrder)
                                                    .toString(),
                                                fontSize: 12,
                                                color: color_2d3,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Container(
                                                height: 200,
                                                color: cr_red,
                                                child: Image.network(
                                                  orderController
                                                      .imageOrder.value,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const TextFont(
                                                      text: 'ລາຍລະອຽດ',
                                                      fontSize: 15,
                                                      color: color_2d3,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          width: 1,
                                                          color: color_636
                                                              .withOpacity(0.4),
                                                        ),
                                                        borderRadius:
                                                            BorderRadiusDirectional
                                                                .circular(5),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(12.0),
                                                        child: Column(
                                                          children: [
                                                            Column(
                                                              children:
                                                                  List.generate(
                                                                orderController
                                                                    .productOrders
                                                                    .length,
                                                                (index) => listC(
                                                                    orderController
                                                                            .productOrders[
                                                                        index]),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                height: 50),
                                                            const Divider(
                                                              thickness: sqrt2,
                                                              color: Color
                                                                  .fromARGB(67,
                                                                      0, 0, 0),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      vertical:
                                                                          10),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  const TextFont(
                                                                    text:
                                                                        "ຍອດລວມ : ",
                                                                    color:
                                                                        color_636,
                                                                    fontSize:
                                                                        20,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      TextFont(
                                                                        text: fn.format(int.parse(orderController
                                                                            .totalOrder
                                                                            .value)),
                                                                        color:
                                                                            color_636,
                                                                        fontSize:
                                                                            20,
                                                                      ),
                                                                      const TextFont(
                                                                        text:
                                                                            " ກີບ",
                                                                        color:
                                                                            color_636,
                                                                        fontSize:
                                                                            15,
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
                                                    const SizedBox(height: 20),
                                                    buildPaymentAmount(),
                                                    const SizedBox(height: 20),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                InkWell(
                                  onTap: () {
                                    Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      _captureAndSaveScreenshot();
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 34),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    decoration: ShapeDecoration(
                                      color: Colors.white.withOpacity(0.6),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const TextFont(
                                          text: 'ແບ່ງບັນ',
                                          color: color_636,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                        ),
                                        const SizedBox(width: 10),
                                        SvgPicture.asset(
                                          MyIcon.ic_share,
                                          fit: BoxFit.cover,
                                          color: color_636,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                InkWell(
                                  onTap: () async {
                                    if (widget.view == true) {
                                      Get.back();
                                    } else {
                                      await prodcutController.RefetchProduct();
                                      await prodcutController
                                          .RefetchNewProduct();
                                      Get.offAndToNamed("/nav");
                                    }
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 34),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    decoration: ShapeDecoration(
                                      color: color_777,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                    ),
                                    child: const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
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
          text: 'ການໂອນເງີນສຳເລັດ',
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
        color: color_f0e,
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
                  color: color_3c4,
                  fontWeight: FontWeight.w700,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      TextFont(
                        text: fn.format(
                            int.parse(orderController.totalOrder.value)),
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: color_3c4,
                      ),
                      const SizedBox(width: 5),
                      const TextFont(
                        text: 'ກີບ',
                        fontWeight: FontWeight.w500,
                        color: color_3c4,
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

  Widget listC(ProductOrderModel orderItem) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFont(
              text: orderItem.productName,
              color: color_636,
              fontSize: 15,
            ),
            TextFont(
              text: orderItem.quantity,
              color: color_636,
              fontSize: 13,
            ),
            TextFont(
              text: "${fn.format(int.parse(orderItem.price.toString()))} ກີບ",
              color: color_636,
              fontSize: 14,
            ),
            const TextFont(
              text: "/ ອັນ",
              color: color_636,
              fontSize: 13,
            ),
          ],
        ),
        const Divider(
          thickness: sqrt2,
          color: Color.fromARGB(67, 0, 0, 0),
        ),
      ],
    );
  }
}
