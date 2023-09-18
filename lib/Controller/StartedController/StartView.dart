import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'StartController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';

class StartView extends GetView<StartController> {
  const StartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 72,
            ),
            Container(
              height: 57,
              width: 284,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.WSKartIcon),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              height: 54,
            ),
            Container(
              width: (MediaQuery.of(context).size.width - 48),
              height: 204,
              // color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: CustomeTextStyle(
                      text: "wskart",
                      size: 56,
                      fontWeight: FontWeight.w700,
                      color: CustomAppColors.lblOrgColor,
                      wordSpacing: 0,
                    ),
                  ),
                  Center(
                    child: CustomeTextStyle(
                      text: "enjoy",
                      size: 56,
                      fontWeight: FontWeight.w700,
                      color: CustomAppColors.lblDarkColor,
                      wordSpacing: 0,
                    ),
                  ),
                  Center(
                    child: CustomeTextStyle(
                      text: "shopping",
                      size: 56,
                      fontWeight: FontWeight.w700,
                      color: CustomAppColors.lblDarkColor,
                      wordSpacing: 0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 54,
            ),
            RoundedButton(
              btnName: 'Get Started',
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
                controller.GetStarted();
              },
            ).px(40).h(56),
            SizedBox(
              height: 55,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 292,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.StartIcon),
                  fit: BoxFit.cover,
                ),
              ),
              alignment: Alignment.bottomCenter,
            ),
          ],
        ),
      ),
    );
  }
}
