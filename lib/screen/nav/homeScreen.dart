import 'package:carousel_slider/carousel_slider.dart';
import 'package:final_flutter_ewallet/screen/product/productdetailScreen.dart';
import 'package:final_flutter_ewallet/screen/widgets/formField.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  int _current = 0;
  List fakeData = [
    {
      "title": "tranfer",
    },
    {
      "title": "qr",
    },
    {
      "title": "detail_card",
    },
    {
      "title": "check_bill",
    },
    {
      "title": "check_bill",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        behavior: HitTestBehavior.opaque,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          TextFont(
                            text: "ຫນ້າຫລັກ",
                            color: color_3c4,
                            fontSize: 26,
                            fontWeight: FontWeight.w500,
                          ),
                          SizedBox(width: 5),
                          TextFont(
                            text: "ໂອໂມບາຍ ",
                            color: color_ff7,
                            fontSize: 24,
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      buildFormField(
                        controller: _searchController,
                        hinText: "ຄົ້ນຫາ...",
                        color: color_d9d9.withOpacity(0.4),
                        hintTextColor: color_636.withOpacity(0.4),
                        hintTextInputColor: color_636,
                        typeInput: TextInputType.text,
                        radius: 10,
                        suffixonTapFuc: () {},
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(2.w),
                          child: SvgPicture.asset(
                            MyIcon.search,
                            color: color_636,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(height: 3.h),
                      slideAndPoint(),
                      SizedBox(height: 3.h),
                      const TextFont(
                        text: "ສິນຄ້າໃຫ່ມ :",
                        color: color_3c4,
                        fontSize: 17,
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      10,
                      (index) => Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: listCard(),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 3.h),
                      const TextFont(
                        text: "ສິນຄ້າທັງຫມົດ :",
                        color: color_3c4,
                        fontSize: 17,
                      ),
                      SizedBox(height: 2.h),
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 3.w,
                          mainAxisSpacing: 3.w,
                          childAspectRatio: 0.65,
                        ),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return allCard();
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget allCard() {
    return Container(
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
              child: Image.asset(
                MyIcon.mobile,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 2.h),
            const TextFont(
              text: "Iphone 15ProMax",
              color: color_3c4,
              fontSize: 14,
            ),
            SizedBox(height: 1.h),
            const Row(
              children: [
                TextFont(
                  text: "8,900,000 ",
                  color: color_3c4,
                  fontSize: 14,
                ),
                TextFont(
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
    );
  }

  Widget listCard() {
    return InkWell(
      onTap: () => Get.to(ProductDetailScreen()),
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
                width: 40.w,
                height: 20.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(5),
                ),
                child: Image.asset(
                  MyIcon.mobile,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 2.h),
              const TextFont(
                text: "Iphone 15ProMax",
                color: color_3c4,
                fontSize: 14,
              ),
              SizedBox(height: 1.h),
              const Row(
                children: [
                  TextFont(
                    text: "8,900,000 ",
                    color: color_3c4,
                    fontSize: 14,
                  ),
                  TextFont(
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

  Widget slideAndPoint() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            initialPage: 0,
            enableInfiniteScroll: true,
            viewportFraction: 1.0,
            enlargeCenterPage: false,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 4),
            autoPlayAnimationDuration: const Duration(seconds: 2),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeFactor: 0,
            height: 22.5.h,
            scrollDirection: Axis.horizontal,
            onPageChanged: ((index, reason) {
              setState(() {
                _current = index;
              });
            }),
          ),
          items: fakeData.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 1.w),
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: color_636.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 1.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Container(
                width: index == _current ? 3.w : 2.w,
                height: index == _current ? 3.w : 2.w,
                margin: EdgeInsets.only(left: 1.5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    index == _current ? 100 : 2.5.w,
                  ),
                  color: index == _current
                      ? color_ff7
                      : color_ff7.withOpacity(0.3),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
