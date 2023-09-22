import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../../ExtraClass/Routes/AppPages.dart';
import 'ProfileSearchController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ProfileSearchView extends GetView<ProfileSearchController> {
  const ProfileSearchView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: CustomeTextStyle(
          text: "Setting",
          size: 16,
          fontWeight: FontWeight.w600,
          color: CustomAppColors.lblDarkColor,
          wordSpacing: 0.5,
        ),
        leading: GestureDetector(
          onTap: () {
            print('Click Back Button');
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Image.asset(AppImages.BackIcon),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              AppImages.ProfileAvtar,
              fit: BoxFit.contain,
              height: 38,
              width: 38,
            ),
            // Icon(Icons.person),
            onPressed: () {
              print('Profile Click');
              Get.toNamed(Routes.MYPROFILEROUTES);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                22.heightBox,
                Container(
                  height: 1,
                  width: (MediaQuery.of(context).size.width - 48),
                  color: CustomAppColors.borderColor,
                ),
                32.heightBox,
                Container(
                  height: 112,
                  width: MediaQuery.of(context).size.width - 48,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 48,
                        child: CustomeTextStyle(
                          text: "Real-time notification",
                          size: 18,
                          fontWeight: FontWeight.w600,
                          color: CustomAppColors.lblDarkColor,
                          wordSpacing: 0.5,
                        ),
                      ),
                      20.heightBox,
                      Container(
                        height: 24,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => FlutterSwitch(
                                activeColor: CustomAppColors.switchOrgColor,
                                inactiveColor:
                                    CustomAppColors.txtPlaceholderColor,
                                width: 40.0,
                                height: 24.0,
                                toggleSize: 16.0,
                                toggleColor: CustomAppColors.lblOrgColor,
                                inactiveToggleColor:
                                    CustomAppColors.borderColor,
                                value: controller.notificationOnOff.value,
                                borderRadius: 12.0,
                                padding: 3.0,
                                showOnOff: false,
                                onToggle: (val) {
                                  controller.notificationOnOff.value =
                                      !controller.notificationOnOff.value;
                                  print(
                                      'Value OF Swift: ${controller.notificationOnOff.value}');
                                  // setState(() {
                                  //   status = val;
                                  // });
                                },
                              ),
                            ),
                            16.widthBox,
                            Container(
                              child: CustomeTextStyle(
                                text: "Enable real-time notification",
                                size: 15,
                                fontWeight: FontWeight.w500,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                            )
                          ],
                        ),
                      ),
                      20.heightBox,
                      Container(
                        height: 24,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => FlutterSwitch(
                                activeColor: CustomAppColors.switchOrgColor,
                                inactiveColor:
                                    CustomAppColors.txtPlaceholderColor,
                                width: 40.0,
                                height: 24.0,
                                toggleSize: 16.0,
                                toggleColor: CustomAppColors.lblOrgColor,
                                inactiveToggleColor:
                                    CustomAppColors.borderColor,
                                value: controller.soundOnOff.value,
                                borderRadius: 12.0,
                                padding: 3.0,
                                showOnOff: false,
                                onToggle: (val) {
                                  controller.soundOnOff.value =
                                      !controller.soundOnOff.value;
                                  print(
                                      'Value OF Sound: ${controller.soundOnOff.value}');
                                  // setState(() {
                                  //   status = val;
                                  // });
                                },
                              ),
                            ),
                            16.widthBox,
                            Container(
                              child: CustomeTextStyle(
                                text: "Sound",
                                size: 15,
                                fontWeight: FontWeight.w500,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                32.heightBox,
                Container(
                  height: 1,
                  width: (MediaQuery.of(context).size.width - 48),
                  color: CustomAppColors.borderColor,
                ),
                32.heightBox,
                Container(
                  height: 68,
                  width: MediaQuery.of(context).size.width - 48,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 48,
                        child: CustomeTextStyle(
                          text: "Two factor authentication",
                          size: 18,
                          fontWeight: FontWeight.w600,
                          color: CustomAppColors.lblDarkColor,
                          wordSpacing: 0.5,
                        ),
                      ),
                      20.heightBox,
                      Container(
                        height: 24,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => FlutterSwitch(
                                activeColor: CustomAppColors.switchOrgColor,
                                inactiveColor:
                                    CustomAppColors.txtPlaceholderColor,
                                width: 40.0,
                                height: 24.0,
                                toggleSize: 16.0,
                                toggleColor: CustomAppColors.lblOrgColor,
                                inactiveToggleColor:
                                    CustomAppColors.borderColor,
                                value: controller.soundOnOff.value,
                                borderRadius: 12.0,
                                padding: 3.0,
                                showOnOff: false,
                                onToggle: (val) {
                                  controller.soundOnOff.value =
                                      !controller.soundOnOff.value;
                                  print(
                                      'Value OF Sound: ${controller.soundOnOff.value}');
                                  // setState(() {
                                  //   status = val;
                                  // });
                                },
                              ),
                            ),
                            16.widthBox,
                            Container(
                              child: CustomeTextStyle(
                                text: "Recommended turn on",
                                size: 15,
                                fontWeight: FontWeight.w500,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                20.heightBox,
                Container(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                            text:
                                "To help keep your account secure, we'll ask you to submit a code when using a new device to log in. We'll send the code via SMS, email, or app’s notification.",
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 15,
                              color: CustomAppColors.lblColor,
                              wordSpacing: 0.5,
                              height: 1.2,
                            )),
                      ],
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                32.heightBox,
                Container(
                  height: 1,
                  width: (MediaQuery.of(context).size.width - 48),
                  color: CustomAppColors.borderColor,
                ),
                32.heightBox,
                Container(
                  height: 152,
                  width: MediaQuery.of(context).size.width - 48,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 48,
                        child: CustomeTextStyle(
                          text: "Connect devices",
                          size: 18,
                          fontWeight: FontWeight.w600,
                          color: CustomAppColors.lblDarkColor,
                          wordSpacing: 0.5,
                        ),
                      ),
                      20.heightBox,
                      Container(
                        height: 24,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => FlutterSwitch(
                                activeColor: CustomAppColors.switchOrgColor,
                                inactiveColor:
                                    CustomAppColors.txtPlaceholderColor,
                                width: 40.0,
                                height: 24.0,
                                toggleSize: 16.0,
                                toggleColor: CustomAppColors.lblOrgColor,
                                inactiveToggleColor:
                                    CustomAppColors.borderColor,
                                value: controller.notificationOnOff.value,
                                borderRadius: 12.0,
                                padding: 3.0,
                                showOnOff: false,
                                onToggle: (val) {
                                  controller.notificationOnOff.value =
                                      !controller.notificationOnOff.value;
                                  print(
                                      'Value OF Swift: ${controller.notificationOnOff.value}');
                                  // setState(() {
                                  //   status = val;
                                  // });
                                },
                              ),
                            ),
                            16.widthBox,
                            Container(
                              child: CustomeTextStyle(
                                text: "Chrome 98, Android",
                                size: 15,
                                fontWeight: FontWeight.w500,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                            )
                          ],
                        ),
                      ),
                      20.heightBox,
                      Container(
                        height: 24,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Obx(
                              () => FlutterSwitch(
                                activeColor: CustomAppColors.switchOrgColor,
                                inactiveColor:
                                    CustomAppColors.txtPlaceholderColor,
                                width: 40.0,
                                height: 24.0,
                                toggleSize: 16.0,
                                toggleColor: CustomAppColors.lblOrgColor,
                                inactiveToggleColor:
                                    CustomAppColors.borderColor,
                                value: controller.soundOnOff.value,
                                borderRadius: 12.0,
                                padding: 3.0,
                                showOnOff: false,
                                onToggle: (val) {
                                  controller.soundOnOff.value =
                                      !controller.soundOnOff.value;
                                  print(
                                      'Value OF Sound: ${controller.soundOnOff.value}');
                                  // setState(() {
                                  //   status = val;
                                  // });
                                },
                              ),
                            ),
                            16.widthBox,
                            Container(
                              child: CustomeTextStyle(
                                text: "Mobile IOS 11, iPhone",
                                size: 15,
                                fontWeight: FontWeight.w500,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                32.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
