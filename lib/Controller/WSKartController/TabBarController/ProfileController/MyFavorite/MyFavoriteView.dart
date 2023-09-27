import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../../../../ExtraClass/Routes/AppPages.dart';
import 'MyFavoriteController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:ui';

class MyFavoriteView extends GetView<MyFavoriteController> {
  const MyFavoriteView({Key? key}) : super(key: key);

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

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: CustomeTextStyle(
          text: "My Favorite",
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          10.heightBox,
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Container(
                height: 40,
                width: MediaQuery.of(context).size.width - 48,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(AppImages.ProfileHeart),
                        ),
                      ),
                    ),
                    8.widthBox,
                    Container(
                      height: 40,
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: CustomeTextStyle(
                          text: "My Favorite",
                          size: 22,
                          fontWeight: FontWeight.w600,
                          color: CustomAppColors.lblDarkColor,
                          wordSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          16.heightBox,
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Container(
              height: 1,
              width: (MediaQuery.of(context).size.width - 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 1,
                      color: CustomAppColors.lblOrgColor,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 1,
                      color: CustomAppColors.switchOrgColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          30.heightBox,
          Container(
            child: Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 0.57, //(itemWidth / itemHeight),
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 24,
                    ),
                    itemCount: arrMyFavoriteLis.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: CustomAppColors.cardBGColor,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Container(
                          // width: 156,
                          // height: 270,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 154,
                                width: 156,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  image: DecorationImage(
                                    image:
                                        AssetImage(AppImages.ProfileMyFavorite),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 156,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0, left: 6),
                                            child: Container(
                                              width: 36,
                                              height: 16,
                                              // color: CustomAppColors.lblOrgColor,
                                              decoration: BoxDecoration(
                                                color:
                                                    CustomAppColors.lblOrgColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8)),
                                              ),
                                              child: Center(
                                                child: CustomeTextStyle(
                                                  text: "63%",
                                                  size: 10,
                                                  fontWeight: FontWeight.w500,
                                                  color: CustomAppColors
                                                      .appWhiteColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 6),
                                            child: Container(
                                              width: 28,
                                              height: 28,
                                              decoration: const BoxDecoration(
                                                color: CustomAppColors
                                                    .appWhiteColor,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(28)),
                                              ),
                                              child: Center(
                                                child: Container(
                                                  width: 16,
                                                  height: 16,
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
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(9, 4, 9, 2),
                                child: Container(
                                  child: CustomeTextStyle(
                                    text: "Sofa Furniture Leg 3",
                                    size: 12,
                                    fontWeight: FontWeight.w400,
                                    color: CustomAppColors.lblDarkColor,
                                    wordSpacing: 0.5,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(9, 4, 9, 2),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    RatingBarIndicator(
                                      rating: 2.5,
                                      itemCount: 5,
                                      itemSize: 12.0,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: CustomAppColors.lblOrgColor,
                                      ),
                                    ),
                                    4.widthBox,
                                    CustomeTextStyle(
                                      text: "(25)",
                                      size: 10,
                                      fontWeight: FontWeight.w400,
                                      color:
                                          CustomAppColors.txtPlaceholderColor,
                                      wordSpacing: 0.5,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(10, 2, 9, 2),
                                child: Container(
                                  width: 120,
                                  height: 10,
                                  child: CustomeTextStyle(
                                    text: "In Stock",
                                    size: 10,
                                    fontWeight: FontWeight.w400,
                                    color: CustomAppColors.lblDarkColor,
                                    wordSpacing: 0.5,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(9, 10, 9, 2),
                                child: Container(
                                  width: 120,
                                  height: 10,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '₹1000',
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10,
                                            color: CustomAppColors
                                                .txtPlaceholderColor,
                                            wordSpacing: 1,
                                            height: 0.5,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' ₹599',
                                          style: TextStyle(
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.normal,
                                            fontSize: 10,
                                            color: CustomAppColors.lblOrgColor,
                                            wordSpacing: 1,
                                            height: 0.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 7, top: 2),
                                child: Container(
                                  height: 30,
                                  width: 142,
                                  decoration: BoxDecoration(
                                    color: CustomAppColors.lblOrgColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                  child: arrMyFavoriteLis[index]['favoriteID']
                                              .toString() ==
                                          '1'
                                      ? Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: CustomAppColors
                                                      .cartCountBGColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    bottomLeft:
                                                        Radius.circular(8),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        height: 30,
                                                        child: Center(
                                                          child:
                                                              CustomeTextStyle(
                                                            text: "-",
                                                            size: 12,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color: CustomAppColors
                                                                .appWhiteColor,
                                                            wordSpacing: 0.5,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        height: 30,
                                                        child: Center(
                                                          child:
                                                              CustomeTextStyle(
                                                            text: "1",
                                                            size: 12,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color: CustomAppColors
                                                                .appWhiteColor,
                                                            wordSpacing: 0.5,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        height: 30,
                                                        child: Center(
                                                          child:
                                                              CustomeTextStyle(
                                                            text: "+",
                                                            size: 12,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            color: CustomAppColors
                                                                .appWhiteColor,
                                                            wordSpacing: 0.5,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                height: 30,
                                                decoration: BoxDecoration(
                                                  color: CustomAppColors
                                                      .lblOrgColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    bottomRight:
                                                        Radius.circular(8),
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Container(
                                                    width: 16,
                                                    height: 16,
                                                    decoration:
                                                        const BoxDecoration(
                                                      image: DecorationImage(
                                                        image: AssetImage(AppImages
                                                            .ProfileAddToCart),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Center(
                                          child: Container(
                                            width: 16,
                                            height: 16,
                                            decoration: const BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    AppImages.ProfileAddToCart),
                                              ),
                                            ),
                                          ),
                                        ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
