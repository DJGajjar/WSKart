import 'package:badges/badges.dart' as badge;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../../ExtraClass/Routes/AppPages.dart';
import 'SearchResultController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:ui';
import 'package:animations/animations.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyFavorite/ProductDetail/ProductDetailView.dart';

class SearchResultView extends GetView<SearchResultController> {
  const SearchResultView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    var arrMyFavoriteLis = [
      {
        'favoriteID': '1',
      },
      {
        'favoriteID': '0',
      },
      {
        'favoriteID': '0',
      },
      {
        'favoriteID': '0',
      },
      {
        'favoriteID': '1',
      },
      {
        'favoriteID': '0',
      },
      {
        'favoriteID': '0',
      },
      {
        'favoriteID': '1',
      },
      {
        'favoriteID': '0',
      },
      {
        'favoriteID': '0',
      },
    ];

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    ContainerTransitionType _transitionType = ContainerTransitionType.fade;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomeTextStyle(
          text: "Search Product",
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
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.heightBox,
          Container(
            height: 64,
            color: CustomAppColors.cardBGColor,
            width: MediaQuery.of(context).size.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                24.widthBox,
                Container(
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(AppImages.ProfileSearchIcon),
                    ),
                  ),
                ),
                8.widthBox,
                Container(
                  height: 64,
                  width: (MediaQuery.of(context).size.width - 118),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    obscureText: false,
                    controller: null,
                    keyboardType: TextInputType.none,
                    cursorColor: CustomAppColors.txtPlaceholderColor,
                    cursorWidth: 2,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: CustomAppColors.txtPlaceholderColor,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          top: 20,
                          left: 10,
                          bottom: 0), // add padding to adjust text
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Search Something',
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
                Container(
                  height: 64,
                  width: 50,
                  child: IconButton(
                    icon: Image.asset(AppImages.ProfileCloseIcon,
                        fit: BoxFit.contain, height: 24, width: 24),
                    // Icon(Icons.person),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          32.heightBox,
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Container(
              height: 32,
              width: (MediaQuery.of(context).size.width - 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 32,
                    width: (MediaQuery.of(context).size.width - 128),
                    child: CustomeTextStyle(
                      text: "14 results found",
                      size: 22,
                      fontWeight: FontWeight.w600,
                      color: CustomAppColors.lblDarkColor,
                      wordSpacing: 0.5,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          child: IconButton(
                            icon: Image.asset(
                              AppImages.ProductFilterIcon,
                              fit: BoxFit.cover,
                              height: 40,
                              width: 40,
                            ),
                            // Icon(Icons.person),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          child: IconButton(
                            icon: badge.Badge(
                              badgeContent: CustomeTextStyle(
                                text: "5",
                                size: 10,
                                fontWeight: FontWeight.w500,
                                color: CustomAppColors.appWhiteColor,
                                wordSpacing: 0.5,
                              ),
                              badgeStyle: BadgeStyle(
                                  badgeColor: CustomAppColors.badgeBGColor),
                              child: Image.asset(
                                AppImages.ProfileHeart,
                                fit: BoxFit.contain,
                                height: 40,
                                width: 40,
                              ),
                            ),
                            // Icon(Icons.person),
                            onPressed: () {
                              print('Click My Favourite');
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height - 253,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: arrMyFavoriteLis.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                    child: Container(
                      width: double.infinity,
                      height: 85,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                        child: Row(
                          // mainAxisSize: MainAxisSize.max,
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
                                        image:
                                            AssetImage(AppImages.HomeBestSale),
                                        fit: BoxFit.cover,
                                      ),
                                    )),
                              ),
                            ),
                            24.widthBox,
                            Container(
                              height: 90,
                              // color: Colors.deepPurple,
                              width: (MediaQuery.of(context).size.width - 200),
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
                                    padding: const EdgeInsets.only(top: 25),
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
                          ],
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Divider(
                      thickness: 0.5,
                      color: CustomAppColors.txtPlaceholderColor,
                    ),
                  );
                }),
          ),
          12.heightBox,
        ],
      ),
    );
  }
}
