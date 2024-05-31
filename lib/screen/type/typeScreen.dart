import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class TypeScreen extends StatefulWidget {
  const TypeScreen({super.key});

  @override
  State<TypeScreen> createState() => _TypeScreenState();
}

class _TypeScreenState extends State<TypeScreen> {
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
                  Column(
                    children: List.generate(10, (index) => cardType()),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cardType() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: color_f0e,
          borderRadius: BorderRadiusDirectional.circular(10),
          boxShadow: [
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
                children: [
                  Container(
                    height: 15.w,
                    child: Image.asset(MyIcon.mobile),
                  ),
                  const TextFont(
                    text: "iPhone",
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
    );
  }
}
