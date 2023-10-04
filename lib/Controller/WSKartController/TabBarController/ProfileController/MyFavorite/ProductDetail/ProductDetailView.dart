import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';
import 'package:wskart/Service/Model/ProductModel/Product.dart';
import 'ProductDetailController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:ui';
import 'package:badges/src/badge.dart' as badge;

class ProductDetailView extends GetView<ProductDetailController> {
  final String productID;
  const ProductDetailView({Key? key, required this.productID})
      : super(key: key);

  // ProductDetailView({Key? key}) : super(key: key);

  /*
  productID: '${shopProductController.products?[index].id}'

   */
  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    var arrMyCartList = [
      {
        'cartID': '1',
      },
      // {
      //   'cartID': '2',
      // },
      // {
      //   'cartID': '3',
      // },
      // {
      //   'cartID': '4',
      // },
      // {
      //   'cartID': '5',
      // },
      // {
      //   'cartID': '6',
      // },
      // {
      //   'cartID': '7',
      // },
      // {
      //   'cartID': '8',
      // },
      // {
      //   'cartID': '9',
      // }
    ];

    var isDescriptionSelect = true.obs;
    var isMoreInfoSelect = false.obs;
    var isShippingSelect = false.obs;
    var isReviewsSelect = false.obs;

    var screenSize = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (screenSize.height - kToolbarHeight - 24) / 2;
    final double itemWidth = screenSize.width / 2;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
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
                  AppImages.ProfileCart,
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
          Container(
            width: (screenSize.width),
            height: (screenSize.height - 200),
            child: Obx(
              () => SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    10.heightBox,
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Container(
                        height: 388,
                        width: (screenSize.width - 48),
                        child: Hero(
                          tag: 'mainImage',
                          transitionOnUserGestures: true,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      AppImages.ProfileProductItemIcon),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Container(
                                      width: (screenSize.width - 48),
                                      height: 48,
                                      // color: Colors.red,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 48,
                                            width: (screenSize.width - 122),
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    width: 40,
                                                    height: 48,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 1,
                                                          color: CustomAppColors
                                                              .lblOrgColor),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(6),
                                                      ),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      child: Image.asset(
                                                        AppImages.HomeBestSale,
                                                        fit: BoxFit.fill,
                                                        height: 40,
                                                        width: 48,
                                                      ),
                                                    ),
                                                  ),
                                                  8.widthBox,
                                                  Container(
                                                    width: 40,
                                                    height: 48,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      child: Image.asset(
                                                        AppImages.HomeBestSale,
                                                        fit: BoxFit.fill,
                                                        height: 40,
                                                        width: 48,
                                                      ),
                                                    ),
                                                  ),
                                                  8.widthBox,
                                                  Container(
                                                    width: 40,
                                                    height: 48,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              6),
                                                      child: Image.asset(
                                                        AppImages.HomeBestSale,
                                                        fit: BoxFit.fill,
                                                        height: 40,
                                                        width: 48,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          10.widthBox,
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 16),
                                            child: Container(
                                              width: 32,
                                              height: 32,
                                              decoration: const BoxDecoration(
                                                color: CustomAppColors
                                                    .appWhiteColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(32)),
                                              ),
                                              child: Center(
                                                child: Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration:
                                                      const BoxDecoration(
                                                    image: DecorationImage(
                                                      image: AssetImage(AppImages
                                                          .ProfileFavoriteIcon),
                                                    ),
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
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 20),
                      child: Text(
                        "Aluminum Lion Shape Main Door (Size 10 Inch)(Set of 1 Pcs)",
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                          color: CustomAppColors.lblDarkColor,
                          wordSpacing: 0.5,
                          height: 1.2,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 24, right: 24, top: 12),
                      child: Container(
                        height: 24,
                        width: (screenSize.width - 48),
                        // color: Colors.red,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: 100,
                              child: CustomeTextStyle(
                                text: "Rs 139.52",
                                size: 18,
                                fontWeight: FontWeight.w600,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                            ),
                            Container(
                              width: (screenSize.width - 198),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
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
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Image.asset(
                                      AppImages.ProfileSelectRatingIcon,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3),
                                    child: Image.asset(
                                      AppImages.ProfileSelectRatingIcon,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3),
                                    child: Image.asset(
                                      AppImages.ProfileSelectRatingIcon,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3),
                                    child: Image.asset(
                                      AppImages.ProfileUnSelectRatingIcon,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3),
                                    child: Image.asset(
                                      AppImages.ProfileUnSelectRatingIcon,
                                      height: 20,
                                      width: 20,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Container(
                                      width: 50,
                                      child: CustomeTextStyle(
                                        text: "(25)",
                                        size: 15,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            CustomAppColors.txtPlaceholderColor,
                                        wordSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 50,
                              child: Image.asset(
                                AppImages.ProfileShareIconIcon,
                                fit: BoxFit.fitHeight,
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Container(
                        width: (screenSize.width),
                        height: 36,
                        // color: Colors.red,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              24.widthBox,
                              InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  print('Description');
                                  isDescriptionSelect.value = true;
                                  isMoreInfoSelect.value = false;
                                  isShippingSelect.value = false;
                                  isReviewsSelect.value = false;
                                },
                                child: Container(
                                  width: 80,
                                  // color: Colors.teal,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, top: 8),
                                        child: CustomeTextStyle(
                                          text: "Description",
                                          size: 14,
                                          fontWeight: FontWeight.w500,
                                          color: CustomAppColors.lblDarkColor,
                                          wordSpacing: 0.5,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 0),
                                        child: Container(
                                          height: 1,
                                          width: 80,
                                          color: isDescriptionSelect.value ==
                                                  true
                                              ? CustomAppColors.lblOrgColor
                                              : CustomAppColors.switchOrgColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              28.widthBox,
                              InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  print('More info');
                                  isDescriptionSelect.value = false;
                                  isMoreInfoSelect.value = true;
                                  isShippingSelect.value = false;
                                  isReviewsSelect.value = false;
                                },
                                child: Container(
                                  width: 66,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, top: 8),
                                        child: CustomeTextStyle(
                                          text: "More info",
                                          size: 14,
                                          fontWeight: FontWeight.w500,
                                          color: CustomAppColors.lblDarkColor,
                                          wordSpacing: 0.5,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 0),
                                        child: Container(
                                          height: 1,
                                          width: 66,
                                          color: isMoreInfoSelect.value == true
                                              ? CustomAppColors.lblOrgColor
                                              : CustomAppColors.switchOrgColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              28.widthBox,
                              InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  print('Shipping & Policy');
                                  isDescriptionSelect.value = false;
                                  isMoreInfoSelect.value = false;
                                  isShippingSelect.value = true;
                                  isReviewsSelect.value = false;
                                },
                                child: Container(
                                  width: 122,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, top: 8),
                                        child: CustomeTextStyle(
                                          text: "Shipping & Policy",
                                          size: 14,
                                          fontWeight: FontWeight.w500,
                                          color: CustomAppColors.lblDarkColor,
                                          wordSpacing: 0.5,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 0),
                                        child: Container(
                                          height: 1,
                                          width: 122,
                                          color: isShippingSelect.value == true
                                              ? CustomAppColors.lblOrgColor
                                              : CustomAppColors.switchOrgColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              28.widthBox,
                              InkWell(
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  print('Reviews');
                                  isDescriptionSelect.value = false;
                                  isMoreInfoSelect.value = false;
                                  isShippingSelect.value = false;
                                  isReviewsSelect.value = true;
                                },
                                child: Container(
                                  width: 60,
                                  // color: Colors.teal,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, top: 8),
                                        child: CustomeTextStyle(
                                          text: "Reviews",
                                          size: 14,
                                          fontWeight: FontWeight.w500,
                                          color: CustomAppColors.lblDarkColor,
                                          wordSpacing: 0.5,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 0),
                                        child: Container(
                                          height: 1,
                                          width: 60,
                                          color: isReviewsSelect.value == true
                                              ? CustomAppColors.lblOrgColor
                                              : CustomAppColors.switchOrgColor,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              24.widthBox,
                            ],
                          ),
                        ),
                      ),
                    ),
                    isDescriptionSelect == true
                        ? Padding(
                            padding: const EdgeInsets.only(left: 16, top: 32),
                            child: CustomeTextStyle(
                              text: "Description",
                              size: 22,
                              fontWeight: FontWeight.w600,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 0.5,
                            ),
                          )
                        : Container(),
                    isDescriptionSelect == true
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 16, top: 20, bottom: 40, right: 16),
                            child: Text(
                              "Decorative Main Door Pull Handle ensures better strength and durability & Better finish. \nMaterial:- Aluminum Rust and corrosion proof Durable Product. \nApplication/Utility: Suitable for each home, office, hospitals, hotels, shops, cafe, bars; in particular, any furniture of the living room, hallway, entryway, study room, kids room, kitchen, bathroom etc. The different designs and variety compliment a traditional as well as contemporary furniture and lends a universal look. \nExclusive range of door pull handle has Simply design with excellent Antique finishing. \nSize:- Total size 10 Inch (width 8 cm ).\nFinish:- Antique Brass. \nPackage Contents: Set of 1 pcs and Fitting Accessories. (Wooden Door and Glass Door fitting). 100% Rust Proof Material Guaranty.",
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: CustomAppColors.lblColor,
                                wordSpacing: 0.5,
                                height: 1.2,
                              ),
                              maxLines: 100,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        : Container(),
                    isMoreInfoSelect == true
                        ? Padding(
                            padding: const EdgeInsets.only(left: 16, top: 32),
                            child: CustomeTextStyle(
                              text: "More Information",
                              size: 22,
                              fontWeight: FontWeight.w600,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 0.5,
                            ),
                          )
                        : Container(),
                    isMoreInfoSelect == true
                        ? Padding(
                            padding: const EdgeInsets.only(
                                top: 20, left: 16, right: 16),
                            child: Container(
                              height: 127,
                              width: (screenSize.width - 48),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 28,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: CustomeTextStyle(
                                            text: "Best Use",
                                            size: 15,
                                            fontWeight: FontWeight.w600,
                                            color: CustomAppColors.lblColor,
                                            wordSpacing: 0.5,
                                          ),
                                        ),
                                        10.widthBox,
                                        Container(
                                          width: (screenSize.width - 158),
                                          child: CustomeTextStyle(
                                            text: "Best Use",
                                            size: 15,
                                            fontWeight: FontWeight.w600,
                                            color: CustomAppColors.lblColor,
                                            wordSpacing: 0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  5.heightBox,
                                  Container(
                                    height: 28,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: CustomeTextStyle(
                                            text: "Hood",
                                            size: 15,
                                            fontWeight: FontWeight.w600,
                                            color: CustomAppColors.lblColor,
                                            wordSpacing: 0.5,
                                          ),
                                        ),
                                        10.widthBox,
                                        Container(
                                          width: (screenSize.width - 158),
                                          child: CustomeTextStyle(
                                            text: "No",
                                            size: 15,
                                            fontWeight: FontWeight.w600,
                                            color: CustomAppColors.lblColor,
                                            wordSpacing: 0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  5.heightBox,
                                  Container(
                                    height: 28,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: CustomeTextStyle(
                                            text: "Materials",
                                            size: 15,
                                            fontWeight: FontWeight.w600,
                                            color: CustomAppColors.lblColor,
                                            wordSpacing: 0.5,
                                          ),
                                        ),
                                        10.widthBox,
                                        Container(
                                          width: (screenSize.width - 158),
                                          child: CustomeTextStyle(
                                            text: "100% Aluminum",
                                            size: 15,
                                            fontWeight: FontWeight.w600,
                                            color: CustomAppColors.lblColor,
                                            wordSpacing: 0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  5.heightBox,
                                  Container(
                                    height: 28,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 100,
                                          child: CustomeTextStyle(
                                            text: "Washing",
                                            size: 15,
                                            fontWeight: FontWeight.w600,
                                            color: CustomAppColors.lblColor,
                                            wordSpacing: 0.5,
                                          ),
                                        ),
                                        10.widthBox,
                                        Container(
                                          width: (screenSize.width - 158),
                                          child: CustomeTextStyle(
                                            text: "Hand wash cold, Dry Clean",
                                            size: 15,
                                            fontWeight: FontWeight.w600,
                                            color: CustomAppColors.lblColor,
                                            wordSpacing: 0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                    isShippingSelect == true
                        ? Padding(
                            padding: const EdgeInsets.only(left: 16, top: 32),
                            child: CustomeTextStyle(
                              text: "Shipping & Policy",
                              size: 22,
                              fontWeight: FontWeight.w600,
                              color: CustomAppColors.lblDarkColor,
                              wordSpacing: 0.5,
                            ),
                          )
                        : Container(),
                    isShippingSelect == true
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 16, top: 20, right: 16),
                            child: CustomeTextStyle(
                              text: "Shipping is free for Asia regions.",
                              size: 15,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.lblColor,
                              wordSpacing: 0.5,
                            ),
                          )
                        : Container(),
                    isShippingSelect == true
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 16, top: 12, bottom: 40, right: 16),
                            child: CustomeTextStyle(
                              text:
                                  "Policy: this product can be returned within 3 days after the delivered",
                              size: 15,
                              fontWeight: FontWeight.w400,
                              color: CustomAppColors.lblColor,
                              wordSpacing: 0.5,
                            ),
                          )
                        : Container(),
                    isReviewsSelect == true
                        ? Padding(
                            padding: const EdgeInsets.only(left: 16, top: 32),
                            child: Container(
                              height: 484, //(arrMyCartList.length * 181) + 122,
                              width: (screenSize.width - 32),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomeTextStyle(
                                    text: "Reviews",
                                    size: 22,
                                    fontWeight: FontWeight.w600,
                                    color: CustomAppColors.lblDarkColor,
                                    wordSpacing: 0.5,
                                  ),
                                  20.heightBox,
                                  Container(
                                    height: 36,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 78,
                                            height: 36,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    CustomAppColors.borderColor,
                                                style: BorderStyle.solid,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                14.widthBox,
                                                Image.asset(
                                                  AppImages.ProfileRatingIcon,
                                                  height: 14,
                                                  width: 14,
                                                ),
                                                8.widthBox,
                                                CustomeTextStyle(
                                                  text: "5.0",
                                                  size: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ],
                                            ),
                                          ),
                                          8.widthBox,
                                          Container(
                                            width: 78,
                                            height: 36,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    CustomAppColors.borderColor,
                                                style: BorderStyle.solid,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                14.widthBox,
                                                Image.asset(
                                                  AppImages.ProfileRatingIcon,
                                                  height: 14,
                                                  width: 14,
                                                ),
                                                8.widthBox,
                                                CustomeTextStyle(
                                                  text: "4.0",
                                                  size: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ],
                                            ),
                                          ),
                                          8.widthBox,
                                          Container(
                                            width: 78,
                                            height: 36,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    CustomAppColors.borderColor,
                                                style: BorderStyle.solid,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                14.widthBox,
                                                Image.asset(
                                                  AppImages.ProfileRatingIcon,
                                                  height: 14,
                                                  width: 14,
                                                ),
                                                8.widthBox,
                                                CustomeTextStyle(
                                                  text: "3.0",
                                                  size: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ],
                                            ),
                                          ),
                                          8.widthBox,
                                          Container(
                                            width: 78,
                                            height: 36,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    CustomAppColors.borderColor,
                                                style: BorderStyle.solid,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                14.widthBox,
                                                Image.asset(
                                                  AppImages.ProfileRatingIcon,
                                                  height: 14,
                                                  width: 14,
                                                ),
                                                8.widthBox,
                                                CustomeTextStyle(
                                                  text: "4.0",
                                                  size: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ],
                                            ),
                                          ),
                                          8.widthBox,
                                          Container(
                                            width: 78,
                                            height: 36,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color:
                                                    CustomAppColors.borderColor,
                                                style: BorderStyle.solid,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                14.widthBox,
                                                Image.asset(
                                                  AppImages.ProfileRatingIcon,
                                                  height: 14,
                                                  width: 14,
                                                ),
                                                8.widthBox,
                                                CustomeTextStyle(
                                                  text: "1.0",
                                                  size: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  40.heightBox,
                                  Container(
                                    height: arrMyCartList.length * 181,
                                    child: ListView.separated(
                                        scrollDirection: Axis.vertical,
                                        itemCount: arrMyCartList.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: (screenSize.width - 198),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 0),
                                                      child: Image.asset(
                                                        AppImages
                                                            .ProfileSelectRatingIcon,
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 3),
                                                      child: Image.asset(
                                                        AppImages
                                                            .ProfileSelectRatingIcon,
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 3),
                                                      child: Image.asset(
                                                        AppImages
                                                            .ProfileSelectRatingIcon,
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 3),
                                                      child: Image.asset(
                                                        AppImages
                                                            .ProfileUnSelectRatingIcon,
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 3),
                                                      child: Image.asset(
                                                        AppImages
                                                            .ProfileUnSelectRatingIcon,
                                                        height: 20,
                                                        width: 20,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              8.heightBox,
                                              CustomeTextStyle(
                                                text: "Comfy and Stylish",
                                                size: 16,
                                                fontWeight: FontWeight.w600,
                                                color: CustomAppColors
                                                    .lblDarkColor,
                                                wordSpacing: 0.5,
                                              ),
                                              16.heightBox,
                                              Text(
                                                "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt",
                                                textDirection:
                                                    TextDirection.ltr,
                                                style: TextStyle(
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 15,
                                                  color:
                                                      CustomAppColors.lblColor,
                                                  wordSpacing: 0.5,
                                                  height: 1.2,
                                                ),
                                                maxLines: 100,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              16.heightBox,
                                              Container(
                                                height: 30,
                                                // color: Colors.red,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: CustomeTextStyle(
                                                        text: "24 year old",
                                                        size: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: CustomAppColors
                                                            .lblDarkColor,
                                                        wordSpacing: 4,
                                                      ),
                                                    ),
                                                    16.widthBox,
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 1),
                                                      child: Container(
                                                        width: 6,
                                                        height: 6,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: CustomAppColors
                                                              .switchOrgColor,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(6),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    16.widthBox,
                                                    Container(
                                                      child: CustomeTextStyle(
                                                        text: "Size: M",
                                                        size: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: CustomAppColors
                                                            .txtPlaceholderColor,
                                                        wordSpacing: 4,
                                                      ),
                                                    ),
                                                    16.widthBox,
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 1),
                                                      child: Container(
                                                        width: 6,
                                                        height: 6,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: CustomAppColors
                                                              .switchOrgColor,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(6),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    16.widthBox,
                                                    Container(
                                                      child: CustomeTextStyle(
                                                        text: "Color: Orange",
                                                        size: 13,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: CustomAppColors
                                                            .lblDarkColor,
                                                        wordSpacing: 4,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                        separatorBuilder: (context, index) {
                                          return Divider(
                                            thickness: 1,
                                            color: CustomAppColors.borderColor,
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            focusColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              print('Click To Open New Billing Address');
              Get.toNamed(Routes.PROFILEPAYMENTLISTROUTES);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 15, left: 24, right: 24),
              child: Container(
                width: (screenSize.width - 48),
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
                child: Container(
                  child: Center(
                    child: CustomeTextStyle(
                      text: "Add to Cart",
                      size: 16,
                      fontWeight: FontWeight.w600,
                      color: CustomAppColors.appWhiteColor,
                      wordSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
