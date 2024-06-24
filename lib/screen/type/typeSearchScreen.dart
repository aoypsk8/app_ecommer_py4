import 'package:easy_localization/easy_localization.dart';
import 'package:final_flutter_ewallet/controller/productController.dart';
import 'package:final_flutter_ewallet/screen/product/models/productModel.dart';
import 'package:final_flutter_ewallet/screen/product/productdetailScreen.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class TypeSearchScreen extends StatefulWidget {
  const TypeSearchScreen(
      {super.key, required this.prodcutController, required this.title});
  final ProductController prodcutController;
  final String title;
  @override
  State<TypeSearchScreen> createState() => _TypeSearchScreenState();
}

class _TypeSearchScreenState extends State<TypeSearchScreen> {
  final fn = NumberFormat("#,###", "en_US");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFont(
          text: widget.title,
          color: color_3c4,
          fontSize: 26,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Obx(
        () => SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 3.w,
                    mainAxisSpacing: 3.w,
                    childAspectRatio: 0.65,
                  ),
                  itemCount: widget.prodcutController.productByType.length,
                  itemBuilder: (context, index) {
                    return allCard(
                        widget.prodcutController.productByType[index]);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget allCard(ProductModel product) {
    return InkWell(
      onTap: () => Get.to(ProductDetailScreen(product: product)),
      child: Container(
        decoration: BoxDecoration(
          color: color_f1f,
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        child: Padding(
          padding: EdgeInsets.all(3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 20.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),
                child: Image.network(
                  product.productImg,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 2.h),
              TextFont(
                text: product.productName,
                color: color_3c4,
                fontSize: 14,
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  TextFont(
                    text: fn.format(int.parse(product.price)),
                    color: color_3c4,
                    fontSize: 14,
                  ),
                  const TextFont(
                    text: "ກີບ",
                    color: color_3c4,
                    fontSize: 14,
                  ),
                ],
              ),
              SizedBox(height: 1.h),
            ],
          ),
        ),
      ),
    );
  }
}
