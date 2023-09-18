import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'LoginController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Column(
            children: [
              44.heightBox,
              Container(
                alignment: Alignment.center,
                child: CustomeTextStyle(
                  text: "SIGN IN",
                  size: 13,
                  fontWeight: FontWeight.w700,
                  color: CustomAppColors.lblDarkColor,
                  wordSpacing: 1,
                ),
              ),
              46.heightBox,
              Container(
                alignment: Alignment.center,
                width: (MediaQuery.of(context).size.width - 48),
                child: CustomeTextStyle(
                  text: "WELCOME",
                  size: 13,
                  fontWeight: FontWeight.w700,
                  color: CustomAppColors.lblDarkColor,
                  wordSpacing: 4,
                ),
              ),
              24.heightBox,
              Container(
                width: 69,
                height: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.appLogo),
                  ),
                ),
              ),
              24.heightBox,
              Container(
                width: (MediaQuery.of(context).size.width - 48),
                height: 120,
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Center(
                      child: CustomeTextStyle(
                        text: "Sign up for the",
                        size: 28,
                        fontWeight: FontWeight.w600,
                        color: CustomAppColors.lblDarkColor,
                        wordSpacing: 0.5,
                      ),
                    ),
                    Center(
                      child: CustomeTextStyle(
                        text: "Best Shopping",
                        size: 28,
                        fontWeight: FontWeight.w600,
                        color: CustomAppColors.lblOrgColor,
                        wordSpacing: 0.5,
                      ),
                    ),
                    Center(
                      child: CustomeTextStyle(
                        text: "Experience",
                        size: 28,
                        fontWeight: FontWeight.w600,
                        color: CustomAppColors.lblOrgColor,
                        wordSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ),
              32.heightBox,
              Container(
                child: Row(
                  children: [
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        print('Click To Select Country');
                      },
                      child: Container(
                        width: 84,
                        height: 56,
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: CustomAppColors.borderColor),
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                        child: Row(
                          children: [
                            CustomeTextStyle(
                              text: "+ 91",
                              size: 16,
                              fontWeight: FontWeight.normal,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 0.5,
                            ),
                            5.widthBox,
                            Image.asset(
                              AppImages.DownArrowIcon,
                              height: 20,
                              width: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 8,
                      height: 56,
                      color: Colors.white,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: 84,
                        height: 56,
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: CustomAppColors.borderColor),
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 11),
                            filled: true,
                            fillColor: CustomAppColors.appWhiteColor,
                            // border: OutlineInputBorder(),
                            hintStyle: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: CustomAppColors.txtPlaceholderColor,
                              wordSpacing: 1,
                              height: 1.5,
                            ),
                            border: InputBorder.none,
                            hintText: 'Enter your phone number',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              32.heightBox,
              RoundedButton(
                btnName: 'Sign In',
                btnBGColor: Colors.transparent,
                btnStyle: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: CustomAppColors.appWhiteColor,
                  wordSpacing: 1,
                  height: 1.2,
                ),
                callback: () {
                  print('Click Get Start');
                },
              ).h(56),
            ],
          ),
        ),
      ),
    );
  }
}
