import 'package:final_flutter_ewallet/screen/widgets/btn.dart';
import 'package:final_flutter_ewallet/screen/widgets/formField.dart';
import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _numberController = TextEditingController();
  String? _selectedItem;
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cr_fff,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          behavior: HitTestBehavior.opaque,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: color_3c4),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15),
                      const TextFont(
                        text: "ລົງທະບຽນ ",
                        color: color_3c4,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const TextFont(
                            text: "ທ່ານມີບັນຊີແລ້ວ ?  ",
                            color: color_3c4,
                            fontSize: 13,
                          ),
                          const SizedBox(width: 5),
                          InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const TextFont(
                              text: "ເຂົ້າສູ່ລະບົບ",
                              color: color_ff7,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      const TextFont(
                        text: "ຊື່",
                        color: color_636,
                        fontSize: 15,
                      ),
                      const SizedBox(height: 5),
                      buildFormField(
                        controller: _numberController,
                        hinText: "ປ້ອນຊື່",
                        hintTextColor: color_636.withOpacity(0.4),
                        hintTextInputColor: color_636,
                        // color: cr_red,
                      ),
                      const SizedBox(height: 15),
                      const TextFont(
                        text: "ນາມສະກຸນ",
                        color: color_636,
                        fontSize: 15,
                      ),
                      const SizedBox(height: 5),
                      buildFormField(
                        controller: _numberController,
                        hinText: "ປ້ອນນາມສະກຸນ",
                        hintTextColor: color_636.withOpacity(0.4),
                        hintTextInputColor: color_636,
                      ),
                      const SizedBox(height: 5),
                      const TextFont(
                        text: "ເພດ",
                        color: color_636,
                        fontSize: 15,
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Expanded(
                            child: RadioListTile<String>(
                              title: const TextFont(
                                text: "ຊາຍ",
                                color: color_636,
                                fontSize: 15,
                              ),
                              value: 'ຊາຍ',
                              groupValue: _selectedItem,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedItem = value;
                                });
                              },
                            ),
                          ),
                          Expanded(
                            child: RadioListTile<String>(
                              title: const TextFont(
                                text: "ຍິງ",
                                color: color_636,
                                fontSize: 15,
                              ),
                              value: 'ຍິງ',
                              groupValue: _selectedItem,
                              onChanged: (String? value) {
                                setState(() {
                                  _selectedItem = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const TextFont(
                        text: "ເບີໂທລະສັບ",
                        color: color_636,
                        fontSize: 15,
                      ),
                      const SizedBox(height: 5),
                      buildFormField(
                        controller: _numberController,
                        hinText: "ປ້ອນເບີໂທລະສັບ",
                        hintTextColor: color_636.withOpacity(0.4),
                        hintTextInputColor: color_636,
                        // color: cr_red,
                      ),
                      const SizedBox(height: 5),
                      const TextFont(
                        text: "ຮູບພາບ",
                        color: color_636,
                        fontSize: 15,
                      ),
                      const SizedBox(height: 5),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: color_636.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 14.5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: TextFont(
                                  text: 'ຮູບພາບ',
                                  color: color_636,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      const TextFont(
                        text: "ບ້ານ",
                        color: color_636,
                        fontSize: 15,
                      ),
                      const SizedBox(height: 5),
                      buildFormField(
                        controller: _numberController,
                        hinText: "ປ້ອນບ້ານ",
                        hintTextColor: color_636.withOpacity(0.4),
                        hintTextInputColor: color_636,
                      ),
                      const SizedBox(height: 15),
                      const TextFont(
                        text: "ເມືອງ",
                        color: color_636,
                        fontSize: 15,
                      ),
                      const SizedBox(height: 5),
                      buildFormField(
                        controller: _numberController,
                        hinText: "ປ້ອນເມືອງ",
                        hintTextColor: color_636.withOpacity(0.4),
                        hintTextInputColor: color_636,
                      ),
                      const SizedBox(height: 15),
                      const TextFont(
                        text: "ແຂວງ",
                        color: color_636,
                        fontSize: 15,
                      ),
                      const SizedBox(height: 5),
                      buildFormField(
                        controller: _numberController,
                        hinText: "ປ້ອນແຂວງ",
                        hintTextColor: color_636.withOpacity(0.4),
                        hintTextInputColor: color_636,
                      ),
                      const SizedBox(height: 15),
                      const TextFont(
                        text: "ລະຫັດຜ່ານ",
                        color: color_636,
                        fontSize: 15,
                      ),
                      const SizedBox(height: 5),
                      buildFormField(
                        controller: _numberController,
                        hinText: "ປ້ອນລະຫັດຜ່ານ",
                        hintTextColor: color_636.withOpacity(0.4),
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
                      const SizedBox(height: 15),
                      const TextFont(
                        text: "ຢືນຢັນລະຫັດຜ່ານ",
                        color: color_636,
                        fontSize: 15,
                      ),
                      const SizedBox(height: 5),
                      buildFormField(
                        controller: _numberController,
                        hinText: "ປ້ອນຢືນຢັນລະຫັດຜ່ານ",
                        hintTextColor: color_636.withOpacity(0.4),
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
                      const SizedBox(height: 25),
                      Btn(
                        color: color_ff7.withOpacity(0.8),
                        borderColor: cr_fff,
                        func: () {},
                        text: "Register",
                        radius: 100,
                      ),
                      const Row(
                        children: [
                          TextFont(
                            text: "ການລົງທະບຽນຂອງທ່ານແມ່ນຜ່ານຕ້ອງ ",
                            color: color_3c4,
                            fontSize: 13,
                          ),
                          TextFont(
                            text: "ອ່ານຂໍ້ກຳນົດ",
                            color: color_ff7,
                            fontSize: 13,
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          TextFont(
                            text: "ແລະ ",
                            color: color_3c4,
                            fontSize: 13,
                          ),
                          TextFont(
                            text: "ນະໂຍບາຍ ",
                            color: color_ff7,
                            fontSize: 13,
                          ),
                          TextFont(
                            text: "ຂອງພວກເຮົາກ່ອນ",
                            color: color_3c4,
                            fontSize: 13,
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
