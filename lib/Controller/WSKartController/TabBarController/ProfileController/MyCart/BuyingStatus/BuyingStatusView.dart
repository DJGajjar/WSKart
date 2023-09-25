import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'BuyingStatusController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:ui';
import 'package:badges/src/badge.dart' as badge;

class BuyingStatusView extends GetView<BuyingStatusController> {
  const BuyingStatusView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    var screenSize = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (screenSize.height - kToolbarHeight - 24) / 2;
    final double itemWidth = screenSize.width / 2;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: CustomeTextStyle(
          text: "",
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
            // child: Image.asset(AppImages.BackIcon),
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              AppImages.ProfileCloseIcon,
              fit: BoxFit.contain,
              height: 28,
              width: 28,
            ),
            // Icon(Icons.person),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          10.heightBox,
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Container(
              height: 1,
              width: (MediaQuery.of(context).size.width - 48),
              color: CustomAppColors.borderColor,
            ),
          ),
          controller.isSuccessfullBuyItem.value == false
              ? Container(
                  width: (MediaQuery.of(context).size.width),
                  height: (MediaQuery.of(context).size.width + 48),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        AppImages.ProfileBuyingSucessIcon,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      280.heightBox,
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: Container(
                          child: Center(
                            child: CustomeTextStyle(
                              text: "Payment successful",
                              size: 18,
                              fontWeight: FontWeight.w600,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 24, right: 24),
                        child: Container(
                          child: Center(
                            child: CustomeTextStyle(
                              text:
                                  "Thank you for your purchase, you can visit the 'My purchase' to review your order",
                              size: 16,
                              fontWeight: FontWeight.w600,
                              color: CustomAppColors.txtPlaceholderColor,
                              wordSpacing: 0.5,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      29.heightBox,
                      Center(
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          // elevation: 16,
                          color: CustomAppColors.lblDarkColor,
                          // shadowColor: CustomAppColors.lblOrgColor,
                          child: Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                'Go My purchase',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: CustomAppColors.appWhiteColor,
                                  wordSpacing: 1,
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.end,
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ).px(12).py(2.5),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 60, left: 24, right: 24),
                  child: Container(
                    width: (MediaQuery.of(context).size.width - 48),
                    height: 294,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 111,
                            height: 96,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              // color: Colors.red,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(
                                  AppImages.ProfileBuyingFailedIcon,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: Container(
                            child: Center(
                              child: CustomeTextStyle(
                                text: "Payment failed! RS 165.86",
                                size: 18,
                                fontWeight: FontWeight.w600,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 24, right: 24),
                          child: Container(
                            height: 56,
                            child: Center(
                              child: Text(
                                "Please check your information carefully and try again, or use a different payment method.",
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: CustomAppColors.txtPlaceholderColor,
                                  wordSpacing: 0.5,
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                        29.heightBox,
                        Center(
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            // elevation: 16,
                            color: CustomAppColors.lblDarkColor,
                            // shadowColor: CustomAppColors.lblOrgColor,
                            child: Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  'Retry payment',
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: CustomAppColors.appWhiteColor,
                                    wordSpacing: 1,
                                    height: 1.2,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shadowColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ).px(12).py(2.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 24, right: 24),
            child: Container(
              height: 1,
              width: (MediaQuery.of(context).size.width - 48),
              color: CustomAppColors.borderColor,
            ),
          ),
        ],
      ),
    );
  }
}
