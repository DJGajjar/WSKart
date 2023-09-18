import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'SplashController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: CustomAppColors.appBGColor,
        child: Center(
          child: Container(
            width: 142,
            height: 108,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.appLogo),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
