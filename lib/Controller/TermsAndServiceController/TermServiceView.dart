import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'TermServiceController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';

class TermServiceView extends GetView<TermServiceController> {
  const TermServiceView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Form(
            key: formGlobalKey,
            child: Column(
              children: [
                44.heightBox,
                Stack(
                  alignment: AlignmentDirectional.centerStart,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
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
                        ],
                      ),
                    ),
                  ],
                ),
                32.heightBox,
                Container(
                  alignment: Alignment.topLeft,
                  width: (MediaQuery.of(context).size.width - 48),
                  child: CustomeTextStyle(
                    text: "Version dated 19 May 2022",
                    size: 15,
                    fontWeight: FontWeight.normal,
                    color: CustomAppColors.txtPlaceholderColor,
                    wordSpacing: 4,
                  ),
                ),
                32.heightBox,
                Container(
                  alignment: Alignment.topLeft,
                  width: (MediaQuery.of(context).size.width - 48),
                  child: CustomeTextStyle(
                    text: "Term of Services",
                    size: 22,
                    fontWeight: FontWeight.w600,
                    color: CustomAppColors.lblDarkColor,
                    wordSpacing: 4,
                  ),
                ),
                16.heightBox,
                Container(
                  alignment: Alignment.topLeft,
                  width: (MediaQuery.of(context).size.width - 48),
                  child: CustomeTextStyle(
                    text: "1. Terms",
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: CustomAppColors.lblDarkColor,
                    wordSpacing: 4,
                  ),
                ),
                12.heightBox,
                Container(
                  alignment: Alignment.topLeft,
                  width: (MediaQuery.of(context).size.width - 48),
                  child: Text(
                    "Welcome to the MarThing. app. Please read these Terms of Service carefully. The following Terms of Service govern your use and access of us (as defined below) and the use of any part of the Services (as defined below). By accessing the our Platform and/or using the Services, you agree that you have read and understood the terms in these Terms of Service, which constitute a legally binding agreement between you and us (as defined below). If you do not agree to these Terms of Service, please do not access and/or use this our Platform or any part of the Services. If you use the engagement tools provided by papmall® on the papmall® Platform, the Engagement Tools Terms and Conditions (as defined below) shall apply.",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: CustomAppColors.lblColor,
                      wordSpacing: 4,
                      height: 1.2,
                    ),
                    maxLines: 15,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                16.heightBox,
                Container(
                  alignment: Alignment.topLeft,
                  width: (MediaQuery.of(context).size.width - 48),
                  child: CustomeTextStyle(
                    text: "2. Use license",
                    size: 16,
                    fontWeight: FontWeight.w600,
                    color: CustomAppColors.lblDarkColor,
                    wordSpacing: 4,
                  ),
                ),
                12.heightBox,
                Container(
                  alignment: Alignment.topLeft,
                  width: (MediaQuery.of(context).size.width - 48),
                  child: Text(
                    "Access to and use of password protected and/or secure areas of the our Platform and/or use of the Services are restricted to Customers with us User Accounts (as defined below) and must be at least 18 years old only. You must not intend to obtain unauthorized access to such parts, or to any other protected information on this our Platform and/or Services, through any means that is unallowed by us.",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.normal,
                      fontSize: 15,
                      color: CustomAppColors.lblColor,
                      wordSpacing: 4,
                      height: 1.2,
                    ),
                    maxLines: 15,
                    overflow: TextOverflow.ellipsis,
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
