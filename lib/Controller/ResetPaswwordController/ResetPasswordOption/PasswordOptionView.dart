import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'PasswordOptionController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';

class PasswordOptionView extends GetView<PasswordOptionController> {
  const PasswordOptionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            children: [
              44.heightBox,
              Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Image.asset(AppImages.BackIcon),
                          iconSize: 28,
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: CustomeTextStyle(
                      text: "Reset password",
                      size: 13,
                      fontWeight: FontWeight.w700,
                      color: CustomAppColors.lblDarkColor,
                      wordSpacing: 1,
                    ),
                  ),
                ],
              ),
              44.heightBox,
              Container(
                width: 124,
                height: 92,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.appLogo),
                  ),
                ),
              ),
              44.heightBox,
              InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  print('Email Password');
                },
                child: Card(
                  color: CustomAppColors.cardBGColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    child: Row(
                      children: [
                        Container(
                          height: 56,
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            children: [
                              Image.asset(
                                AppImages.MailIcon,
                                height: 24,
                                width: 24,
                              ),
                            ],
                          ),
                        ),
                        10.widthBox,
                        Container(
                          height: 56,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            child: CustomeTextStyle(
                              text: "Reset password through Email",
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              16.heightBox,
              InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  print('Phone Password');
                  controller.PhoneResetPassword();
                },
                child: Card(
                  color: CustomAppColors.cardBGColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    child: Row(
                      children: [
                        Container(
                          height: 56,
                          padding: const EdgeInsets.only(left: 16),
                          child: Row(
                            children: [
                              Image.asset(
                                AppImages.PhoneIcon,
                                height: 24,
                                width: 24,
                              ),
                            ],
                          ),
                        ),
                        10.widthBox,
                        Container(
                          height: 56,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 18),
                            child: CustomeTextStyle(
                              text: "Reset password through Phone",
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              32.heightBox,
              Container(
                width: MediaQuery.of(context).size.width - 48,
                height: 1,
                color: CustomAppColors.borderColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
