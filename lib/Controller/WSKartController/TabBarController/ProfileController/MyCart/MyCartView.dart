import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../../ExtraClass/Routes/AppPages.dart';
import 'MyCartController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:ui';
import 'package:badges/src/badge.dart' as badge;

class MyCartView extends GetView<MyCartController> {
  const MyCartView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    var arrMyCartList = [
      {
        'cartID': '1',
      },
      {
        'cartID': '2',
      },
      {
        'cartID': '3',
      },
      {
        'cartID': '4',
      },
      {
        'cartID': '5',
      },
      {
        'cartID': '6',
      },
      {
        'cartID': '7',
      },
      {
        'cartID': '8',
      },
      {
        'cartID': '9',
      }
    ];

    var screenSize = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (screenSize.height - kToolbarHeight - 24) / 2;
    final double itemWidth = screenSize.width / 2;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: CustomeTextStyle(
          text: "My Cart",
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
              AppImages.ProfileSearchIcon,
              fit: BoxFit.contain,
              height: 28,
              width: 28,
            ),
            // Icon(Icons.person),
            onPressed: () {
              print('My Favorite');
              Get.toNamed(Routes.MYPROFILEROUTES);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: badge.Badge(
                badgeContent: CustomeTextStyle(
                  text: "5",
                  size: 10,
                  fontWeight: FontWeight.w500,
                  color: CustomAppColors.appWhiteColor,
                  wordSpacing: 0.5,
                ),
                badgeStyle:
                    BadgeStyle(badgeColor: CustomAppColors.badgeBGColor),
                child: Image.asset(
                  AppImages.ProfileHeart,
                  fit: BoxFit.contain,
                  height: 28,
                  width: 28,
                ),
              ),
              // Icon(Icons.person),
              onPressed: () {
                print('Click Search Item');
              },
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Expanded(
            flex: 1,
            child: arrMyCartList.length == 0
                ? Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        48.heightBox,
                        Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: Container(
                            width: (MediaQuery.of(context).size.width - 48),
                            height: 96,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppImages.ProfileNoCartItem),
                              ),
                            ),
                          ),
                        ),
                        32.heightBox,
                        Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: Container(
                            alignment: Alignment.center,
                            width: (MediaQuery.of(context).size.width - 48),
                            child: CustomeTextStyle(
                              text: "Your cart is empty",
                              size: 18,
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
                            width: (MediaQuery.of(context).size.width - 48),
                            child: CustomeTextStyle(
                              text:
                                  "Look like you have not anything to your cart. Go ahead and top categories.",
                              size: 16,
                              fontWeight: FontWeight.w500,
                              color: CustomAppColors.txtPlaceholderColor,
                              wordSpacing: 2,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        32.heightBox,
                        Padding(
                          padding: const EdgeInsets.only(left: 24, right: 24),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 48,
                            height: 56,
                            child: RoundedButton(
                              btnName: 'Return to shop',
                              btnBGColor: Colors.transparent,
                              btnStyle: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: CustomAppColors.appWhiteColor,
                                wordSpacing: 1,
                                height: 1.2,
                              ),
                              callback: () async {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 8,
                          child: ListView.separated(
                              padding: EdgeInsets.zero,
                              primary: false,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: arrMyCartList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 16, 0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 120,
                                    /*decoration: BoxDecoration(
                                      color: CustomAppColors.cardBGColor,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x320E151B),
                                          offset: Offset(0, 1),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(12),
                                    ),*/
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 0),
                                      child: Row(
                                        // mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Hero(
                                            tag: 'ControllerImage',
                                            transitionOnUserGestures: true,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Container(
                                                  width: 72,
                                                  height: 85,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(
                                                          AppImages
                                                              .HomeBestSale),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )),
                                            ),
                                          ),
                                          24.widthBox,
                                          Container(
                                            height: 90,
                                            // color: Colors.deepPurple,
                                            width: (screenSize.width - 200),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 0, 8),
                                                    child: CustomeTextStyle(
                                                      text:
                                                          "Nike waffle debut women’s shoes",
                                                      size: 14,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: CustomAppColors
                                                          .lblDarkColor,
                                                      wordSpacing: 4,
                                                    ),
                                                  ),
                                                  4.heightBox,
                                                  CustomeTextStyle(
                                                    text: "Rs 59.99",
                                                    size: 16,
                                                    fontWeight: FontWeight.w700,
                                                    color: CustomAppColors
                                                        .lblDarkColor,
                                                    wordSpacing: 4,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 8, 0, 0),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          child:
                                                              CustomeTextStyle(
                                                            text: "Black",
                                                            size: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color: CustomAppColors
                                                                .txtPlaceholderColor,
                                                            wordSpacing: 4,
                                                          ),
                                                        ),
                                                        8.widthBox,
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 6),
                                                          child: Container(
                                                            width: 6,
                                                            height: 6,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: CustomAppColors
                                                                  .switchOrgColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    6),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        8.widthBox,
                                                        Container(
                                                          child:
                                                              CustomeTextStyle(
                                                            text: "Size: XL",
                                                            size: 13,
                                                            fontWeight:
                                                                FontWeight.w400,
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 0),
                                                  child: Container(
                                                    width: 32,
                                                    height: 32,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: CustomAppColors
                                                          .cardBGColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(32),
                                                      ),
                                                    ),
                                                    child: Center(
                                                      child: Container(
                                                        width: 16,
                                                        height: 16,
                                                        decoration:
                                                            const BoxDecoration(
                                                          image:
                                                              DecorationImage(
                                                            image: AssetImage(
                                                                AppImages
                                                                    .ProfileDeleteItem),
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
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 24,
                                                        height: 24,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: CustomAppColors
                                                              .cardBGColor,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(24),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child:
                                                              CustomeTextStyle(
                                                            text: "-",
                                                            size: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: CustomAppColors
                                                                .lblDarkColor,
                                                            wordSpacing: 4,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 22,
                                                        height: 22,
                                                        child: Center(
                                                          child:
                                                              CustomeTextStyle(
                                                            text: "1",
                                                            size: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: CustomAppColors
                                                                .lblDarkColor,
                                                            wordSpacing: 4,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 24,
                                                        height: 24,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: CustomAppColors
                                                              .cardBGColor,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(24),
                                                          ),
                                                        ),
                                                        child: Center(
                                                          child:
                                                              CustomeTextStyle(
                                                            text: "+",
                                                            size: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: CustomAppColors
                                                                .lblDarkColor,
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
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, right: 24),
                                  child: Divider(
                                    thickness: 0.5,
                                    color: CustomAppColors.txtPlaceholderColor,
                                  ),
                                );
                              }),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            height: 72,
                            color: CustomAppColors.cardBGColor,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, bottom: 24, top: 24),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: CustomAppColors.lblDarkColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: CustomeTextStyle(
                                        text: "Sub total",
                                        size: 16,
                                        fontWeight: FontWeight.w600,
                                        color: CustomAppColors.appWhiteColor,
                                        wordSpacing: 4,
                                      ),
                                    ),
                                    InkWell(
                                      focusColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      splashColor: Colors.transparent,
                                      onTap: () {
                                        print('Click To Open CheckOut');
                                        // controller.ProfileSettingScreen();
                                        Get.toNamed(
                                            Routes.PROFILECHECKOUTROUTES);
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 16),
                                        child: Container(
                                          width: 168,
                                          height: 40,
                                          decoration: const BoxDecoration(
                                            color:
                                                CustomAppColors.appWhiteColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(16),
                                            ),
                                          ),
                                          child: Center(
                                            child: CustomeTextStyle(
                                              text: "Rs ${155.86}",
                                              size: 16,
                                              fontWeight: FontWeight.w700,
                                              color:
                                                  CustomAppColors.lblDarkColor,
                                              wordSpacing: 4,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
