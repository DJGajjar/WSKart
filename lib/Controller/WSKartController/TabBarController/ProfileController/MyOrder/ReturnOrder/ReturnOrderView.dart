import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'ReturnOrderController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:ui';
import 'package:badges/src/badge.dart' as badge;

class ReturnOrderView extends GetView<ReturnOrderController> {
  const ReturnOrderView({Key? key}) : super(key: key);

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
            print('Click TO Submit');
            // controller.productReviewPost();
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
          text: "Return-Refund",
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
                  Container(
                    width: (screenSize.width - 48),
                    child: CustomeTextStyle(
                      text: "Please select products for return",
                      size: 18,
                      fontWeight: FontWeight.w600,
                      color: CustomAppColors.lblDarkColor,
                      wordSpacing: 4,
                    ),
                  ),
                  32.heightBox,
                  Container(
                    height: 120,
                    width: (screenSize.width - 48),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Hero(
                            tag: 'ControllerImage',
                            transitionOnUserGestures: true,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                  width: 72,
                                  height: 85,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(AppImages.HomeBestSale),
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ),
                          ),
                          24.widthBox,
                          Container(
                            height: 90,
                            width: (screenSize.width - 216),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 8),
                                    child: CustomeTextStyle(
                                      text: "Nike waffle debut women’s shoes",
                                      size: 14,
                                      fontWeight: FontWeight.w600,
                                      color: CustomAppColors.lblDarkColor,
                                      wordSpacing: 4,
                                    ),
                                  ),
                                  4.heightBox,
                                  CustomeTextStyle(
                                    text: "Rs 59.99",
                                    size: 16,
                                    fontWeight: FontWeight.w700,
                                    color: CustomAppColors.lblDarkColor,
                                    wordSpacing: 4,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 8, 0, 0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: CustomeTextStyle(
                                            text: "Black",
                                            size: 13,
                                            fontWeight: FontWeight.w400,
                                            color: CustomAppColors
                                                .txtPlaceholderColor,
                                            wordSpacing: 4,
                                          ),
                                        ),
                                        8.widthBox,
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 6),
                                          child: Container(
                                            width: 6,
                                            height: 6,
                                            decoration: const BoxDecoration(
                                              color: CustomAppColors
                                                  .switchOrgColor,
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
                                            color: CustomAppColors
                                                .txtPlaceholderColor,
                                            wordSpacing: 4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 70,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 0),
                                  child: Container(
                                    width: 32,
                                    height: 32,
                                    decoration: const BoxDecoration(
                                      color: CustomAppColors.cardBGColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(32),
                                      ),
                                    ),
                                    child: Center(
                                      child: Container(
                                        width: 16,
                                        height: 16,
                                        decoration: const BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                AppImages.ProfileRightIcon),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                40.heightBox,
                                Container(
                                  height: 24,
                                  width: 72,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: CustomAppColors.cardBGColor,
                                          border: Border.all(
                                            width: 1,
                                            color: CustomAppColors.borderColor,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(24),
                                          ),
                                        ),
                                        child: Center(
                                          child: CustomeTextStyle(
                                            text: "-",
                                            size: 14,
                                            fontWeight: FontWeight.w600,
                                            color: CustomAppColors.lblDarkColor,
                                            wordSpacing: 4,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 22,
                                        height: 22,
                                        child: Center(
                                          child: CustomeTextStyle(
                                            text: "1",
                                            size: 14,
                                            fontWeight: FontWeight.w600,
                                            color: CustomAppColors.lblDarkColor,
                                            wordSpacing: 4,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 24,
                                        height: 24,
                                        decoration: BoxDecoration(
                                          color: CustomAppColors.cardBGColor,
                                          border: Border.all(
                                            width: 1,
                                            color: CustomAppColors.borderColor,
                                          ),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(24),
                                          ),
                                        ),
                                        child: Center(
                                          child: CustomeTextStyle(
                                            text: "+",
                                            size: 14,
                                            fontWeight: FontWeight.w600,
                                            color: CustomAppColors.lblDarkColor,
                                            wordSpacing: 4,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
                    child: CustomeTextStyle(
                      text: "Reason for return",
                      size: 18,
                      fontWeight: FontWeight.w600,
                      color: CustomAppColors.lblDarkColor,
                      wordSpacing: 4,
                    ),
                  ),
                  20.heightBox,
                  InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      print('Cancel Option 1');
                      controller.isCancelOrderOption1.value = true;
                      controller.isCancelOrderOption2.value = false;
                      controller.isCancelOrderOption3.value = false;
                      controller.isCancelOrderOption4.value = false;
                      controller.isCancelOrderOption5.value = false;
                      controller.isCancelOrderOption6.value = false;
                    },
                    child: Container(
                      height: 24,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            controller.isCancelOrderOption1.value == false
                                ? AppImages.ProfileUnCheckOrderIcon
                                : AppImages.ProfileCheckOrderIcon,
                            height: 20,
                            width: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CustomeTextStyle(
                              text: "Haven't receive the product",
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 4,
                            ),
                          ),
                        ],
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
                      print('Cancel Option 2');
                      controller.isCancelOrderOption1.value = false;
                      controller.isCancelOrderOption2.value = true;
                      controller.isCancelOrderOption3.value = false;
                      controller.isCancelOrderOption4.value = false;
                      controller.isCancelOrderOption5.value = false;
                      controller.isCancelOrderOption6.value = false;
                    },
                    child: Container(
                      height: 24,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            controller.isCancelOrderOption2.value == false
                                ? AppImages.ProfileUnCheckOrderIcon
                                : AppImages.ProfileCheckOrderIcon,
                            height: 20,
                            width: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CustomeTextStyle(
                              text: "Missing product",
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 4,
                            ),
                          ),
                        ],
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
                      print('Cancel Option 3');
                      controller.isCancelOrderOption1.value = false;
                      controller.isCancelOrderOption2.value = false;
                      controller.isCancelOrderOption3.value = true;
                      controller.isCancelOrderOption4.value = false;
                      controller.isCancelOrderOption5.value = false;
                      controller.isCancelOrderOption6.value = false;
                    },
                    child: Container(
                      height: 24,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            controller.isCancelOrderOption3.value == false
                                ? AppImages.ProfileUnCheckOrderIcon
                                : AppImages.ProfileCheckOrderIcon,
                            height: 20,
                            width: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CustomeTextStyle(
                              text: "Broken",
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 4,
                            ),
                          ),
                        ],
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
                      print('Cancel Option 4');
                      controller.isCancelOrderOption1.value = false;
                      controller.isCancelOrderOption2.value = false;
                      controller.isCancelOrderOption3.value = false;
                      controller.isCancelOrderOption4.value = true;
                      controller.isCancelOrderOption5.value = false;
                      controller.isCancelOrderOption6.value = false;
                    },
                    child: Container(
                      height: 24,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            controller.isCancelOrderOption4.value == false
                                ? AppImages.ProfileUnCheckOrderIcon
                                : AppImages.ProfileCheckOrderIcon,
                            height: 20,
                            width: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CustomeTextStyle(
                              text: "Product error",
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 4,
                            ),
                          ),
                        ],
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
                      print('Cancel Option 5');
                      controller.isCancelOrderOption1.value = false;
                      controller.isCancelOrderOption2.value = false;
                      controller.isCancelOrderOption3.value = false;
                      controller.isCancelOrderOption4.value = false;
                      controller.isCancelOrderOption5.value = true;
                      controller.isCancelOrderOption6.value = false;
                    },
                    child: Container(
                      height: 24,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            controller.isCancelOrderOption5.value == false
                                ? AppImages.ProfileUnCheckOrderIcon
                                : AppImages.ProfileCheckOrderIcon,
                            height: 20,
                            width: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CustomeTextStyle(
                              text: "Fake product",
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 4,
                            ),
                          ),
                        ],
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
                      print('Cancel Option 6');
                      controller.isCancelOrderOption1.value = false;
                      controller.isCancelOrderOption2.value = false;
                      controller.isCancelOrderOption3.value = false;
                      controller.isCancelOrderOption4.value = false;
                      controller.isCancelOrderOption5.value = false;
                      controller.isCancelOrderOption6.value = true;
                    },
                    child: Container(
                      height: 24,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            controller.isCancelOrderOption6.value == false
                                ? AppImages.ProfileUnCheckOrderIcon
                                : AppImages.ProfileCheckOrderIcon,
                            height: 20,
                            width: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: CustomeTextStyle(
                              text: "Different from product description",
                              size: 16,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  20.heightBox,
                  Container(
                    width: (screenSize.width - 48),
                    height: 76,
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
                        hintText: 'Other reason',
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
