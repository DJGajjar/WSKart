import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wskart/Constants/convert_data.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/HomeController/MoreProduct/MoreProductView.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyFavorite/ProductDetail/ProductDetailView.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';
import '../../../../Constants/ServiceList.dart';
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

    HomeController homeListController = Get.put(HomeController());

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

    var arrMyFavoriteLis = [
      {
        'favoriteID': '0',
      },
    ];

    final getStorge = GetStorage();
    final screenSize = MediaQuery.of(context).size;

    ContainerTransitionType _transitionType = ContainerTransitionType.fade;

    double deviceHeight(BuildContext context) => screenSize.height / 2;
    print('VAlue if Height: ${deviceHeight(context)}');

    controller.onInit();

    var catSelectIndex = 0.obs;

    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: formGlobalKey,
          child: Obx(() => homeListController.isHomeLoading.value
              ? Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: deviceHeight(context) - 120,
                    ),
                    child: CircularProgressIndicator(
                      color: CustomAppColors.lblOrgColor,
                      backgroundColor: CustomAppColors.switchOrgColor,
                    ),
                  ),
                )
              : Column(
                  children: [
                    Container(
                      height: 60,
                      width: (MediaQuery.of(context).size.width),
                      color: CustomAppColors.searchBarBGColor,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(24, 12, 24, 12),
                        child: SizedBox.fromSize(
                          size: Size(
                              (MediaQuery.of(context).size.width - 48), 36),
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
                                padding:
                                    const EdgeInsets.only(left: 20, top: 10),
                                child: CustomeTextStyle(
                                  text: "Search For Products",
                                  size: 12,
                                  fontWeight: FontWeight.w400,
                                  color:
                                      CustomAppColors.searchBarPlaceholderColor,
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
                                  width:
                                      (MediaQuery.of(context).size.width - 48),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(AppImages.HomeBestSale),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 26, top: 12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 150,
                                          child: CustomeTextStyle(
                                            text: "Best range curtain bracket",
                                            size: 10,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                CustomAppColors.switchOrgColor,
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
                                            color:
                                                CustomAppColors.appWhiteColor,
                                            wordSpacing: 0.5,
                                          ),
                                        ),
                                        8.heightBox,
                                        Container(
                                          width: 60,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            color:
                                                CustomAppColors.appWhiteColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(6)),
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
                      width: (screenSize.width - 48),
                      height: 84,
                      child: homeListController.randomProducts!.length == 0
                          ? Center()
                          : ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemCount:
                                  homeListController.randomProducts!.length,
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
                                          color: CustomAppColors.borderColor,
                                          width: 1),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 75,
                                            width: 92,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(
                                                  '${homeListController.randomProducts?[index].images?.length == 0 ? AppService.noImageUrl : homeListController.randomProducts?[index].images?[0]['src'].toString()}',
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                9, 11, 9, 2),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width:
                                                      (screenSize.width - 210),
                                                  child: CustomeTextStyle(
                                                    text:
                                                        '${homeListController.randomProducts?[index].name ?? ''}',
                                                    size: 12,
                                                    fontWeight: FontWeight.w600,
                                                    color: CustomAppColors
                                                        .lblDarkColor,
                                                    wordSpacing: 0.5,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          0, 5, 9, 2),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      RatingBarIndicator(
                                                        rating: ConvertData
                                                            .stringToDouble(
                                                                '${homeListController.randomProducts?[index].averageRating ?? 0.0}'),
                                                        itemCount: 5,
                                                        itemSize: 12.0,
                                                        itemBuilder:
                                                            (context, _) =>
                                                                const Icon(
                                                          Icons.star,
                                                          color: CustomAppColors
                                                              .lblOrgColor,
                                                        ),
                                                      ),
                                                      4.widthBox,
                                                      CustomeTextStyle(
                                                        text:
                                                            '(${homeListController.randomProducts?[index].ratingCount.toString() ?? "0"})',
                                                        size: 10,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: CustomAppColors
                                                            .txtPlaceholderColor,
                                                        wordSpacing: 0.5,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                homeListController
                                                            .randomProducts?[
                                                                index]
                                                            .onSale ==
                                                        true
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                0, 10, 9, 2),
                                                        child: Container(
                                                          width: 120,
                                                          height: 10,
                                                          child: RichText(
                                                            text: TextSpan(
                                                              children: [
                                                                TextSpan(
                                                                  text: ' ₹'
                                                                      '${homeListController.randomProducts?[index].regularPrice ?? "0"}',
                                                                  style:
                                                                      TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough,
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontSize:
                                                                        10,
                                                                    color: CustomAppColors
                                                                        .txtPlaceholderColor,
                                                                    wordSpacing:
                                                                        1,
                                                                    height: 0.5,
                                                                  ),
                                                                ),
                                                                TextSpan(
                                                                  text: ' ₹'
                                                                      '${homeListController.randomProducts?[index].salePrice ?? "0"}',
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        'Inter',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    fontSize:
                                                                        10,
                                                                    color: CustomAppColors
                                                                        .lblOrgColor,
                                                                    wordSpacing:
                                                                        1,
                                                                    height: 0.5,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            textAlign:
                                                                TextAlign.left,
                                                          ),
                                                        ),
                                                      )
                                                    : Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .fromLTRB(
                                                                9, 8, 9, 4),
                                                        child: Container(
                                                          width: 120,
                                                          height: 10,
                                                          child:
                                                              CustomeTextStyle(
                                                            text: ' ₹'
                                                                '${homeListController.randomProducts?[index].regularPrice ?? "0"}',
                                                            size: 10,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            color:
                                                                CustomAppColors
                                                                    .lblOrgColor,
                                                            wordSpacing: 0.5,
                                                          ),
                                                        ),
                                                      ),
                                                /*Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(0, 8, 9, 2),
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
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
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
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 10,
                                                                color: CustomAppColors
                                                                    .lblOrgColor,
                                                                wordSpacing: 1,
                                                                height: 0.5,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  ),*/
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
                                return const SizedBox(width: 24);
                              }),
                    ),
                    16.heightBox,
                    Container(
                      height: 128,
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
                                      padding: const EdgeInsets.only(
                                          left: 16, top: 5),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 68,
                                            height: 16,
                                            child: CustomeTextStyle(
                                              text: "More Products",
                                              size: 9,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  CustomAppColors.lblOrgColor,
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
                            height: 88,
                            child: homeListController.categories!.length == 0
                                ? Center()
                                : ListView.separated(
                                    scrollDirection: Axis.horizontal,
                                    itemCount:
                                        homeListController.categories!.length,
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        focusColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        onTap: () {
                                          catSelectIndex.value = index;
                                          print(
                                              'Click to Categories Detail: $catSelectIndex');
                                        },
                                        child: Container(
                                          height: 88,
                                          width: 70,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Center(
                                                child: Container(
                                                  height: 52,
                                                  width: 52,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.fill,
                                                      image: NetworkImage(
                                                        '${homeListController.categories?[index].image?.length == 0 ? AppService.noImageUrl : homeListController.categories?[index].image?['src'].toString()}',
                                                      ),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(52),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              6.heightBox,
                                              Center(
                                                child: Container(
                                                  width: 70,
                                                  height: 30,
                                                  // color: Colors.red,
                                                  child: CustomeTextStyle(
                                                    textAlign: TextAlign.center,
                                                    text:
                                                        '${homeListController.categories?[index].name ?? ''}',
                                                    size: 10,
                                                    fontWeight: FontWeight.w600,
                                                    color: CustomAppColors
                                                        .lblDarkColor,
                                                    wordSpacing: 0.5,
                                                  ),
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
                      height: 338,
                      width: (screenSize.width - 48),
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
                                    print(
                                        'Click to Today Best Deal More Detail');
                                    getStorge.write("BrandProduct", "No");
                                    getStorge.write(
                                        "NavTitle", "Today's Best Deal");
                                    Get.toNamed(Routes.MOREPRODUCTLISTROUTES);
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
                                      padding: const EdgeInsets.only(
                                          left: 16, top: 5),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 68,
                                            height: 16,
                                            child: CustomeTextStyle(
                                              text: "More Products",
                                              size: 9,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  CustomAppColors.lblOrgColor,
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
                            child: homeListController.todayProducts!.length < 1
                                ? Center()
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: (screenSize.width - 64) / 2,
                                        height: 290,
                                        decoration: const BoxDecoration(
                                          color: CustomAppColors.cardBGColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 154,
                                              width:
                                                  (screenSize.width - 64) / 2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                    '${homeListController.todayProducts?[0].images?.length == 0 ? AppService.noImageUrl : homeListController.todayProducts?[0].images?[0]['src'].toString()}',
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 40,
                                                    width: 156,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        homeListController
                                                                    .discountTodayPercentage1 !=
                                                                0.0
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top: 0,
                                                                        left:
                                                                            6),
                                                                child:
                                                                    Container(
                                                                  width: 36,
                                                                  height: 16,
                                                                  // color: CustomAppColors.lblOrgColor,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: CustomAppColors
                                                                        .lblOrgColor,
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(8)),
                                                                  ),
                                                                  child: Center(
                                                                    child:
                                                                        CustomeTextStyle(
                                                                      text: homeListController
                                                                              .discountTodayPercentage1
                                                                              .toString() +
                                                                          '%',
                                                                      size: 10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: CustomAppColors
                                                                          .appWhiteColor,
                                                                      wordSpacing:
                                                                          0.5,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            : Container(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 6),
                                                          child: Container(
                                                            width: 28,
                                                            height: 28,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: CustomAppColors
                                                                  .appWhiteColor,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          28)),
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
                                                  const EdgeInsets.fromLTRB(
                                                      9, 4, 9, 2),
                                              child: Container(
                                                child: CustomeTextStyle(
                                                  text:
                                                      '${homeListController.todayProducts?[0].name ?? ''}',
                                                  size: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      9, 4, 9, 2),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  RatingBarIndicator(
                                                    rating: ConvertData
                                                        .stringToDouble(
                                                            '${homeListController.todayProducts?[0].averageRating ?? 0.0}'),
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
                                                    text:
                                                        '(${homeListController.todayProducts?[0].ratingCount.toString() ?? "0"})',
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 2, 9, 2),
                                              child: Container(
                                                width: 120,
                                                height: 10,
                                                child: CustomeTextStyle(
                                                  text:
                                                      '${homeListController.todayProducts?[0].stockStatus ?? ""}',
                                                  size: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                            homeListController.todayProducts?[0]
                                                        .onSale ==
                                                    true
                                                ? Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(9, 10, 9, 2),
                                                    child: Container(
                                                      width: 120,
                                                      height: 10,
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: ' ₹'
                                                                  '${homeListController.todayProducts?[0].regularPrice ?? "0"}',
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 10,
                                                                color: CustomAppColors
                                                                    .txtPlaceholderColor,
                                                                wordSpacing: 1,
                                                                height: 0.5,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: ' ₹'
                                                                  '${homeListController.todayProducts?[0].salePrice ?? "0"}',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 10,
                                                                color: CustomAppColors
                                                                    .lblOrgColor,
                                                                wordSpacing: 1,
                                                                height: 0.5,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  )
                                                : Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(9, 8, 9, 4),
                                                    child: Container(
                                                      width: 120,
                                                      height: 10,
                                                      child: CustomeTextStyle(
                                                        text: ' ₹'
                                                            '${homeListController.todayProducts?[0].regularPrice ?? "0"}',
                                                        size: 10,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: CustomAppColors
                                                            .lblOrgColor,
                                                        wordSpacing: 0.5,
                                                      ),
                                                    ),
                                                  ),
                                            InkWell(
                                              focusColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onTap: () {
                                                print(
                                                    'Today Add To Cart Item: ${homeListController.todayProducts?[0].id ?? 0}');
                                                if (getStorge.read("isLogin") ==
                                                    null) {
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 100),
                                                      () {
                                                    Get.find<HomeController>()
                                                        .LoginScreen();
                                                  });
                                                }
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 7, top: 2),
                                                child: Container(
                                                  height: 30,
                                                  width: 142,
                                                  decoration: BoxDecoration(
                                                    color: CustomAppColors
                                                        .lblOrgColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
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
                                            )
                                          ],
                                        ),
                                      ),
                                      16.widthBox,
                                      Container(
                                        width: (screenSize.width - 64) / 2,
                                        height: 290,
                                        decoration: const BoxDecoration(
                                          color: CustomAppColors.cardBGColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 154,
                                              width:
                                                  (screenSize.width - 64) / 2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                    '${homeListController.todayProducts?[1].images?.length == 0 ? AppService.noImageUrl : homeListController.todayProducts?[1].images?[0]['src'].toString()}',
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 40,
                                                    width: 156,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        homeListController
                                                                    .discountTodayPercentage2 !=
                                                                0.0
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top: 0,
                                                                        left:
                                                                            6),
                                                                child:
                                                                    Container(
                                                                  width: 36,
                                                                  height: 16,
                                                                  // color: CustomAppColors.lblOrgColor,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: CustomAppColors
                                                                        .lblOrgColor,
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(8)),
                                                                  ),
                                                                  child: Center(
                                                                    child:
                                                                        CustomeTextStyle(
                                                                      text: homeListController
                                                                              .discountTodayPercentage2
                                                                              .toString() +
                                                                          '%',
                                                                      size: 10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: CustomAppColors
                                                                          .appWhiteColor,
                                                                      wordSpacing:
                                                                          0.5,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            : Container(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 6),
                                                          child: Container(
                                                            width: 28,
                                                            height: 28,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: CustomAppColors
                                                                  .appWhiteColor,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          28)),
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
                                                  const EdgeInsets.fromLTRB(
                                                      9, 4, 9, 2),
                                              child: Container(
                                                child: CustomeTextStyle(
                                                  text:
                                                      '${homeListController.todayProducts?[1].name ?? ''}',
                                                  size: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      9, 4, 9, 2),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  RatingBarIndicator(
                                                    rating: ConvertData
                                                        .stringToDouble(
                                                            '${homeListController.todayProducts?[1].averageRating ?? 0.0}'),
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
                                                    text:
                                                        '(${homeListController.todayProducts?[1].ratingCount.toString() ?? "0"})',
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 2, 9, 2),
                                              child: Container(
                                                width: 120,
                                                height: 10,
                                                child: CustomeTextStyle(
                                                  text:
                                                      '${homeListController.todayProducts?[1].stockStatus ?? ""}',
                                                  size: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                            homeListController.todayProducts?[1]
                                                        .onSale ==
                                                    true
                                                ? Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(9, 10, 9, 2),
                                                    child: Container(
                                                      width: 120,
                                                      height: 10,
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: ' ₹'
                                                                  '${homeListController.todayProducts?[1].regularPrice ?? "0"}',
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 10,
                                                                color: CustomAppColors
                                                                    .txtPlaceholderColor,
                                                                wordSpacing: 1,
                                                                height: 0.5,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: ' ₹'
                                                                  '${homeListController.todayProducts?[1].salePrice ?? "0"}',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 10,
                                                                color: CustomAppColors
                                                                    .lblOrgColor,
                                                                wordSpacing: 1,
                                                                height: 0.5,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  )
                                                : Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(9, 8, 9, 4),
                                                    child: Container(
                                                      width: 120,
                                                      height: 10,
                                                      child: CustomeTextStyle(
                                                        text: ' ₹'
                                                            '${homeListController.todayProducts?[1].regularPrice ?? "0"}',
                                                        size: 10,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: CustomAppColors
                                                            .lblOrgColor,
                                                        wordSpacing: 0.5,
                                                      ),
                                                    ),
                                                  ),
                                            InkWell(
                                              focusColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onTap: () {
                                                print(
                                                    'Today Add To Cart Item: ${homeListController.todayProducts?[1].id ?? 0}');
                                                if (getStorge.read("isLogin") ==
                                                    null) {
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 100),
                                                      () {
                                                    Get.find<HomeController>()
                                                        .LoginScreen();
                                                  });
                                                }
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 7, top: 2),
                                                child: Container(
                                                  height: 30,
                                                  width: 142,
                                                  decoration: BoxDecoration(
                                                    color: CustomAppColors
                                                        .lblOrgColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                  ),
                                                  child: arrMyFavoriteLis[0]
                                                                  ['favoriteID']
                                                              .toString() ==
                                                          '1'
                                                      ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                height: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: CustomAppColors
                                                                      .cartCountBGColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8),
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
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              CustomeTextStyle(
                                                                            text:
                                                                                "-",
                                                                            size:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w800,
                                                                            color:
                                                                                CustomAppColors.appWhiteColor,
                                                                            wordSpacing:
                                                                                0.5,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              CustomeTextStyle(
                                                                            text:
                                                                                "1",
                                                                            size:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w800,
                                                                            color:
                                                                                CustomAppColors.appWhiteColor,
                                                                            wordSpacing:
                                                                                0.5,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              CustomeTextStyle(
                                                                            text:
                                                                                "+",
                                                                            size:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w800,
                                                                            color:
                                                                                CustomAppColors.appWhiteColor,
                                                                            wordSpacing:
                                                                                0.5,
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
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: CustomAppColors
                                                                      .lblOrgColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8),
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child:
                                                                      Container(
                                                                    width: 16,
                                                                    height: 16,
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      image:
                                                                          DecorationImage(
                                                                        image: AssetImage(
                                                                            AppImages.ProfileAddToCart),
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
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image: AssetImage(
                                                                    AppImages
                                                                        .ProfileAddToCart),
                                                              ),
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
                      height: 338,
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
                                    getStorge.write("BrandProduct", "No");
                                    getStorge.write("NavTitle", "Best Selling");
                                    Get.toNamed(Routes.MOREPRODUCTLISTROUTES);
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
                                      padding: const EdgeInsets.only(
                                          left: 16, top: 5),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 68,
                                            height: 16,
                                            child: CustomeTextStyle(
                                              text: "More Products",
                                              size: 9,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  CustomAppColors.lblOrgColor,
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
                            child: homeListController.bestProducts!.length < 1
                                ? Center()
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: (screenSize.width - 64) / 2,
                                        height: 290,
                                        decoration: const BoxDecoration(
                                          color: CustomAppColors.cardBGColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 154,
                                              width:
                                                  (screenSize.width - 64) / 2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                    '${homeListController.bestProducts?[0].images?.length == 0 ? AppService.noImageUrl : homeListController.bestProducts?[0].images?[0]['src'].toString()}',
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 40,
                                                    width: 156,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        homeListController
                                                                    .discountBestPercentage1 !=
                                                                0.0
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top: 0,
                                                                        left:
                                                                            6),
                                                                child:
                                                                    Container(
                                                                  width: 36,
                                                                  height: 16,
                                                                  // color: CustomAppColors.lblOrgColor,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: CustomAppColors
                                                                        .lblOrgColor,
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(8)),
                                                                  ),
                                                                  child: Center(
                                                                    child:
                                                                        CustomeTextStyle(
                                                                      text: homeListController
                                                                              .discountBestPercentage1
                                                                              .toString() +
                                                                          '%',
                                                                      size: 10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: CustomAppColors
                                                                          .appWhiteColor,
                                                                      wordSpacing:
                                                                          0.5,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            : Container(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 6),
                                                          child: Container(
                                                            width: 28,
                                                            height: 28,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: CustomAppColors
                                                                  .appWhiteColor,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          28)),
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
                                                  const EdgeInsets.fromLTRB(
                                                      9, 4, 9, 2),
                                              child: Container(
                                                child: CustomeTextStyle(
                                                  text:
                                                      '${homeListController.bestProducts?[0].name ?? ''}',
                                                  size: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      9, 4, 9, 2),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  RatingBarIndicator(
                                                    rating: ConvertData
                                                        .stringToDouble(
                                                            '${homeListController.bestProducts?[0].averageRating ?? 0.0}'),
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
                                                    text:
                                                        '(${homeListController.bestProducts?[0].ratingCount.toString() ?? "0"})',
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 2, 9, 2),
                                              child: Container(
                                                width: 120,
                                                height: 10,
                                                child: CustomeTextStyle(
                                                  text:
                                                      '${homeListController.bestProducts?[0].stockStatus ?? ""}',
                                                  size: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                            homeListController.bestProducts?[0]
                                                        .onSale ==
                                                    true
                                                ? Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(9, 10, 9, 2),
                                                    child: Container(
                                                      width: 120,
                                                      height: 10,
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: ' ₹'
                                                                  '${homeListController.bestProducts?[0].regularPrice ?? "0"}',
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 10,
                                                                color: CustomAppColors
                                                                    .txtPlaceholderColor,
                                                                wordSpacing: 1,
                                                                height: 0.5,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: ' ₹'
                                                                  '${homeListController.bestProducts?[0].salePrice ?? "0"}',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 10,
                                                                color: CustomAppColors
                                                                    .lblOrgColor,
                                                                wordSpacing: 1,
                                                                height: 0.5,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  )
                                                : Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(9, 8, 9, 4),
                                                    child: Container(
                                                      width: 120,
                                                      height: 10,
                                                      child: CustomeTextStyle(
                                                        text: ' ₹'
                                                            '${homeListController.bestProducts?[0].regularPrice ?? "0"}',
                                                        size: 10,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: CustomAppColors
                                                            .lblOrgColor,
                                                        wordSpacing: 0.5,
                                                      ),
                                                    ),
                                                  ),
                                            InkWell(
                                              focusColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onTap: () {
                                                print(
                                                    'Best Add To Cart Item: ${homeListController.bestProducts?[0].id ?? 0}');
                                                if (getStorge.read("isLogin") ==
                                                    null) {
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 100),
                                                      () {
                                                    Get.find<HomeController>()
                                                        .LoginScreen();
                                                  });
                                                }
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 7, top: 2),
                                                child: Container(
                                                  height: 30,
                                                  width: 142,
                                                  decoration: BoxDecoration(
                                                    color: CustomAppColors
                                                        .lblOrgColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
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
                                            )
                                          ],
                                        ),
                                      ),
                                      16.widthBox,
                                      Container(
                                        width: (screenSize.width - 64) / 2,
                                        height: 290,
                                        decoration: const BoxDecoration(
                                          color: CustomAppColors.cardBGColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 154,
                                              width:
                                                  (screenSize.width - 64) / 2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                image: DecorationImage(
                                                  fit: BoxFit.fill,
                                                  image: NetworkImage(
                                                    '${homeListController.bestProducts?[1].images?.length == 0 ? AppService.noImageUrl : homeListController.bestProducts?[1].images?[0]['src'].toString()}',
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 40,
                                                    width: 156,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        homeListController
                                                                    .discountBestPercentage2 !=
                                                                0.0
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top: 0,
                                                                        left:
                                                                            6),
                                                                child:
                                                                    Container(
                                                                  width: 36,
                                                                  height: 16,
                                                                  // color: CustomAppColors.lblOrgColor,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: CustomAppColors
                                                                        .lblOrgColor,
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(8)),
                                                                  ),
                                                                  child: Center(
                                                                    child:
                                                                        CustomeTextStyle(
                                                                      text: homeListController
                                                                              .discountBestPercentage2
                                                                              .toString() +
                                                                          '%',
                                                                      size: 10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: CustomAppColors
                                                                          .appWhiteColor,
                                                                      wordSpacing:
                                                                          0.5,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            : Container(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 6),
                                                          child: Container(
                                                            width: 28,
                                                            height: 28,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: CustomAppColors
                                                                  .appWhiteColor,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          28)),
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
                                                  const EdgeInsets.fromLTRB(
                                                      9, 4, 9, 2),
                                              child: Container(
                                                child: CustomeTextStyle(
                                                  text:
                                                      '${homeListController.bestProducts?[1].name ?? ''}',
                                                  size: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      9, 4, 9, 2),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  RatingBarIndicator(
                                                    rating: ConvertData
                                                        .stringToDouble(
                                                            '${homeListController.bestProducts?[1].averageRating ?? 0.0}'),
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
                                                    text:
                                                        '(${homeListController.bestProducts?[1].ratingCount.toString() ?? "0"})',
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 2, 9, 2),
                                              child: Container(
                                                width: 120,
                                                height: 10,
                                                child: CustomeTextStyle(
                                                  text:
                                                      '${homeListController.bestProducts?[1].stockStatus ?? ""}',
                                                  size: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                            homeListController.bestProducts?[1]
                                                        .onSale ==
                                                    true
                                                ? Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(9, 10, 9, 2),
                                                    child: Container(
                                                      width: 120,
                                                      height: 10,
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: ' ₹'
                                                                  '${homeListController.bestProducts?[1].regularPrice ?? "0"}',
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 10,
                                                                color: CustomAppColors
                                                                    .txtPlaceholderColor,
                                                                wordSpacing: 1,
                                                                height: 0.5,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: ' ₹'
                                                                  '${homeListController.bestProducts?[1].salePrice ?? "0"}',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 10,
                                                                color: CustomAppColors
                                                                    .lblOrgColor,
                                                                wordSpacing: 1,
                                                                height: 0.5,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  )
                                                : Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(9, 8, 9, 4),
                                                    child: Container(
                                                      width: 120,
                                                      height: 10,
                                                      child: CustomeTextStyle(
                                                        text: ' ₹'
                                                            '${homeListController.bestProducts?[1].regularPrice ?? "0"}',
                                                        size: 10,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: CustomAppColors
                                                            .lblOrgColor,
                                                        wordSpacing: 0.5,
                                                      ),
                                                    ),
                                                  ),
                                            InkWell(
                                              focusColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onTap: () {
                                                print(
                                                    'Best Add To Cart Item: ${homeListController.bestProducts?[1].id ?? 0}');
                                                if (getStorge.read("isLogin") ==
                                                    null) {
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 100),
                                                      () {
                                                    Get.find<HomeController>()
                                                        .LoginScreen();
                                                  });
                                                }
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 7, top: 2),
                                                child: Container(
                                                  height: 30,
                                                  width: 142,
                                                  decoration: BoxDecoration(
                                                    color: CustomAppColors
                                                        .lblOrgColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                  ),
                                                  child: arrMyFavoriteLis[0]
                                                                  ['favoriteID']
                                                              .toString() ==
                                                          '1'
                                                      ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                height: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: CustomAppColors
                                                                      .cartCountBGColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8),
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
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              CustomeTextStyle(
                                                                            text:
                                                                                "-",
                                                                            size:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w800,
                                                                            color:
                                                                                CustomAppColors.appWhiteColor,
                                                                            wordSpacing:
                                                                                0.5,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              CustomeTextStyle(
                                                                            text:
                                                                                "1",
                                                                            size:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w800,
                                                                            color:
                                                                                CustomAppColors.appWhiteColor,
                                                                            wordSpacing:
                                                                                0.5,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              CustomeTextStyle(
                                                                            text:
                                                                                "+",
                                                                            size:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w800,
                                                                            color:
                                                                                CustomAppColors.appWhiteColor,
                                                                            wordSpacing:
                                                                                0.5,
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
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: CustomAppColors
                                                                      .lblOrgColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8),
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child:
                                                                      Container(
                                                                    width: 16,
                                                                    height: 16,
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      image:
                                                                          DecorationImage(
                                                                        image: AssetImage(
                                                                            AppImages.ProfileAddToCart),
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
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image: AssetImage(
                                                                    AppImages
                                                                        .ProfileAddToCart),
                                                              ),
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
                      height: 338,
                      width: (screenSize.width - 48),
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
                                    getStorge.write("BrandProduct", "No");
                                    getStorge.write(
                                        "NavTitle", "Newly Arrival");
                                    Get.toNamed(Routes.MOREPRODUCTLISTROUTES);
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
                                      padding: const EdgeInsets.only(
                                          left: 16, top: 5),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 68,
                                            height: 16,
                                            child: CustomeTextStyle(
                                              text: "More Products",
                                              size: 9,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  CustomAppColors.lblOrgColor,
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
                            child: homeListController.newlyProducts!.length < 1
                                ? Center()
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: (screenSize.width - 64) / 2,
                                        height: 290,
                                        decoration: const BoxDecoration(
                                          color: CustomAppColors.cardBGColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 154,
                                              width:
                                                  (screenSize.width - 64) / 2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                image: DecorationImage(
                                                  fit: BoxFit.fitWidth,
                                                  image: NetworkImage(
                                                    '${homeListController.newlyProducts?[0].images?.length == 0 ? AppService.noImageUrl : homeListController.newlyProducts?[0].images?[0]['src'].toString()}',
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 40,
                                                    width: 156,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        homeListController
                                                                    .discountNewlyPercentage1 !=
                                                                0.0
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top: 0,
                                                                        left:
                                                                            6),
                                                                child:
                                                                    Container(
                                                                  width: 36,
                                                                  height: 16,
                                                                  // color: CustomAppColors.lblOrgColor,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: CustomAppColors
                                                                        .lblOrgColor,
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(8)),
                                                                  ),
                                                                  child: Center(
                                                                    child:
                                                                        CustomeTextStyle(
                                                                      text: homeListController
                                                                              .discountNewlyPercentage1
                                                                              .toString() +
                                                                          '%',
                                                                      size: 10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: CustomAppColors
                                                                          .appWhiteColor,
                                                                      wordSpacing:
                                                                          0.5,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            : Container(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 6),
                                                          child: Container(
                                                            width: 28,
                                                            height: 28,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: CustomAppColors
                                                                  .appWhiteColor,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          28)),
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
                                                  const EdgeInsets.fromLTRB(
                                                      9, 4, 9, 2),
                                              child: Container(
                                                child: CustomeTextStyle(
                                                  text:
                                                      '${homeListController.newlyProducts?[0].name ?? ''}',
                                                  size: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      9, 4, 9, 2),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  RatingBarIndicator(
                                                    rating: ConvertData
                                                        .stringToDouble(
                                                            '${homeListController.newlyProducts?[0].averageRating ?? 0.0}'),
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
                                                    text:
                                                        '(${homeListController.newlyProducts?[0].ratingCount.toString() ?? "0"})',
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 2, 9, 2),
                                              child: Container(
                                                width: 120,
                                                height: 10,
                                                child: CustomeTextStyle(
                                                  text:
                                                      '${homeListController.newlyProducts?[0].stockStatus ?? ""}',
                                                  size: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                            homeListController.newlyProducts?[0]
                                                        .onSale ==
                                                    true
                                                ? Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(9, 10, 9, 2),
                                                    child: Container(
                                                      width: 120,
                                                      height: 10,
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: ' ₹'
                                                                  '${homeListController.newlyProducts?[0].regularPrice ?? "0"}',
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 10,
                                                                color: CustomAppColors
                                                                    .txtPlaceholderColor,
                                                                wordSpacing: 1,
                                                                height: 0.5,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: ' ₹'
                                                                  '${homeListController.newlyProducts?[0].salePrice ?? "0"}',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 10,
                                                                color: CustomAppColors
                                                                    .lblOrgColor,
                                                                wordSpacing: 1,
                                                                height: 0.5,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  )
                                                : Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(9, 8, 9, 4),
                                                    child: Container(
                                                      width: 120,
                                                      height: 10,
                                                      child: CustomeTextStyle(
                                                        text: ' ₹'
                                                            '${homeListController.newlyProducts?[0].regularPrice ?? "0"}',
                                                        size: 10,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: CustomAppColors
                                                            .lblOrgColor,
                                                        wordSpacing: 0.5,
                                                      ),
                                                    ),
                                                  ),
                                            InkWell(
                                              focusColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onTap: () {
                                                print(
                                                    'Newly Add To Cart Item: ${homeListController.newlyProducts?[0].id ?? 0}');
                                                if (getStorge.read("isLogin") ==
                                                    null) {
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 100),
                                                      () {
                                                    Get.find<HomeController>()
                                                        .LoginScreen();
                                                  });
                                                }
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 7, top: 2),
                                                child: Container(
                                                  height: 30,
                                                  width: 142,
                                                  decoration: BoxDecoration(
                                                    color: CustomAppColors
                                                        .lblOrgColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
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
                                            )
                                          ],
                                        ),
                                      ),
                                      16.widthBox,
                                      Container(
                                        width: (screenSize.width - 64) / 2,
                                        height: 290,
                                        decoration: const BoxDecoration(
                                          color: CustomAppColors.cardBGColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 154,
                                              width:
                                                  (screenSize.width - 64) / 2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                image: DecorationImage(
                                                  fit: BoxFit.fitWidth,
                                                  image: NetworkImage(
                                                    '${homeListController.newlyProducts?[1].images?.length == 0 ? AppService.noImageUrl : homeListController.newlyProducts?[1].images?[0]['src'].toString()}',
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 40,
                                                    width: 156,
                                                    child: homeListController
                                                                .discountNewlyPercentage2 !=
                                                            0.0
                                                        ? Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top: 0,
                                                                        left:
                                                                            6),
                                                                child:
                                                                    Container(
                                                                  width: 36,
                                                                  height: 16,
                                                                  // color: CustomAppColors.lblOrgColor,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: CustomAppColors
                                                                        .lblOrgColor,
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(8)),
                                                                  ),
                                                                  child: Center(
                                                                    child:
                                                                        CustomeTextStyle(
                                                                      text: homeListController
                                                                              .discountNewlyPercentage2
                                                                              .toString() +
                                                                          '%',
                                                                      size: 10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: CustomAppColors
                                                                          .appWhiteColor,
                                                                      wordSpacing:
                                                                          0.5,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            6),
                                                                child:
                                                                    Container(
                                                                  width: 28,
                                                                  height: 28,
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    color: CustomAppColors
                                                                        .appWhiteColor,
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(28)),
                                                                  ),
                                                                  child: Center(
                                                                    child:
                                                                        Container(
                                                                      width: 16,
                                                                      height:
                                                                          16,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                        image:
                                                                            DecorationImage(
                                                                          image:
                                                                              AssetImage(AppImages.ProfileFavoriteIcon),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        : Container(),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      9, 4, 9, 2),
                                              child: Container(
                                                child: CustomeTextStyle(
                                                  text:
                                                      '${homeListController.newlyProducts?[1].name ?? ''}',
                                                  size: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      9, 4, 9, 2),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  RatingBarIndicator(
                                                    rating: ConvertData
                                                        .stringToDouble(
                                                            '${homeListController.newlyProducts?[1].averageRating ?? 0.0}'),
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
                                                    text:
                                                        '(${homeListController.newlyProducts?[1].ratingCount.toString() ?? "0"})',
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 2, 9, 2),
                                              child: Container(
                                                width: 120,
                                                height: 10,
                                                child: CustomeTextStyle(
                                                  text:
                                                      '${homeListController.newlyProducts?[1].stockStatus ?? ""}',
                                                  size: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                            homeListController.newlyProducts?[1]
                                                        .onSale ==
                                                    true
                                                ? Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(9, 10, 9, 2),
                                                    child: Container(
                                                      width: 120,
                                                      height: 10,
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: ' ₹'
                                                                  '${homeListController.newlyProducts?[1].regularPrice ?? "0"}',
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 10,
                                                                color: CustomAppColors
                                                                    .txtPlaceholderColor,
                                                                wordSpacing: 1,
                                                                height: 0.5,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: ' ₹'
                                                                  '${homeListController.newlyProducts?[1].salePrice ?? "0"}',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 10,
                                                                color: CustomAppColors
                                                                    .lblOrgColor,
                                                                wordSpacing: 1,
                                                                height: 0.5,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  )
                                                : Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(9, 8, 9, 4),
                                                    child: Container(
                                                      width: 120,
                                                      height: 10,
                                                      child: CustomeTextStyle(
                                                        text: ' ₹'
                                                            '${homeListController.newlyProducts?[1].regularPrice ?? "0"}',
                                                        size: 10,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: CustomAppColors
                                                            .lblOrgColor,
                                                        wordSpacing: 0.5,
                                                      ),
                                                    ),
                                                  ),
                                            InkWell(
                                              focusColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onTap: () {
                                                print(
                                                    'Best Add To Cart Item: ${homeListController.newlyProducts?[1].id ?? 0}');
                                                if (getStorge.read("isLogin") ==
                                                    null) {
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 100),
                                                      () {
                                                    Get.find<HomeController>()
                                                        .LoginScreen();
                                                  });
                                                }
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 7, top: 2),
                                                child: Container(
                                                  height: 30,
                                                  width: 142,
                                                  decoration: BoxDecoration(
                                                    color: CustomAppColors
                                                        .lblOrgColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                  ),
                                                  child: arrMyFavoriteLis[0]
                                                                  ['favoriteID']
                                                              .toString() ==
                                                          '1'
                                                      ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                height: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: CustomAppColors
                                                                      .cartCountBGColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8),
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
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              CustomeTextStyle(
                                                                            text:
                                                                                "-",
                                                                            size:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w800,
                                                                            color:
                                                                                CustomAppColors.appWhiteColor,
                                                                            wordSpacing:
                                                                                0.5,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              CustomeTextStyle(
                                                                            text:
                                                                                "1",
                                                                            size:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w800,
                                                                            color:
                                                                                CustomAppColors.appWhiteColor,
                                                                            wordSpacing:
                                                                                0.5,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              CustomeTextStyle(
                                                                            text:
                                                                                "+",
                                                                            size:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w800,
                                                                            color:
                                                                                CustomAppColors.appWhiteColor,
                                                                            wordSpacing:
                                                                                0.5,
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
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: CustomAppColors
                                                                      .lblOrgColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8),
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child:
                                                                      Container(
                                                                    width: 16,
                                                                    height: 16,
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      image:
                                                                          DecorationImage(
                                                                        image: AssetImage(
                                                                            AppImages.ProfileAddToCart),
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
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image: AssetImage(
                                                                    AppImages
                                                                        .ProfileAddToCart),
                                                              ),
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
                      height: 338,
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
                                      text: "Trending Viewed",
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
                                    print(
                                        'Click to Recently Viewed More Detail');
                                    getStorge.write("BrandProduct", "No");
                                    getStorge.write(
                                        "NavTitle", "Trending Viewed");
                                    Get.toNamed(Routes.MOREPRODUCTLISTROUTES);
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
                                      padding: const EdgeInsets.only(
                                          left: 16, top: 5),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 68,
                                            height: 16,
                                            child: CustomeTextStyle(
                                              text: "More Products",
                                              size: 9,
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  CustomAppColors.lblOrgColor,
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
                            child: homeListController.trendingProducts!.length <
                                    1
                                ? Center()
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: (screenSize.width - 64) / 2,
                                        height: 290,
                                        decoration: const BoxDecoration(
                                          color: CustomAppColors.cardBGColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 154,
                                              width:
                                                  (screenSize.width - 64) / 2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                image: DecorationImage(
                                                  fit: BoxFit.fitWidth,
                                                  image: NetworkImage(
                                                    '${homeListController.trendingProducts?[0].images?.length == 0 ? AppService.noImageUrl : homeListController.trendingProducts?[0].images?[0]['src'].toString()}',
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 40,
                                                    width: 156,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        homeListController
                                                                    .discountTrendingPercentage1 !=
                                                                0.0
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top: 0,
                                                                        left:
                                                                            6),
                                                                child:
                                                                    Container(
                                                                  width: 36,
                                                                  height: 16,
                                                                  // color: CustomAppColors.lblOrgColor,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: CustomAppColors
                                                                        .lblOrgColor,
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(8)),
                                                                  ),
                                                                  child: Center(
                                                                    child:
                                                                        CustomeTextStyle(
                                                                      text:
                                                                          "63%",
                                                                      size: 10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: CustomAppColors
                                                                          .appWhiteColor,
                                                                      wordSpacing:
                                                                          0.5,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            : Container(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 6),
                                                          child: Container(
                                                            width: 28,
                                                            height: 28,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: CustomAppColors
                                                                  .appWhiteColor,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          28)),
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
                                                  const EdgeInsets.fromLTRB(
                                                      9, 4, 9, 2),
                                              child: Container(
                                                child: CustomeTextStyle(
                                                  text:
                                                      '${homeListController.trendingProducts?[0].name ?? ''}',
                                                  size: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      9, 4, 9, 2),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  RatingBarIndicator(
                                                    rating: ConvertData
                                                        .stringToDouble(
                                                            '${homeListController.trendingProducts?[0].averageRating ?? 0.0}'),
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
                                                    text:
                                                        '(${homeListController.trendingProducts?[0].ratingCount.toString() ?? "0"})',
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 2, 9, 2),
                                              child: Container(
                                                width: 120,
                                                height: 10,
                                                child: CustomeTextStyle(
                                                  text:
                                                      '${homeListController.trendingProducts?[0].stockStatus ?? ""}',
                                                  size: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                            homeListController
                                                        .trendingProducts?[0]
                                                        .onSale ==
                                                    true
                                                ? Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(9, 10, 9, 2),
                                                    child: Container(
                                                      width: 120,
                                                      height: 10,
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: ' ₹'
                                                                  '${homeListController.trendingProducts?[0].regularPrice ?? "0"}',
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 10,
                                                                color: CustomAppColors
                                                                    .txtPlaceholderColor,
                                                                wordSpacing: 1,
                                                                height: 0.5,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: ' ₹'
                                                                  '${homeListController.trendingProducts?[0].salePrice ?? "0"}',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 10,
                                                                color: CustomAppColors
                                                                    .lblOrgColor,
                                                                wordSpacing: 1,
                                                                height: 0.5,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  )
                                                : Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(9, 8, 9, 4),
                                                    child: Container(
                                                      width: 120,
                                                      height: 10,
                                                      child: CustomeTextStyle(
                                                        text: ' ₹'
                                                            '${homeListController.trendingProducts?[0].regularPrice ?? "0"}',
                                                        size: 10,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: CustomAppColors
                                                            .lblOrgColor,
                                                        wordSpacing: 0.5,
                                                      ),
                                                    ),
                                                  ),
                                            InkWell(
                                              focusColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onTap: () {
                                                print(
                                                    'Best Add To Cart Item: ${homeListController.trendingProducts?[0].id ?? 0}');
                                                if (getStorge.read("isLogin") ==
                                                    null) {
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 100),
                                                      () {
                                                    Get.find<HomeController>()
                                                        .LoginScreen();
                                                  });
                                                }
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 7, top: 2),
                                                child: Container(
                                                  height: 30,
                                                  width: 142,
                                                  decoration: BoxDecoration(
                                                    color: CustomAppColors
                                                        .lblOrgColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
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
                                            )
                                          ],
                                        ),
                                      ),
                                      16.widthBox,
                                      Container(
                                        width: (screenSize.width - 64) / 2,
                                        height: 290,
                                        decoration: const BoxDecoration(
                                          color: CustomAppColors.cardBGColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 154,
                                              width:
                                                  (screenSize.width - 64) / 2,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                image: DecorationImage(
                                                  fit: BoxFit.fitWidth,
                                                  image: NetworkImage(
                                                    '${homeListController.trendingProducts?[1].images?.length == 0 ? AppService.noImageUrl : homeListController.trendingProducts?[1].images?[0]['src'].toString()}',
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    height: 40,
                                                    width: 156,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        homeListController
                                                                    .discountTrendingPercentage2 !=
                                                                0.0
                                                            ? Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top: 0,
                                                                        left:
                                                                            6),
                                                                child:
                                                                    Container(
                                                                  width: 36,
                                                                  height: 16,
                                                                  // color: CustomAppColors.lblOrgColor,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: CustomAppColors
                                                                        .lblOrgColor,
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(8)),
                                                                  ),
                                                                  child: Center(
                                                                    child:
                                                                        CustomeTextStyle(
                                                                      text: homeListController
                                                                              .discountTrendingPercentage2
                                                                              .toString() +
                                                                          '%',
                                                                      size: 10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      color: CustomAppColors
                                                                          .appWhiteColor,
                                                                      wordSpacing:
                                                                          0.5,
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            : Container(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 6),
                                                          child: Container(
                                                            width: 28,
                                                            height: 28,
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: CustomAppColors
                                                                  .appWhiteColor,
                                                              borderRadius: BorderRadius
                                                                  .all(Radius
                                                                      .circular(
                                                                          28)),
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
                                                  const EdgeInsets.fromLTRB(
                                                      9, 4, 9, 2),
                                              child: Container(
                                                child: CustomeTextStyle(
                                                  text:
                                                      '${homeListController.trendingProducts?[1].name ?? ''}',
                                                  size: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      9, 4, 9, 2),
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  RatingBarIndicator(
                                                    rating: ConvertData
                                                        .stringToDouble(
                                                            '${homeListController.trendingProducts?[1].averageRating ?? 0.0}'),
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
                                                    text:
                                                        '(${homeListController.trendingProducts?[1].ratingCount.toString() ?? "0"})',
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
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 2, 9, 2),
                                              child: Container(
                                                width: 120,
                                                height: 10,
                                                child: CustomeTextStyle(
                                                  text:
                                                      '${homeListController.trendingProducts?[1].stockStatus ?? ""}',
                                                  size: 10,
                                                  fontWeight: FontWeight.w400,
                                                  color: CustomAppColors
                                                      .lblDarkColor,
                                                  wordSpacing: 0.5,
                                                ),
                                              ),
                                            ),
                                            homeListController
                                                        .trendingProducts?[1]
                                                        .onSale ==
                                                    true
                                                ? Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(9, 10, 9, 2),
                                                    child: Container(
                                                      width: 120,
                                                      height: 10,
                                                      child: RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text: ' ₹'
                                                                  '${homeListController.trendingProducts?[1].regularPrice ?? "0"}',
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 10,
                                                                color: CustomAppColors
                                                                    .txtPlaceholderColor,
                                                                wordSpacing: 1,
                                                                height: 0.5,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: ' ₹'
                                                                  '${homeListController.trendingProducts?[1].salePrice ?? "0"}',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontSize: 10,
                                                                color: CustomAppColors
                                                                    .lblOrgColor,
                                                                wordSpacing: 1,
                                                                height: 0.5,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        textAlign:
                                                            TextAlign.left,
                                                      ),
                                                    ),
                                                  )
                                                : Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(9, 8, 9, 4),
                                                    child: Container(
                                                      width: 120,
                                                      height: 10,
                                                      child: CustomeTextStyle(
                                                        text: ' ₹'
                                                            '${homeListController.trendingProducts?[1].regularPrice ?? "0"}',
                                                        size: 10,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: CustomAppColors
                                                            .lblOrgColor,
                                                        wordSpacing: 0.5,
                                                      ),
                                                    ),
                                                  ),
                                            InkWell(
                                              focusColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              splashColor: Colors.transparent,
                                              onTap: () {
                                                print(
                                                    'Trending Add To Cart Item: ${homeListController.trendingProducts?[1].id ?? 0}');
                                                if (getStorge.read("isLogin") ==
                                                    null) {
                                                  Future.delayed(
                                                      const Duration(
                                                          milliseconds: 100),
                                                      () {
                                                    Get.find<HomeController>()
                                                        .LoginScreen();
                                                  });
                                                }
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 7, top: 2),
                                                child: Container(
                                                  height: 30,
                                                  width: 142,
                                                  decoration: BoxDecoration(
                                                    color: CustomAppColors
                                                        .lblOrgColor,
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                  ),
                                                  child: arrMyFavoriteLis[0]
                                                                  ['favoriteID']
                                                              .toString() ==
                                                          '1'
                                                      ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                height: 30,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: CustomAppColors
                                                                      .cartCountBGColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            8),
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
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              CustomeTextStyle(
                                                                            text:
                                                                                "-",
                                                                            size:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w800,
                                                                            color:
                                                                                CustomAppColors.appWhiteColor,
                                                                            wordSpacing:
                                                                                0.5,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              CustomeTextStyle(
                                                                            text:
                                                                                "1",
                                                                            size:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w800,
                                                                            color:
                                                                                CustomAppColors.appWhiteColor,
                                                                            wordSpacing:
                                                                                0.5,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 1,
                                                                      child:
                                                                          Container(
                                                                        height:
                                                                            30,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              CustomeTextStyle(
                                                                            text:
                                                                                "+",
                                                                            size:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w800,
                                                                            color:
                                                                                CustomAppColors.appWhiteColor,
                                                                            wordSpacing:
                                                                                0.5,
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
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: CustomAppColors
                                                                      .lblOrgColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            8),
                                                                  ),
                                                                ),
                                                                child: Center(
                                                                  child:
                                                                      Container(
                                                                    width: 16,
                                                                    height: 16,
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      image:
                                                                          DecorationImage(
                                                                        image: AssetImage(
                                                                            AppImages.ProfileAddToCart),
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
                                                            decoration:
                                                                const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                                image: AssetImage(
                                                                    AppImages
                                                                        .ProfileAddToCart),
                                                              ),
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
                      height: 306,
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
                            height: 250,
                            // color: Colors.red,
                            child: homeListController.brandList!.length == 0
                                ? Center()
                                : GridView.builder(
                                    itemCount: homeListController
                                        .brandList!.length
                                        .toInt(),
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        focusColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        splashColor: Colors.transparent,
                                        onTap: () {
                                          print('Click Action: $index');
                                          getStorge.write(
                                              "BrandProduct", "Yes");
                                          getStorge.write(
                                              "BrandID",
                                              homeListController
                                                  .brandList?[index].id
                                                  .toString());
                                          getStorge.write(
                                              "NavTitle",
                                              homeListController
                                                          .brandList?[index]
                                                          .name ==
                                                      ''
                                                  ? "Top Brand"
                                                  : homeListController
                                                      .brandList?[index].name);
                                          Get.toNamed(
                                              Routes.MOREPRODUCTLISTROUTES);
                                        },
                                        child: Container(
                                          width: 100,
                                          height: 56,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              fit: BoxFit.fitWidth,
                                              image: NetworkImage(
                                                '${homeListController.brandList?[index].image_url == '' ? AppService.noImageUrl : homeListController.brandList?[index].image_url}',
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                    ),
                                  ),
                            /*Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: (screenSize.height - 275),
                                  color: Colors.blue,
                                  child: Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 24, right: 24),
                                      child: homeListController
                                                  .brandList!.length ==
                                              0
                                          ? Center()
                                          : GridView.builder(
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                              ),
                                              itemCount: homeListController
                                                  .brandList!.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Card(
                                                  color: Colors.amber,
                                                  child: Center(
                                                      child: Text('$index')),
                                                );
                                              }),
                                      /*
                                      GridView.builder(
                                              gridDelegate:
                                                  const SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent: 200,
                                                childAspectRatio: 0.57,
                                                crossAxisSpacing: 14,
                                                mainAxisSpacing: 24,
                                              ),
                                              itemCount: homeListController
                                                  .brandList!.length,
                                              itemBuilder: (context, index) {
                                                return OpenContainer<bool>(
                                                  closedElevation: 0,
                                                  closedColor:
                                                      Colors.transparent,
                                                  openColor: Colors.transparent,
                                                  middleColor:
                                                      Colors.transparent,
                                                  openElevation: 0,
                                                  transitionType:
                                                      _transitionType,
                                                  openBuilder: (BuildContext _,
                                                      VoidCallback
                                                          openContainer) {
                                                    print(
                                                        'Click At Index: $index');
                                                    return ProductDetailView();
                                                  },
                                                  closedBuilder:
                                                      (BuildContext _,
                                                          VoidCallback
                                                              openContainer) {
                                                    return Card(
                                                      color: CustomAppColors
                                                          .cardBGColor,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            const BorderRadius
                                                                .all(
                                                          Radius.circular(12),
                                                        ),
                                                      ),
                                                      child: Container(
                                                        width: 120,
                                                        height: 56,
                                                        color: Colors.red,
                                                      ),
                                                    );
                                                  },
                                                );
                                              }),*/
                                    ),
                                  ),
                                ),
                                /*Container(
                                  width: (screenSize.width - 48),
                                  height: 56,
                                  // color: Colors.deepPurple,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
            */
                              ],
                            ),*/
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,
                  ],
                )),
        ),
      ),
    );
  }
}
