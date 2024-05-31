import 'package:final_flutter_ewallet/screen/widgets/btn.dart';
import 'package:final_flutter_ewallet/screen/widgets/formField.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  bool show = false;
  @override
  Widget build(BuildContext context) {
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;

    doLogin() {
      Get.offAndToNamed("/nav");
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(2.00, -2.00),
            end: const Alignment(2, 2),
            colors: [color_ffa.withOpacity(0.9), color_ee4],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: 0,
              top: 0,
              bottom: isKeyboardVisible ? 250 : 450,
              child: Opacity(
                opacity: 0.5,
                child: SvgPicture.asset(
                  MyIcon.bg_gradient2,
                  fit: BoxFit.fill,
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
                            height: 170,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: cr_fff,
                            ),
                            child: Image.asset(MyIcon.logo),
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
                                  topLeft: Radius.circular(50),
                                  topRight: Radius.circular(50),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(30.0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Row(
                                        children: [
                                          TextFont(
                                            text: "ໂອໂມບາຍ",
                                            color: color_ff7,
                                            fontSize: 26,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          const SizedBox(width: 5),
                                          TextFont(
                                            text: "ຍີນດີຕ້ອນຮັບ ! ",
                                            color: color_3c4,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                      const TextFont(
                                        text:
                                            "ກະລຸນາປ້ອນຂໍ້ມູນເພື່ອເຂົ້າສູ່ລະບົບ",
                                        color: color_636,
                                        fontSize: 15,
                                      ),
                                      const SizedBox(height: 35),
                                      const TextFont(
                                        text: "ເບີໂທລະສັບ",
                                        color: color_636,
                                        fontSize: 15,
                                      ),
                                      const SizedBox(height: 5),
                                      buildFormField(
                                        controller: _numberController,
                                        hinText: "ປ້ອນເບີໂທລະສັບ",
                                        hintTextColor:
                                            color_636.withOpacity(0.4),
                                        hintTextInputColor: color_636,
                                        // color: cr_red,
                                      ),
                                      const SizedBox(height: 15),
                                      const TextFont(
                                        text: "ລະຫັດຜ່ານ",
                                        color: color_636,
                                        fontSize: 15,
                                      ),
                                      const SizedBox(height: 5),
                                      buildFormField(
                                        controller: _passWordController,
                                        hinText: "ປ້ອນລະຫັດຜ່ານ",
                                        hintTextColor:
                                            color_636.withOpacity(0.4),
                                        obscureText: !show,
                                        hintTextInputColor: color_636,
                                        suffixonTapFuc: () {
                                          setState(() {
                                            show = !show;
                                          });
                                        },
                                        suffixIcon: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: show == true
                                              ? SvgPicture.asset(
                                                  MyIcon.eye,
                                                  color: color_636,
                                                  fit: BoxFit.contain,
                                                )
                                              : SvgPicture.asset(
                                                  color: color_636,
                                                  MyIcon.close_eye,
                                                  fit: BoxFit.contain,
                                                ),
                                        ),
                                      ),
                                      const SizedBox(height: 80),
                                      Btn(
                                        color: color_ff7.withOpacity(0.8),
                                        borderColor: cr_fff,
                                        func: () {
                                          doLogin();
                                        },
                                        text: "Login",
                                        radius: 100,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const TextFont(
                                            text: "ທ່ານຍັງບໍ່ມີບັນຊີແມ່ນບໍ່ ? ",
                                            color: color_3c4,
                                            fontSize: 13,
                                          ),
                                          const SizedBox(width: 5),
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed("/register");
                                            },
                                            child: const TextFont(
                                              text: "ລົງທະບຽນ",
                                              color: color_ff7,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
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
                      ],
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget scanQR() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color_2c7,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(MyIcon.scan),
            const SizedBox(width: 5),
            const TextFont(
              text: 'scan',
              fontWeight: FontWeight.w500,
              color: color_fff,
              fontSize: 16,
            ),
          ],
        ),
      ),
    );
  }
}
