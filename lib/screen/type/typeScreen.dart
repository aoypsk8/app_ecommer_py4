import 'package:final_flutter_ewallet/controller/productController.dart';
import 'package:final_flutter_ewallet/screen/type/models/productTypemodel.dart';
import 'package:final_flutter_ewallet/screen/type/typeSearchScreen.dart';
import 'package:final_flutter_ewallet/screen/widgets/pull_refresh.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';

class TypeScreen extends StatefulWidget {
  const TypeScreen({super.key});

  @override
  State<TypeScreen> createState() => _TypeScreenState();
}

class _TypeScreenState extends State<TypeScreen> {
  final prodcutController = Get.find<ProductController>();
  RefreshController refreshController = RefreshController();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: cr_fff,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextFont(
                  text: "ປະເພດ",
                  color: color_3c4,
                  fontSize: 26,
                  fontWeight: FontWeight.w500,
                ),
                const TextFont(
                  text: "ປະເພດຂອງໂທລະສັບ",
                  color: color_3c4,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: PullRefresh(
                    bg: color_fff,
                    refreshController: refreshController,
                    onRefresh: () {
                      // userController.fetchhistory();
                      prodcutController.fetchProductType();
                      refreshController.refreshCompleted();
                    },
                    child: ListView.builder(
                      itemCount: prodcutController.productType.length,
                      itemBuilder: (context, index) {
                        return cardType(prodcutController.productType[index]);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cardType(ProductTypeModel productType) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: InkWell(
        onTap: () {
          prodcutController.fetchProductByType(productType.productTypeId);
          Get.to(TypeSearchScreen(
            prodcutController: prodcutController,
            title: productType.productTypeName,
          ));
          // print(productType.productTypeId);
        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: color_f0e,
            borderRadius: BorderRadiusDirectional.circular(10),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(62, 93, 93, 93),
                spreadRadius: 0,
                blurRadius: 3,
                offset: Offset(4, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 15.w,
                      width: 17.w,
                      child: Image.network(
                        productType.img,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 20),
                    TextFont(
                      text: productType.productTypeName,
                      color: color_3c4,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                SvgPicture.asset(
                  MyIcon.arrow_right,
                  width: 10,
                  height: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
