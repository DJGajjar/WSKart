import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'ReviewOrderController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:ui';
import 'package:badges/src/badge.dart' as badge;

class ReviewOrderView extends GetView<ReviewOrderController> {
  const ReviewOrderView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    var screenSize = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (screenSize.height - kToolbarHeight - 24) / 2;
    final double itemWidth = screenSize.width / 2;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 40,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shadowColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            print('Click TO Submit Review');
            showGeneralDialog(
              context: context,
              barrierColor: Colors.black38,
              barrierLabel: 'Label',
              barrierDismissible: true,
              pageBuilder: (_, __, ___) => Center(
                child: Container(
                  color: Colors.transparent,
                  child: Container(
                    height: 332,
                    width: (screenSize.width - 48),
                    decoration: BoxDecoration(
                      color: CustomAppColors.cardBGColor,
                      border: Border.all(
                        width: 1,
                        color: CustomAppColors.lblOrgColor,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        40.heightBox,
                        Center(
                          child: Image.asset(
                            AppImages.ProfileSparkingIcon,
                            height: 80,
                            width: 80,
                          ),
                        ),
                        32.heightBox,
                        Container(
                          height: 20,
                          width: (screenSize.width - 48),
                          child: Material(
                            color: Colors.transparent,
                            child: CustomeTextStyle(
                              textAlign: TextAlign.center,
                              text: "Thank you for your feedback",
                              size: 16,
                              fontWeight: FontWeight.w600,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 4,
                            ),
                          ),
                        ),
                        20.heightBox,
                        Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: Container(
                            width: (screenSize.width - 48),
                            child: Material(
                              color: Colors.transparent,
                              child: Text(
                                "Thank you for 5-star review! Can you please specify what you liked about our app in more detail? We’re always looking to improve.",
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                  color: CustomAppColors.lblDarkColor,
                                  wordSpacing: 0.5,
                                  height: 1.2,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          child: const Center(
            child: CustomeTextStyle(
              text: "Submit",
              size: 16,
              fontWeight: FontWeight.w600,
              color: CustomAppColors.appWhiteColor,
              wordSpacing: 0.5,
            ),
          ),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: CustomeTextStyle(
          text: "Product Rating",
          size: 16,
          fontWeight: FontWeight.w600,
          color: CustomAppColors.lblDarkColor,
          wordSpacing: 0.5,
        ),
        leading: GestureDetector(),
        actions: <Widget>[
          InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              print('Click Close');
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: CustomeTextStyle(
                text: "Close",
                size: 14,
                fontWeight: FontWeight.w600,
                color: CustomAppColors.lblOrgColor,
                wordSpacing: 4,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Form(
            key: formGlobalKey,
            child: Obx(
              () => Column(
                children: [
                  32.heightBox,
                  Container(
                    height: 66,
                    width: (screenSize.width - 48),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Hero(
                          tag: 'ControllerImage',
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              width: 56,
                              height: 66,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(AppImages.HomeBestSale),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        24.widthBox,
                        Container(
                          height: 90,
                          width: (screenSize.width - 128),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomeTextStyle(
                                text: "Nike waffle debut women’s shoes",
                                size: 14,
                                fontWeight: FontWeight.w600,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 4,
                              ),
                              4.heightBox,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    child: CustomeTextStyle(
                                      text: "Black",
                                      size: 13,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          CustomAppColors.txtPlaceholderColor,
                                      wordSpacing: 4,
                                    ),
                                  ),
                                  8.widthBox,
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6),
                                    child: Container(
                                      width: 6,
                                      height: 6,
                                      decoration: const BoxDecoration(
                                        color: CustomAppColors.switchOrgColor,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(6),
                                        ),
                                      ),
                                    ),
                                  ),
                                  8.widthBox,
                                  Container(
                                    child: CustomeTextStyle(
                                      text: "Size: 44",
                                      size: 13,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          CustomAppColors.txtPlaceholderColor,
                                      wordSpacing: 4,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  32.heightBox,
                  Container(
                    height: 1,
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Expanded(child: Container()),
                        const MySeparator(
                          color: CustomAppColors.borderColor,
                        ),
                      ],
                    ),
                  ),
                  32.heightBox,
                  Container(
                    width: (screenSize.width - 48),
                    height: 28,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 4),
                          child: Container(
                            height: 28,
                            child: CustomeTextStyle(
                              text: "Rating",
                              size: 16,
                              fontWeight: FontWeight.w600,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 4,
                            ),
                          ),
                        ),
                        InkWell(
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            print('Star_1');
                            controller.isSelectStar1.value = true;
                            controller.isSelectStar2.value = false;
                            controller.isSelectStar3.value = false;
                            controller.isSelectStar4.value = false;
                            controller.isSelectStar5.value = false;
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Image.asset(
                              controller.isSelectStar1.value == true
                                  ? AppImages.ProfileSelectRatingIcon
                                  : AppImages.ProfileUnSelectRatingIcon,
                              height: 28,
                              width: 28,
                            ),
                          ),
                        ),
                        InkWell(
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            print('Star_2');
                            controller.isSelectStar1.value = true;
                            controller.isSelectStar2.value = true;
                            controller.isSelectStar3.value = false;
                            controller.isSelectStar4.value = false;
                            controller.isSelectStar5.value = false;
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Image.asset(
                              controller.isSelectStar2.value == true
                                  ? AppImages.ProfileSelectRatingIcon
                                  : AppImages.ProfileUnSelectRatingIcon,
                              height: 28,
                              width: 28,
                            ),
                          ),
                        ),
                        InkWell(
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            print('Star_3');
                            controller.isSelectStar1.value = true;
                            controller.isSelectStar2.value = true;
                            controller.isSelectStar3.value = true;
                            controller.isSelectStar4.value = false;
                            controller.isSelectStar5.value = false;
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Image.asset(
                              controller.isSelectStar3.value == true
                                  ? AppImages.ProfileSelectRatingIcon
                                  : AppImages.ProfileUnSelectRatingIcon,
                              height: 28,
                              width: 28,
                            ),
                          ),
                        ),
                        InkWell(
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            print('Star_4');
                            controller.isSelectStar1.value = true;
                            controller.isSelectStar2.value = true;
                            controller.isSelectStar3.value = true;
                            controller.isSelectStar4.value = true;
                            controller.isSelectStar5.value = false;
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Image.asset(
                              controller.isSelectStar4.value == true
                                  ? AppImages.ProfileSelectRatingIcon
                                  : AppImages.ProfileUnSelectRatingIcon,
                              height: 28,
                              width: 28,
                            ),
                          ),
                        ),
                        InkWell(
                          focusColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            print('Star_5');
                            controller.isSelectStar1.value = true;
                            controller.isSelectStar2.value = true;
                            controller.isSelectStar3.value = true;
                            controller.isSelectStar4.value = true;
                            controller.isSelectStar5.value = true;
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 6),
                            child: Image.asset(
                              controller.isSelectStar5.value == true
                                  ? AppImages.ProfileSelectRatingIcon
                                  : AppImages.ProfileUnSelectRatingIcon,
                              height: 28,
                              width: 28,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  32.heightBox,
                  Container(
                    height: 1,
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Expanded(child: Container()),
                        const MySeparator(
                          color: CustomAppColors.borderColor,
                        ),
                      ],
                    ),
                  ),
                  32.heightBox,
                  Container(
                    width: (screenSize.width - 48),
                    height: 56,
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: CustomAppColors.borderColor),
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    child: TextFormField(
                      validator: (ReviewTitle) {
                        if (ReviewTitle == null || ReviewTitle.isEmpty) {
                          controller.strReviewTitle.value = 'No';
                          controller.isReviewTitle.value = false;
                          return null;
                        } else {
                          controller.strReviewTitle.value = ReviewTitle;
                          controller.isReviewTitle.value = true;
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: false,
                      controller: null,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: CustomAppColors.txtPlaceholderColor,
                      cursorWidth: 2,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: CustomAppColors.txtPlaceholderColor,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            top: 4,
                            left: 10,
                            bottom: 0), // add padding to adjust text
                        isDense: true,
                        border: InputBorder.none,
                        hintText: 'Title review',
                        hintStyle: const TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: CustomAppColors.txtPlaceholderColor,
                          wordSpacing: 1,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                  16.heightBox,
                  Container(
                    width: (screenSize.width - 48),
                    height: 192,
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          width: 1, color: CustomAppColors.borderColor),
                      borderRadius: BorderRadius.all(Radius.circular(14)),
                    ),
                    child: TextFormField(
                      maxLines: 50,
                      validator: (Message) {
                        if (Message == null || Message.isEmpty) {
                          controller.strMessage.value = 'No';
                          controller.isMessage.value = false;
                          return null;
                        } else {
                          controller.strMessage.value = Message;
                          controller.isMessage.value = true;
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: false,
                      controller: null,
                      keyboardType: TextInputType.name,
                      cursorColor: CustomAppColors.txtPlaceholderColor,
                      cursorWidth: 2,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: CustomAppColors.lblDarkColor,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(
                            top: 4,
                            left: 10,
                            bottom: 0), // add padding to adjust text
                        isDense: true,
                        border: InputBorder.none,
                        hintText: 'Leave review',
                        hintStyle: const TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                          color: CustomAppColors.txtPlaceholderColor,
                          wordSpacing: 1,
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 5.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
        );
      },
    );
  }
}
