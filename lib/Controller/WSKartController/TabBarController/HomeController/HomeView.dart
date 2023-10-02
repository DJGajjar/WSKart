import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';
import 'HomeController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    var arrBestSaleList = [
      {
        'saleID': '1',
      },
      {
        'saleID': '2',
      },
      {
        'saleID': '3',
      },
    ];

    var arrCategoriesList = [
      {
        'categoriesName': 'Electronics',
      },
      {
        'categoriesName': 'Hardware',
      },
      {
        'categoriesName': 'Bathroom',
      },
      {
        'categoriesName': 'Fashion',
      },
      {
        'categoriesName': 'Health',
      },
    ];

    var arrMyFavoriteLis = [
      {
        'favoriteID': '1',
      },
    ];

    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: formGlobalKey,
          child: Column(
            children: [
              Container(
                height: 60,
                width: (MediaQuery.of(context).size.width),
                color: CustomAppColors.searchBarBGColor,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                  child: SizedBox.fromSize(
                    size: Size((MediaQuery.of(context).size.width - 48), 36),
                    child: Material(
                      color: CustomAppColors.appWhiteColor,
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      child: InkWell(
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          print('Click Search Bar Open');
                          Get.toNamed(Routes.SEARCHRESULTROUTES);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: CustomeTextStyle(
                            text: "Search For Products",
                            size: 12,
                            fontWeight: FontWeight.w400,
                            color: CustomAppColors.searchBarPlaceholderColor,
                            wordSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              10.heightBox,
              Container(
                height: 122,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: arrBestSaleList.length,
                    shrinkWrap: true,
                    padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                    itemBuilder: (context, index) {
                      return InkWell(
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          print('Click Best Sale: $index');
                          // controller.ProfileSettingScreen();
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(26),
                          child: Container(
                            height: 96,
                            width: (MediaQuery.of(context).size.width - 48),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(AppImages.HomeBestSale),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 26, top: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: CustomeTextStyle(
                                      text: "Best range curtain bracket",
                                      size: 10,
                                      fontWeight: FontWeight.w600,
                                      color: CustomAppColors.switchOrgColor,
                                      wordSpacing: 0.5,
                                    ),
                                  ),
                                  8.heightBox,
                                  Container(
                                    width: 150,
                                    child: CustomeTextStyle(
                                      text: "Sale",
                                      size: 20,
                                      fontWeight: FontWeight.w800,
                                      color: CustomAppColors.appWhiteColor,
                                      wordSpacing: 0.5,
                                    ),
                                  ),
                                  8.heightBox,
                                  Container(
                                    width: 60,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: CustomAppColors.appWhiteColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(6)),
                                    ),
                                    child: Center(
                                      child: CustomeTextStyle(
                                        text: "Shop Now",
                                        size: 9,
                                        fontWeight: FontWeight.w400,
                                        color: CustomAppColors.lblColor,
                                        wordSpacing: 0.5,
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
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 24);
                    }),
              ),
              16.heightBox,
              Container(
                width: (MediaQuery.of(context).size.width - 48),
                height: 75,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: arrBestSaleList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return InkWell(
                        focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        onTap: () {
                          print('Click to Most Detail');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: CustomAppColors.borderColor, width: 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  height: 75,
                                  width: 92,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(AppImages.HomeMostSale),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(9, 11, 9, 2),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: CustomeTextStyle(
                                            text: "WSK Horse Mortise",
                                            size: 12,
                                            fontWeight: FontWeight.w600,
                                            color: CustomAppColors.lblDarkColor,
                                            wordSpacing: 0.5,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 5, 9, 2),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              RatingBarIndicator(
                                                rating: 2.5,
                                                itemCount: 5,
                                                itemSize: 12.0,
                                                itemBuilder: (context, _) =>
                                                    const Icon(
                                                  Icons.star,
                                                  color: CustomAppColors
                                                      .lblOrgColor,
                                                ),
                                              ),
                                              4.widthBox,
                                              CustomeTextStyle(
                                                text: "(25)",
                                                size: 10,
                                                fontWeight: FontWeight.w400,
                                                color: CustomAppColors
                                                    .txtPlaceholderColor,
                                                wordSpacing: 0.5,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 8, 9, 2),
                                          child: Container(
                                            width: 120,
                                            height: 10,
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(
                                                    text: '₹1000',
                                                    style: TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.normal,
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
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 10,
                                                      color: CustomAppColors
                                                          .lblOrgColor,
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
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(width: 24);
                    }),
              ),
              16.heightBox,
              Container(
                height: 108,
                width: (screenSize.width - 48),
                // color: Colors.cyan,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: (screenSize.width - 48),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 120,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: CustomeTextStyle(
                                text: "Categories",
                                size: 18,
                                fontWeight: FontWeight.w600,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                            ),
                          ),
                          InkWell(
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {
                              print('Click to Categories More Detail');
                            },
                            child: Container(
                              width: 100,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: CustomAppColors.switchOrgColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 68,
                                      height: 16,
                                      child: CustomeTextStyle(
                                        text: "More Products",
                                        size: 9,
                                        fontWeight: FontWeight.w500,
                                        color: CustomAppColors.lblOrgColor,
                                        wordSpacing: 0.5,
                                      ),
                                    ),
                                    Container(
                                      width: 12,
                                      height: 12,
                                      alignment: Alignment.topLeft,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              AppImages.HomeMoreIcon),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: (screenSize.width - 48),
                      height: 68,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: arrCategoriesList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              focusColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              onTap: () {
                                print('Click to Categories Detail');
                              },
                              child: Container(
                                height: 68,
                                width: 52,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 52,
                                      width: 52,
                                      decoration: const BoxDecoration(
                                        color: CustomAppColors.switchOrgColor,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              AppImages.HomeCategoriesIcon),
                                        ),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(52)),
                                      ),
                                    ),
                                    6.heightBox,
                                    Container(
                                      width: 52,
                                      height: 10,
                                      child: CustomeTextStyle(
                                        text: arrCategoriesList[index]
                                                ['categoriesName']
                                            .toString(),
                                        size: 10,
                                        fontWeight: FontWeight.w600,
                                        color: CustomAppColors.lblDarkColor,
                                        wordSpacing: 0.5,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(width: 20);
                          }),
                    ),
                  ],
                ),
              ),
              18.heightBox,
              Container(
                height: 318,
                width: (screenSize.width - 48),
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: (screenSize.width - 48),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 170,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: CustomeTextStyle(
                                text: "Today's Best Deal",
                                size: 18,
                                fontWeight: FontWeight.w600,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                            ),
                          ),
                          InkWell(
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {
                              print('Click to Today Best Deal More Detail');
                            },
                            child: Container(
                              width: 100,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: CustomAppColors.switchOrgColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 68,
                                      height: 16,
                                      child: CustomeTextStyle(
                                        text: "More Products",
                                        size: 9,
                                        fontWeight: FontWeight.w500,
                                        color: CustomAppColors.lblOrgColor,
                                        wordSpacing: 0.5,
                                      ),
                                    ),
                                    Container(
                                      width: 12,
                                      height: 12,
                                      alignment: Alignment.topLeft,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              AppImages.HomeMoreIcon),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    8.heightBox,
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: (screenSize.width - 64) / 2,
                            height: 270,
                            decoration: const BoxDecoration(
                              color: CustomAppColors.cardBGColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 154,
                                  width: (screenSize.width - 64) / 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        AppImages.ProfileMyFavorite,
                                      ),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  color: CustomAppColors
                                                      .lblOrgColor,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                              padding: const EdgeInsets.only(
                                                  right: 6),
                                              child: Container(
                                                width: 28,
                                                height: 28,
                                                decoration: const BoxDecoration(
                                                  color: CustomAppColors
                                                      .appWhiteColor,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 4, 9, 2),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 4, 9, 2),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 2, 9, 2),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 10, 9, 2),
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
                                              color:
                                                  CustomAppColors.lblOrgColor,
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
                                  padding:
                                      const EdgeInsets.only(left: 7, top: 2),
                                  child: Container(
                                    height: 30,
                                    width: 142,
                                    decoration: BoxDecoration(
                                      color: CustomAppColors.lblOrgColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: Center(
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
                          16.widthBox,
                          Container(
                            width: (screenSize.width - 64) / 2,
                            height: 270,
                            decoration: const BoxDecoration(
                              color: CustomAppColors.cardBGColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 154,
                                  width: (screenSize.width - 64) / 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        AppImages.ProfileMyFavorite,
                                      ),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  color: CustomAppColors
                                                      .lblOrgColor,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                              padding: const EdgeInsets.only(
                                                  right: 6),
                                              child: Container(
                                                width: 28,
                                                height: 28,
                                                decoration: const BoxDecoration(
                                                  color: CustomAppColors
                                                      .appWhiteColor,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 4, 9, 2),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 4, 9, 2),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 2, 9, 2),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 10, 9, 2),
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
                                              color:
                                                  CustomAppColors.lblOrgColor,
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
                                  padding:
                                      const EdgeInsets.only(left: 7, top: 2),
                                  child: Container(
                                    height: 30,
                                    width: 142,
                                    decoration: BoxDecoration(
                                      color: CustomAppColors.lblOrgColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: arrMyFavoriteLis[0]['favoriteID']
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
                                                      topLeft:
                                                          Radius.circular(8),
                                                      bottomLeft:
                                                          Radius.circular(8),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                                  FontWeight
                                                                      .w800,
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
                                                                  FontWeight
                                                                      .w800,
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
                                                                  FontWeight
                                                                      .w800,
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
                                                          image: AssetImage(
                                                              AppImages
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
                                                  image: AssetImage(AppImages
                                                      .ProfileAddToCart),
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              18.heightBox,
              Container(
                height: 318,
                width: (screenSize.width - 48),
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: (screenSize.width - 48),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 170,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: CustomeTextStyle(
                                text: "Best Selling",
                                size: 18,
                                fontWeight: FontWeight.w600,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                            ),
                          ),
                          InkWell(
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {
                              print('Click to Best Selling More Detail');
                            },
                            child: Container(
                              width: 100,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: CustomAppColors.switchOrgColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 68,
                                      height: 16,
                                      child: CustomeTextStyle(
                                        text: "More Products",
                                        size: 9,
                                        fontWeight: FontWeight.w500,
                                        color: CustomAppColors.lblOrgColor,
                                        wordSpacing: 0.5,
                                      ),
                                    ),
                                    Container(
                                      width: 12,
                                      height: 12,
                                      alignment: Alignment.topLeft,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              AppImages.HomeMoreIcon),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    8.heightBox,
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: (screenSize.width - 64) / 2,
                            height: 270,
                            decoration: const BoxDecoration(
                              color: CustomAppColors.cardBGColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 154,
                                  width: (screenSize.width - 64) / 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        AppImages.ProfileMyFavorite,
                                      ),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  color: CustomAppColors
                                                      .lblOrgColor,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                              padding: const EdgeInsets.only(
                                                  right: 6),
                                              child: Container(
                                                width: 28,
                                                height: 28,
                                                decoration: const BoxDecoration(
                                                  color: CustomAppColors
                                                      .appWhiteColor,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 4, 9, 2),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 4, 9, 2),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 2, 9, 2),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 10, 9, 2),
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
                                              color:
                                                  CustomAppColors.lblOrgColor,
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
                                  padding:
                                      const EdgeInsets.only(left: 7, top: 2),
                                  child: Container(
                                    height: 30,
                                    width: 142,
                                    decoration: BoxDecoration(
                                      color: CustomAppColors.lblOrgColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: Center(
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
                          16.widthBox,
                          Container(
                            width: (screenSize.width - 64) / 2,
                            height: 270,
                            decoration: const BoxDecoration(
                              color: CustomAppColors.cardBGColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 154,
                                  width: (screenSize.width - 64) / 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        AppImages.ProfileMyFavorite,
                                      ),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  color: CustomAppColors
                                                      .lblOrgColor,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                              padding: const EdgeInsets.only(
                                                  right: 6),
                                              child: Container(
                                                width: 28,
                                                height: 28,
                                                decoration: const BoxDecoration(
                                                  color: CustomAppColors
                                                      .appWhiteColor,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 4, 9, 2),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 4, 9, 2),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 2, 9, 2),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 10, 9, 2),
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
                                              color:
                                                  CustomAppColors.lblOrgColor,
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
                                  padding:
                                      const EdgeInsets.only(left: 7, top: 2),
                                  child: Container(
                                    height: 30,
                                    width: 142,
                                    decoration: BoxDecoration(
                                      color: CustomAppColors.lblOrgColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: arrMyFavoriteLis[0]['favoriteID']
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
                                                      topLeft:
                                                          Radius.circular(8),
                                                      bottomLeft:
                                                          Radius.circular(8),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                                  FontWeight
                                                                      .w800,
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
                                                                  FontWeight
                                                                      .w800,
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
                                                                  FontWeight
                                                                      .w800,
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
                                                          image: AssetImage(
                                                              AppImages
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
                                                  image: AssetImage(AppImages
                                                      .ProfileAddToCart),
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              18.heightBox,
              Container(
                height: 318,
                width: (screenSize.width - 48),
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: (screenSize.width - 48),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 170,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: CustomeTextStyle(
                                text: "Newly Arrival",
                                size: 18,
                                fontWeight: FontWeight.w600,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                            ),
                          ),
                          InkWell(
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {
                              print('Click to Newly Arrival More Detail');
                            },
                            child: Container(
                              width: 100,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: CustomAppColors.switchOrgColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 68,
                                      height: 16,
                                      child: CustomeTextStyle(
                                        text: "More Products",
                                        size: 9,
                                        fontWeight: FontWeight.w500,
                                        color: CustomAppColors.lblOrgColor,
                                        wordSpacing: 0.5,
                                      ),
                                    ),
                                    Container(
                                      width: 12,
                                      height: 12,
                                      alignment: Alignment.topLeft,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              AppImages.HomeMoreIcon),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    8.heightBox,
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: (screenSize.width - 64) / 2,
                            height: 270,
                            decoration: const BoxDecoration(
                              color: CustomAppColors.cardBGColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 154,
                                  width: (screenSize.width - 64) / 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        AppImages.ProfileMyFavorite,
                                      ),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  color: CustomAppColors
                                                      .lblOrgColor,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                              padding: const EdgeInsets.only(
                                                  right: 6),
                                              child: Container(
                                                width: 28,
                                                height: 28,
                                                decoration: const BoxDecoration(
                                                  color: CustomAppColors
                                                      .appWhiteColor,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 4, 9, 2),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 4, 9, 2),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 2, 9, 2),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 10, 9, 2),
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
                                              color:
                                                  CustomAppColors.lblOrgColor,
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
                                  padding:
                                      const EdgeInsets.only(left: 7, top: 2),
                                  child: Container(
                                    height: 30,
                                    width: 142,
                                    decoration: BoxDecoration(
                                      color: CustomAppColors.lblOrgColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: Center(
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
                          16.widthBox,
                          Container(
                            width: (screenSize.width - 64) / 2,
                            height: 270,
                            decoration: const BoxDecoration(
                              color: CustomAppColors.cardBGColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 154,
                                  width: (screenSize.width - 64) / 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        AppImages.ProfileMyFavorite,
                                      ),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  color: CustomAppColors
                                                      .lblOrgColor,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                              padding: const EdgeInsets.only(
                                                  right: 6),
                                              child: Container(
                                                width: 28,
                                                height: 28,
                                                decoration: const BoxDecoration(
                                                  color: CustomAppColors
                                                      .appWhiteColor,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 4, 9, 2),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 4, 9, 2),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 2, 9, 2),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 10, 9, 2),
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
                                              color:
                                                  CustomAppColors.lblOrgColor,
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
                                  padding:
                                      const EdgeInsets.only(left: 7, top: 2),
                                  child: Container(
                                    height: 30,
                                    width: 142,
                                    decoration: BoxDecoration(
                                      color: CustomAppColors.lblOrgColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: arrMyFavoriteLis[0]['favoriteID']
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
                                                      topLeft:
                                                          Radius.circular(8),
                                                      bottomLeft:
                                                          Radius.circular(8),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                                  FontWeight
                                                                      .w800,
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
                                                                  FontWeight
                                                                      .w800,
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
                                                                  FontWeight
                                                                      .w800,
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
                                                          image: AssetImage(
                                                              AppImages
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
                                                  image: AssetImage(AppImages
                                                      .ProfileAddToCart),
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              18.heightBox,
              Container(
                height: 318,
                width: (screenSize.width - 48),
                // color: Colors.red,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: (screenSize.width - 48),
                      height: 40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 170,
                            height: 40,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: CustomeTextStyle(
                                text: "Recently Viewed",
                                size: 18,
                                fontWeight: FontWeight.w600,
                                color: CustomAppColors.lblDarkColor,
                                wordSpacing: 0.5,
                              ),
                            ),
                          ),
                          InkWell(
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            onTap: () {
                              print('Click to Recently Viewed More Detail');
                            },
                            child: Container(
                              width: 100,
                              height: 24,
                              decoration: const BoxDecoration(
                                color: CustomAppColors.switchOrgColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6)),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, top: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 68,
                                      height: 16,
                                      child: CustomeTextStyle(
                                        text: "More Products",
                                        size: 9,
                                        fontWeight: FontWeight.w500,
                                        color: CustomAppColors.lblOrgColor,
                                        wordSpacing: 0.5,
                                      ),
                                    ),
                                    Container(
                                      width: 12,
                                      height: 12,
                                      alignment: Alignment.topLeft,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              AppImages.HomeMoreIcon),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    8.heightBox,
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: (screenSize.width - 64) / 2,
                            height: 270,
                            decoration: const BoxDecoration(
                              color: CustomAppColors.cardBGColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 154,
                                  width: (screenSize.width - 64) / 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        AppImages.ProfileMyFavorite,
                                      ),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  color: CustomAppColors
                                                      .lblOrgColor,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                              padding: const EdgeInsets.only(
                                                  right: 6),
                                              child: Container(
                                                width: 28,
                                                height: 28,
                                                decoration: const BoxDecoration(
                                                  color: CustomAppColors
                                                      .appWhiteColor,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 4, 9, 2),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 4, 9, 2),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 2, 9, 2),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 10, 9, 2),
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
                                              color:
                                                  CustomAppColors.lblOrgColor,
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
                                  padding:
                                      const EdgeInsets.only(left: 7, top: 2),
                                  child: Container(
                                    height: 30,
                                    width: 142,
                                    decoration: BoxDecoration(
                                      color: CustomAppColors.lblOrgColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: Center(
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
                          16.widthBox,
                          Container(
                            width: (screenSize.width - 64) / 2,
                            height: 270,
                            decoration: const BoxDecoration(
                              color: CustomAppColors.cardBGColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 154,
                                  width: (screenSize.width - 64) / 2,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        AppImages.ProfileMyFavorite,
                                      ),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  color: CustomAppColors
                                                      .lblOrgColor,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                              padding: const EdgeInsets.only(
                                                  right: 6),
                                              child: Container(
                                                width: 28,
                                                height: 28,
                                                decoration: const BoxDecoration(
                                                  color: CustomAppColors
                                                      .appWhiteColor,
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 4, 9, 2),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 4, 9, 2),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 2, 9, 2),
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
                                  padding:
                                      const EdgeInsets.fromLTRB(9, 10, 9, 2),
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
                                              color:
                                                  CustomAppColors.lblOrgColor,
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
                                  padding:
                                      const EdgeInsets.only(left: 7, top: 2),
                                  child: Container(
                                    height: 30,
                                    width: 142,
                                    decoration: BoxDecoration(
                                      color: CustomAppColors.lblOrgColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    ),
                                    child: arrMyFavoriteLis[0]['favoriteID']
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
                                                      topLeft:
                                                          Radius.circular(8),
                                                      bottomLeft:
                                                          Radius.circular(8),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                                  FontWeight
                                                                      .w800,
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
                                                                  FontWeight
                                                                      .w800,
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
                                                                  FontWeight
                                                                      .w800,
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
                                                          image: AssetImage(
                                                              AppImages
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
                                                  image: AssetImage(AppImages
                                                      .ProfileAddToCart),
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              18.heightBox,
              Container(
                height: 250,
                width: (screenSize.width - 48),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: (screenSize.width - 48),
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: CustomeTextStyle(
                          text: "Top Brands We deal with...",
                          size: 18,
                          fontWeight: FontWeight.w600,
                          color: CustomAppColors.lblDarkColor,
                          wordSpacing: 0.5,
                        ),
                      ),
                    ),
                    16.heightBox,
                    Container(
                      width: (screenSize.width - 48),
                      height: 194,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: (screenSize.width - 48),
                            height: 56,
                            // color: Colors.deepPurple,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1, //
                                  child: Container(
                                    height: 56,
                                    width: (screenSize.width - 68) / 2,
                                    decoration: BoxDecoration(
                                      // color: Colors.red,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          AppImages.HomeTopBrands1Icon,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                20.widthBox,
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 56,
                                    width: (screenSize.width - 68) / 2,
                                    decoration: BoxDecoration(
                                      // color: Colors.red,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          AppImages.HomeTopBrands2Icon,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                20.widthBox,
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 56,
                                    width: (screenSize.width - 68) / 2,
                                    decoration: BoxDecoration(
                                      // color: Colors.red,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          AppImages.HomeTopBrands3Icon,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          12.heightBox,
                          Container(
                            width: (screenSize.width - 48),
                            height: 56,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 56,
                                    width: (screenSize.width - 68) / 2,
                                    decoration: BoxDecoration(
                                      // color: Colors.red,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          AppImages.HomeTopBrands4Icon,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                20.widthBox,
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 56,
                                    width: (screenSize.width - 68) / 2,
                                    decoration: BoxDecoration(
                                      // color: Colors.red,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          AppImages.HomeTopBrands5Icon,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                20.widthBox,
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 56,
                                    width: (screenSize.width - 68) / 2,
                                    decoration: BoxDecoration(
                                      // color: Colors.red,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          AppImages.HomeTopBrands6Icon,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          12.heightBox,
                          Container(
                            width: (screenSize.width - 48),
                            height: 56,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 56,
                                    width: (screenSize.width - 68) / 2,
                                    decoration: BoxDecoration(
                                      // color: Colors.red,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          AppImages.HomeTopBrands7Icon,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                20.widthBox,
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 56,
                                    width: (screenSize.width - 68) / 2,
                                    decoration: BoxDecoration(
                                      // color: Colors.red,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                          AppImages.HomeTopBrands8Icon,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                20.widthBox,
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 56,
                                    width: (screenSize.width - 68) / 2,
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
              20.heightBox,
            ],
          ),
        ),
      ),
    );
  }
}
