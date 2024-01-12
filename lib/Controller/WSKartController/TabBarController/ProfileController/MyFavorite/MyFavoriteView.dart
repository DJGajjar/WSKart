import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/SearchController/SearchTabController.dart';
import 'package:wskart/Service/Model/WishlistModel/Wishlist.dart';
import '../../../../../Constants/ServiceList.dart';
import '../../../../../Constants/convert_data.dart';
import '../../../../../ExtraClass/Routes/AppPages.dart';
import '../../../../../Service/Model/ProductModel/Product.dart';
import 'MyFavoriteController.dart';
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

class MyFavoriteView extends StatefulWidget {
  const MyFavoriteView({Key? key}) : super(key: key);

  @override
  State<MyFavoriteView> createState() => _MyFavoriteViewState();
}

class _MyFavoriteViewState extends State<MyFavoriteView>
    with TickerProviderStateMixin {
  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  ScrollController scrollController = ScrollController();

  bool isPageEnd = false;

  @override
  void initState() {
    super.initState();

    print("InitState Method Call Or Not");

    Get.find<MyFavoriteController>().fetchWishlistProductData();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    final getStorge = GetStorage();
    // final String strTitle = getStorge.read("NavTitle");

    ContainerTransitionType _transitionType = ContainerTransitionType.fade;

    // controller.onInit(); https://www.youtube.com/watch?v=nRm18oPR5z4

    MyFavoriteController wishlistProductController =
        Get.put(MyFavoriteController());

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
      body: Obx(
        () => Column(
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
                  child: Get.find<MyFavoriteController>().isLoading.value &&
                          Get.find<MyFavoriteController>().wishlistCount == 0
                      ? Center(
                          child: CircularProgressIndicator(
                            color: CustomAppColors.lblOrgColor,
                            backgroundColor: CustomAppColors.switchOrgColor,
                          ),
                        )
                      : CustomScrollView(
                          shrinkWrap: true,
                          controller: scrollController,
                          slivers: [
                            SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                String? price;
                                if (wishlistProductController
                                        .productList?[index].regularPrice !=
                                    '0') {
                                  price = wishlistProductController
                                      .productList?[index].regularPrice;
                                } else {
                                  price = wishlistProductController
                                      .productList?[index].price;
                                }

                                double numberPrice =
                                    ConvertData.stringToDouble(price);
                                double numberSale = ConvertData.stringToDouble(
                                    wishlistProductController
                                        .productList?[index].salePrice);
                                double percent =
                                    ((numberPrice - numberSale) * 100) /
                                        numberPrice;
                                String discountPercentage =
                                    percent.toStringAsFixed(
                                        percent.truncateToDouble() == percent
                                            ? 0
                                            : 1);
                                Product productDetail =
                                    wishlistProductController
                                        .productList![index];

                                if (index <
                                    wishlistProductController.wishlistCount) {
                                  print('Index Value: $index');
                                  print(
                                      'Total Product Count: ${wishlistProductController.wishlistCount}');

                                  // final productItem = shopProductController.products![index];
                                  return OpenContainer<bool>(
                                    closedElevation: 0,
                                    closedColor: Colors.transparent,
                                    openColor: Colors.transparent,
                                    middleColor: Colors.transparent,
                                    openElevation: 0,
                                    transitionType: _transitionType,
                                    openBuilder: (BuildContext _,
                                        VoidCallback openContainer) {
                                      print('Click At Index: $index');
                                      return ProductDetailView(
                                          product: productDetail);
                                      //Get.toNamed(Routes.PROFILEPRODUCTDETAILROUTES);
                                    },
                                    closedBuilder: (BuildContext _,
                                        VoidCallback openContainer) {
                                      return Card(
                                        color: CustomAppColors.cardBGColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(12)),
                                        ),
                                        child: Container(
                                          // width: 156,
                                          // height: 270,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 154,
                                                width: 156,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                  ),
                                                  image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(
                                                      '${wishlistProductController.productList?[index].images?.length == 0 ? AppService.noImageUrl : wishlistProductController.productList?[index].images?[0]['src'].toString()}',
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
                                                          discountPercentage !=
                                                                  0.0
                                                              ? Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              0,
                                                                          left:
                                                                              6),
                                                                  child:
                                                                      Container(
                                                                    width: 46,
                                                                    height: 20,
                                                                    // color: CustomAppColors.lblOrgColor,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: CustomAppColors
                                                                          .lblOrgColor,
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(8)),
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          CustomeTextStyle(
                                                                        text: discountPercentage.toString() +
                                                                            '%',
                                                                        size:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w500,
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
                                                            child: InkWell(
                                                              focusColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              splashColor: Colors
                                                                  .transparent,
                                                              onTap: () {
                                                                print(
                                                                    'Product Wishlist Click: ${wishlistProductController.productList?[index].id ?? 0}');
                                                              },
                                                              child: Container(
                                                                width: 28,
                                                                height: 28,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: CustomAppColors
                                                                      .appWhiteColor,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              28)),
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
                                                                            AppImages.ProfileFavoriteIcon),
                                                                      ),
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
                                                        '${wishlistProductController.productList?[index].name ?? ''}',
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
                                                              '${wishlistProductController.productList?[index].averageRating ?? 0.0}'),
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
                                                          '(${wishlistProductController.productList?[index].ratingCount.toString() ?? "0"})',
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
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 2, 9, 2),
                                                child: Container(
                                                  width: 120,
                                                  height: 10,
                                                  child: CustomeTextStyle(
                                                    text:
                                                        '${wishlistProductController.productList?[index].stockStatus ?? ""}',
                                                    size: 10,
                                                    fontWeight: FontWeight.w400,
                                                    color: CustomAppColors
                                                        .lblDarkColor,
                                                    wordSpacing: 0.5,
                                                  ),
                                                ),
                                              ),
                                              wishlistProductController
                                                          .productList?[index]
                                                          .onSale ==
                                                      true
                                                  ? Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          9, 10, 9, 2),
                                                      child: Container(
                                                        width: 120,
                                                        height: 10,
                                                        child: RichText(
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: ' ₹'
                                                                    '${wishlistProductController.productList?[index].regularPrice ?? "0"}',
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
                                                                  fontSize: 10,
                                                                  color: CustomAppColors
                                                                      .txtPlaceholderColor,
                                                                  wordSpacing:
                                                                      1,
                                                                  height: 0.5,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: ' ₹'
                                                                    '${wishlistProductController.productList?[index].salePrice ?? "0"}',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontSize: 10,
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
                                                      padding: const EdgeInsets
                                                          .fromLTRB(9, 8, 9, 4),
                                                      child: Container(
                                                        width: 120,
                                                        height: 10,
                                                        child: CustomeTextStyle(
                                                          text: ' ₹'
                                                              '${wishlistProductController.productList?[index].regularPrice ?? "0"}',
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
                                                      'Add To Cart Item: $index');
                                                  if (getStorge
                                                          .read("isLogin") ==
                                                      null) {
                                                    Future.delayed(
                                                        const Duration(
                                                            milliseconds: 100),
                                                        () {
                                                      Get.find<
                                                              MyFavoriteController>()
                                                          .LoginScreen();
                                                    });
                                                  }
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 7, top: 2),
                                                  child: Container(
                                                    height: 30,
                                                    width: 142,
                                                    decoration: BoxDecoration(
                                                      color: CustomAppColors
                                                          .lblOrgColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
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
                                      );
                                    },
                                  );
                                } else {
                                  print('Page Scroll is Ending');
                                  return const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 32),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: CustomAppColors.lblOrgColor,
                                        backgroundColor:
                                            CustomAppColors.switchOrgColor,
                                      ),
                                    ),
                                  );
                                }
                              },
                                  childCount:
                                      wishlistProductController.wishlistCount),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.57,
                                crossAxisSpacing: 14,
                                mainAxisSpacing: 24,
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(),
                            ),
                          ],
                        ),
                  // GridView.builder(
                  //         controller: scrollController,
                  //         shrinkWrap: true,
                  //         gridDelegate:
                  //             const SliverGridDelegateWithFixedCrossAxisCount(
                  //           crossAxisCount: 2,
                  //           childAspectRatio: 0.57,
                  //           crossAxisSpacing: 14,
                  //           mainAxisSpacing: 24,
                  //         ),
                  //         itemCount: moreProductController.productListCount,
                  //         //shopProductController.products!.length, //,
                  //         itemBuilder: (context, index) {
                  //           String? price;
                  //           if (moreProductController
                  //                   .productList?[index].regularPrice !=
                  //               '0') {
                  //             price = moreProductController
                  //                 .productList?[index].regularPrice;
                  //           } else {
                  //             price = moreProductController
                  //                 .productList?[index].price;
                  //           }
                  //
                  //           double numberPrice =
                  //               ConvertData.stringToDouble(price);
                  //           double numberSale = ConvertData.stringToDouble(
                  //               moreProductController
                  //                   .productList?[index].salePrice);
                  //           double percent =
                  //               ((numberPrice - numberSale) * 100) /
                  //                   numberPrice;
                  //           String discountPercentage = percent.toStringAsFixed(
                  //               percent.truncateToDouble() == percent ? 0 : 1);
                  //           Product productDetail =
                  //               moreProductController.productList![index];
                  //
                  //           if (index <
                  //               moreProductController.productListCount) {
                  //             print('Index Value: $index');
                  //             print(
                  //                 'Total Product Count: ${moreProductController.productListCount}');
                  //
                  //             // final productItem = shopProductController.products![index];
                  //             return OpenContainer<bool>(
                  //               closedElevation: 0,
                  //               closedColor: Colors.transparent,
                  //               openColor: Colors.transparent,
                  //               middleColor: Colors.transparent,
                  //               openElevation: 0,
                  //               transitionType: _transitionType,
                  //               openBuilder: (BuildContext _,
                  //                   VoidCallback openContainer) {
                  //                 print('Click At Index: $index');
                  //                 return ProductDetailView(
                  //                     product: productDetail);
                  //                 //Get.toNamed(Routes.PROFILEPRODUCTDETAILROUTES);
                  //               },
                  //               closedBuilder: (BuildContext _,
                  //                   VoidCallback openContainer) {
                  //                 return Card(
                  //                   color: CustomAppColors.cardBGColor,
                  //                   shape: RoundedRectangleBorder(
                  //                     borderRadius: const BorderRadius.all(
                  //                         Radius.circular(12)),
                  //                   ),
                  //                   child: Container(
                  //                     // width: 156,
                  //                     // height: 270,
                  //                     child: Column(
                  //                       crossAxisAlignment:
                  //                           CrossAxisAlignment.start,
                  //                       children: [
                  //                         Container(
                  //                           height: 154,
                  //                           width: 156,
                  //                           decoration: BoxDecoration(
                  //                             borderRadius: BorderRadius.only(
                  //                               topLeft: Radius.circular(10),
                  //                               topRight: Radius.circular(10),
                  //                             ),
                  //                             image: DecorationImage(
                  //                               fit: BoxFit.fill,
                  //                               image: NetworkImage(
                  //                                 '${moreProductController.productList?[index].images?.length == 0 ? AppService.noImageUrl : moreProductController.productList?[index].images?[0]['src'].toString()}',
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           child: Row(
                  //                             mainAxisAlignment:
                  //                                 MainAxisAlignment.start,
                  //                             crossAxisAlignment:
                  //                                 CrossAxisAlignment.start,
                  //                             children: [
                  //                               Container(
                  //                                 height: 40,
                  //                                 width: 156,
                  //                                 child: Row(
                  //                                   mainAxisAlignment:
                  //                                       MainAxisAlignment
                  //                                           .spaceBetween,
                  //                                   children: [
                  //                                     discountPercentage != 0.0
                  //                                         ? Padding(
                  //                                             padding:
                  //                                                 const EdgeInsets
                  //                                                     .only(
                  //                                                     top: 0,
                  //                                                     left: 6),
                  //                                             child: Container(
                  //                                               width: 46,
                  //                                               height: 20,
                  //                                               // color: CustomAppColors.lblOrgColor,
                  //                                               decoration:
                  //                                                   BoxDecoration(
                  //                                                 color: CustomAppColors
                  //                                                     .lblOrgColor,
                  //                                                 borderRadius:
                  //                                                     BorderRadius.all(
                  //                                                         Radius.circular(
                  //                                                             8)),
                  //                                               ),
                  //                                               child: Center(
                  //                                                 child:
                  //                                                     CustomeTextStyle(
                  //                                                   text: discountPercentage
                  //                                                           .toString() +
                  //                                                       '%',
                  //                                                   size: 12,
                  //                                                   fontWeight:
                  //                                                       FontWeight
                  //                                                           .w500,
                  //                                                   color: CustomAppColors
                  //                                                       .appWhiteColor,
                  //                                                   wordSpacing:
                  //                                                       0.5,
                  //                                                 ),
                  //                                               ),
                  //                                             ),
                  //                                           )
                  //                                         : Container(),
                  //                                     Padding(
                  //                                       padding:
                  //                                           const EdgeInsets
                  //                                               .only(right: 6),
                  //                                       child: Container(
                  //                                         width: 28,
                  //                                         height: 28,
                  //                                         decoration:
                  //                                             const BoxDecoration(
                  //                                           color: CustomAppColors
                  //                                               .appWhiteColor,
                  //                                           borderRadius:
                  //                                               BorderRadius
                  //                                                   .all(Radius
                  //                                                       .circular(
                  //                                                           28)),
                  //                                         ),
                  //                                         child: Center(
                  //                                           child: Container(
                  //                                             width: 16,
                  //                                             height: 16,
                  //                                             decoration:
                  //                                                 const BoxDecoration(
                  //                                               image:
                  //                                                   DecorationImage(
                  //                                                 image: AssetImage(
                  //                                                     AppImages
                  //                                                         .ProfileFavoriteIcon),
                  //                                               ),
                  //                                             ),
                  //                                           ),
                  //                                         ),
                  //                                       ),
                  //                                     ),
                  //                                   ],
                  //                                 ),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                         Padding(
                  //                           padding: const EdgeInsets.fromLTRB(
                  //                               9, 4, 9, 2),
                  //                           child: Container(
                  //                             child: CustomeTextStyle(
                  //                               text:
                  //                                   '${moreProductController.productList?[index].name ?? ''}',
                  //                               size: 12,
                  //                               fontWeight: FontWeight.w400,
                  //                               color: CustomAppColors
                  //                                   .lblDarkColor,
                  //                               wordSpacing: 0.5,
                  //                             ),
                  //                           ),
                  //                         ),
                  //                         Padding(
                  //                           padding: const EdgeInsets.fromLTRB(
                  //                               9, 4, 9, 2),
                  //                           child: Row(
                  //                             crossAxisAlignment:
                  //                                 CrossAxisAlignment.center,
                  //                             mainAxisAlignment:
                  //                                 MainAxisAlignment.start,
                  //                             children: [
                  //                               RatingBarIndicator(
                  //                                 rating: ConvertData
                  //                                     .stringToDouble(
                  //                                         '${moreProductController.productList?[index].averageRating ?? 0.0}'),
                  //                                 itemCount: 5,
                  //                                 itemSize: 12.0,
                  //                                 itemBuilder: (context, _) =>
                  //                                     const Icon(
                  //                                   Icons.star,
                  //                                   color: CustomAppColors
                  //                                       .lblOrgColor,
                  //                                 ),
                  //                               ),
                  //                               4.widthBox,
                  //                               CustomeTextStyle(
                  //                                 text:
                  //                                     '(${moreProductController.productList?[index].ratingCount.toString() ?? "0"})',
                  //                                 size: 10,
                  //                                 fontWeight: FontWeight.w400,
                  //                                 color: CustomAppColors
                  //                                     .txtPlaceholderColor,
                  //                                 wordSpacing: 0.5,
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                         Padding(
                  //                           padding: const EdgeInsets.fromLTRB(
                  //                               10, 2, 9, 2),
                  //                           child: Container(
                  //                             width: 120,
                  //                             height: 10,
                  //                             child: CustomeTextStyle(
                  //                               text:
                  //                                   '${moreProductController.productList?[index].stockStatus ?? ""}',
                  //                               size: 10,
                  //                               fontWeight: FontWeight.w400,
                  //                               color: CustomAppColors
                  //                                   .lblDarkColor,
                  //                               wordSpacing: 0.5,
                  //                             ),
                  //                           ),
                  //                         ),
                  //                         moreProductController
                  //                                     .productList?[index]
                  //                                     .onSale ==
                  //                                 true
                  //                             ? Padding(
                  //                                 padding:
                  //                                     const EdgeInsets.fromLTRB(
                  //                                         9, 10, 9, 2),
                  //                                 child: Container(
                  //                                   width: 120,
                  //                                   height: 10,
                  //                                   child: RichText(
                  //                                     text: TextSpan(
                  //                                       children: [
                  //                                         TextSpan(
                  //                                           text: ' ₹'
                  //                                               '${moreProductController.productList?[index].regularPrice ?? "0"}',
                  //                                           style: TextStyle(
                  //                                             decoration:
                  //                                                 TextDecoration
                  //                                                     .lineThrough,
                  //                                             fontFamily:
                  //                                                 'Inter',
                  //                                             fontWeight:
                  //                                                 FontWeight
                  //                                                     .normal,
                  //                                             fontSize: 10,
                  //                                             color: CustomAppColors
                  //                                                 .txtPlaceholderColor,
                  //                                             wordSpacing: 1,
                  //                                             height: 0.5,
                  //                                           ),
                  //                                         ),
                  //                                         TextSpan(
                  //                                           text: ' ₹'
                  //                                               '${moreProductController.productList?[index].salePrice ?? "0"}',
                  //                                           style: TextStyle(
                  //                                             fontFamily:
                  //                                                 'Inter',
                  //                                             fontWeight:
                  //                                                 FontWeight
                  //                                                     .normal,
                  //                                             fontSize: 10,
                  //                                             color: CustomAppColors
                  //                                                 .lblOrgColor,
                  //                                             wordSpacing: 1,
                  //                                             height: 0.5,
                  //                                           ),
                  //                                         ),
                  //                                       ],
                  //                                     ),
                  //                                     textAlign: TextAlign.left,
                  //                                   ),
                  //                                 ),
                  //                               )
                  //                             : Padding(
                  //                                 padding:
                  //                                     const EdgeInsets.fromLTRB(
                  //                                         9, 8, 9, 4),
                  //                                 child: Container(
                  //                                   width: 120,
                  //                                   height: 10,
                  //                                   child: CustomeTextStyle(
                  //                                     text: ' ₹'
                  //                                         '${moreProductController.productList?[index].regularPrice ?? "0"}',
                  //                                     size: 10,
                  //                                     fontWeight:
                  //                                         FontWeight.normal,
                  //                                     color: CustomAppColors
                  //                                         .lblOrgColor,
                  //                                     wordSpacing: 0.5,
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                         InkWell(
                  //                           focusColor: Colors.transparent,
                  //                           highlightColor: Colors.transparent,
                  //                           hoverColor: Colors.transparent,
                  //                           splashColor: Colors.transparent,
                  //                           onTap: () {
                  //                             print('Add To Cart Item: $index');
                  //                             if (getStorge.read("isLogin") ==
                  //                                 null) {
                  //                               Future.delayed(
                  //                                   const Duration(
                  //                                       milliseconds: 100), () {
                  //                                 Get.find<
                  //                                         MoreProductController>()
                  //                                     .LoginScreen();
                  //                               });
                  //                             }
                  //                           },
                  //                           child: Padding(
                  //                             padding: const EdgeInsets.only(
                  //                                 left: 7, top: 2),
                  //                             child: Container(
                  //                               height: 30,
                  //                               width: 142,
                  //                               decoration: BoxDecoration(
                  //                                 color: CustomAppColors
                  //                                     .lblOrgColor,
                  //                                 borderRadius:
                  //                                     BorderRadius.all(
                  //                                         Radius.circular(8)),
                  //                               ),
                  //                               child: Center(
                  //                                 child: Container(
                  //                                   width: 16,
                  //                                   height: 16,
                  //                                   decoration:
                  //                                       const BoxDecoration(
                  //                                     image: DecorationImage(
                  //                                       image: AssetImage(AppImages
                  //                                           .ProfileAddToCart),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                           ),
                  //                         )
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 );
                  //               },
                  //             );
                  //           } else {
                  //             print('Page Scroll is Ending');
                  //             return const Padding(
                  //               padding: EdgeInsets.symmetric(vertical: 32),
                  //               child: Center(
                  //                 child: CircularProgressIndicator(
                  //                   color: CustomAppColors.lblOrgColor,
                  //                   backgroundColor:
                  //                       CustomAppColors.switchOrgColor,
                  //                 ),
                  //               ),
                  //             );
                  //           }
                  //         }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*class MyFavoriteView extends StatefulWidget {
  const MyFavoriteView({Key? key}) : super(key: key);

  // final Wishlist? wishlistProduct;
  // const MyFavoriteView({Key? key, this.wishlistProduct}) : super(key: key);

  @override
  State<MyFavoriteView> createState() => _MyFavoriteViewState();
}

class _MyFavoriteViewState extends State<MyFavoriteView>
    with TickerProviderStateMixin {
  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
              scrollController.offset &&
          Get.find<MyFavoriteController>().productList.length % 10 == 0) {
        //Get.find<MyFavoriteController>().fetchWishlistProductData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    MyFavoriteController wishlistProductController =
        Get.put(MyFavoriteController());

    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    final getStorge = GetStorage();
    final String strTitle = getStorge.read("NavTitle");

    ContainerTransitionType _transitionType = ContainerTransitionType.fade;

    // controller.onInit(); https://www.youtube.com/watch?v=nRm18oPR5z4

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
      body: Obx(
        () => Column(
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
                  child: Get.find<MyFavoriteController>().isLoading.value &&
                          Get.find<MyFavoriteController>().wishlistCount == 0
                      ? Center(
                          child: CircularProgressIndicator(
                            color: CustomAppColors.lblOrgColor,
                            backgroundColor: CustomAppColors.switchOrgColor,
                          ),
                        )
                      : CustomScrollView(
                          shrinkWrap: true,
                          controller: scrollController,
                          slivers: [
                            SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                String? price;
                                if (wishlistProductController
                                        .productList?[index].regularPrice !=
                                    '0') {
                                  price = wishlistProductController
                                      .productList?[index].regularPrice;
                                } else {
                                  price = wishlistProductController
                                      .productList?[index].price;
                                }

                                double numberPrice =
                                    ConvertData.stringToDouble(price);
                                double numberSale = ConvertData.stringToDouble(
                                    wishlistProductController
                                        .productList?[index].salePrice);
                                double percent =
                                    ((numberPrice - numberSale) * 100) /
                                        numberPrice;
                                String discountPercentage =
                                    percent.toStringAsFixed(
                                        percent.truncateToDouble() == percent
                                            ? 0
                                            : 1);
                                Product productDetail =
                                    wishlistProductController
                                        .productList![index];

                                if (index <
                                    wishlistProductController.wishlistCount) {
                                  print('Index Value: $index');
                                  print(
                                      'Total Product Count: ${wishlistProductController.wishlistCount}');

                                  // final productItem = shopProductController.products![index];
                                  return OpenContainer<bool>(
                                    closedElevation: 0,
                                    closedColor: Colors.transparent,
                                    openColor: Colors.transparent,
                                    middleColor: Colors.transparent,
                                    openElevation: 0,
                                    transitionType: _transitionType,
                                    openBuilder: (BuildContext _,
                                        VoidCallback openContainer) {
                                      print('Click At Index: $index');
                                      return ProductDetailView(
                                          product: productDetail);
                                      //Get.toNamed(Routes.PROFILEPRODUCTDETAILROUTES);
                                    },
                                    closedBuilder: (BuildContext _,
                                        VoidCallback openContainer) {
                                      return Card(
                                        color: CustomAppColors.cardBGColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(12)),
                                        ),
                                        child: Container(
                                          // width: 156,
                                          // height: 270,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 154,
                                                width: 156,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                  ),
                                                  image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(
                                                      '${wishlistProductController.productList?[index].images?.length == 0 ? AppService.noImageUrl : wishlistProductController.productList?[index].images?[0]['src'].toString()}',
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
                                                          discountPercentage !=
                                                                  0.0
                                                              ? Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              0,
                                                                          left:
                                                                              6),
                                                                  child:
                                                                      Container(
                                                                    width: 46,
                                                                    height: 20,
                                                                    // color: CustomAppColors.lblOrgColor,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: CustomAppColors
                                                                          .lblOrgColor,
                                                                      borderRadius:
                                                                          BorderRadius.all(
                                                                              Radius.circular(8)),
                                                                    ),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          CustomeTextStyle(
                                                                        text: discountPercentage.toString() +
                                                                            '%',
                                                                        size:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w500,
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
                                                            child: InkWell(
                                                              focusColor: Colors
                                                                  .transparent,
                                                              highlightColor:
                                                                  Colors
                                                                      .transparent,
                                                              hoverColor: Colors
                                                                  .transparent,
                                                              splashColor: Colors
                                                                  .transparent,
                                                              onTap: () {
                                                                print(
                                                                    'Product Wishlist Click: ${wishlistProductController.productList?[index].id ?? 0}');
                                                              },
                                                              child: Container(
                                                                width: 28,
                                                                height: 28,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  color: CustomAppColors
                                                                      .appWhiteColor,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              28)),
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
                                                                            AppImages.ProfileFavoriteIcon),
                                                                      ),
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
                                                        '${wishlistProductController.productList?[index].name ?? ''}',
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
                                                              '${wishlistProductController.productList?[index].averageRating ?? 0.0}'),
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
                                                          '(${wishlistProductController.productList?[index].ratingCount.toString() ?? "0"})',
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
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        10, 2, 9, 2),
                                                child: Container(
                                                  width: 120,
                                                  height: 10,
                                                  child: CustomeTextStyle(
                                                    text:
                                                        '${wishlistProductController.productList?[index].stockStatus ?? ""}',
                                                    size: 10,
                                                    fontWeight: FontWeight.w400,
                                                    color: CustomAppColors
                                                        .lblDarkColor,
                                                    wordSpacing: 0.5,
                                                  ),
                                                ),
                                              ),
                                              wishlistProductController
                                                          .productList?[index]
                                                          .onSale ==
                                                      true
                                                  ? Padding(
                                                      padding: const EdgeInsets
                                                          .fromLTRB(
                                                          9, 10, 9, 2),
                                                      child: Container(
                                                        width: 120,
                                                        height: 10,
                                                        child: RichText(
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text: ' ₹'
                                                                    '${wishlistProductController.productList?[index].regularPrice ?? "0"}',
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
                                                                  fontSize: 10,
                                                                  color: CustomAppColors
                                                                      .txtPlaceholderColor,
                                                                  wordSpacing:
                                                                      1,
                                                                  height: 0.5,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: ' ₹'
                                                                    '${wishlistProductController.productList?[index].salePrice ?? "0"}',
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontSize: 10,
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
                                                      padding: const EdgeInsets
                                                          .fromLTRB(9, 8, 9, 4),
                                                      child: Container(
                                                        width: 120,
                                                        height: 10,
                                                        child: CustomeTextStyle(
                                                          text: ' ₹'
                                                              '${wishlistProductController.productList?[index].regularPrice ?? "0"}',
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
                                                      'Add To Cart Item: $index');
                                                  if (getStorge
                                                          .read("isLogin") ==
                                                      null) {
                                                    Future.delayed(
                                                        const Duration(
                                                            milliseconds: 100),
                                                        () {
                                                      Get.find<
                                                              MyFavoriteController>()
                                                          .LoginScreen();
                                                    });
                                                  }
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 7, top: 2),
                                                  child: Container(
                                                    height: 30,
                                                    width: 142,
                                                    decoration: BoxDecoration(
                                                      color: CustomAppColors
                                                          .lblOrgColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8)),
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
                                      );
                                    },
                                  );
                                } else {
                                  print('Page Scroll is Ending');
                                  return const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 32),
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        color: CustomAppColors.lblOrgColor,
                                        backgroundColor:
                                            CustomAppColors.switchOrgColor,
                                      ),
                                    ),
                                  );
                                }
                              },
                                  childCount:
                                      wishlistProductController.wishlistCount),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 0.57,
                                crossAxisSpacing: 14,
                                mainAxisSpacing: 24,
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: Container(),
                            ),
                          ],
                        ),
                  // GridView.builder(
                  //         controller: scrollController,
                  //         shrinkWrap: true,
                  //         gridDelegate:
                  //             const SliverGridDelegateWithFixedCrossAxisCount(
                  //           crossAxisCount: 2,
                  //           childAspectRatio: 0.57,
                  //           crossAxisSpacing: 14,
                  //           mainAxisSpacing: 24,
                  //         ),
                  //         itemCount: moreProductController.productListCount,
                  //         //shopProductController.products!.length, //,
                  //         itemBuilder: (context, index) {
                  //           String? price;
                  //           if (moreProductController
                  //                   .productList?[index].regularPrice !=
                  //               '0') {
                  //             price = moreProductController
                  //                 .productList?[index].regularPrice;
                  //           } else {
                  //             price = moreProductController
                  //                 .productList?[index].price;
                  //           }
                  //
                  //           double numberPrice =
                  //               ConvertData.stringToDouble(price);
                  //           double numberSale = ConvertData.stringToDouble(
                  //               moreProductController
                  //                   .productList?[index].salePrice);
                  //           double percent =
                  //               ((numberPrice - numberSale) * 100) /
                  //                   numberPrice;
                  //           String discountPercentage = percent.toStringAsFixed(
                  //               percent.truncateToDouble() == percent ? 0 : 1);
                  //           Product productDetail =
                  //               moreProductController.productList![index];
                  //
                  //           if (index <
                  //               moreProductController.productListCount) {
                  //             print('Index Value: $index');
                  //             print(
                  //                 'Total Product Count: ${moreProductController.productListCount}');
                  //
                  //             // final productItem = shopProductController.products![index];
                  //             return OpenContainer<bool>(
                  //               closedElevation: 0,
                  //               closedColor: Colors.transparent,
                  //               openColor: Colors.transparent,
                  //               middleColor: Colors.transparent,
                  //               openElevation: 0,
                  //               transitionType: _transitionType,
                  //               openBuilder: (BuildContext _,
                  //                   VoidCallback openContainer) {
                  //                 print('Click At Index: $index');
                  //                 return ProductDetailView(
                  //                     product: productDetail);
                  //                 //Get.toNamed(Routes.PROFILEPRODUCTDETAILROUTES);
                  //               },
                  //               closedBuilder: (BuildContext _,
                  //                   VoidCallback openContainer) {
                  //                 return Card(
                  //                   color: CustomAppColors.cardBGColor,
                  //                   shape: RoundedRectangleBorder(
                  //                     borderRadius: const BorderRadius.all(
                  //                         Radius.circular(12)),
                  //                   ),
                  //                   child: Container(
                  //                     // width: 156,
                  //                     // height: 270,
                  //                     child: Column(
                  //                       crossAxisAlignment:
                  //                           CrossAxisAlignment.start,
                  //                       children: [
                  //                         Container(
                  //                           height: 154,
                  //                           width: 156,
                  //                           decoration: BoxDecoration(
                  //                             borderRadius: BorderRadius.only(
                  //                               topLeft: Radius.circular(10),
                  //                               topRight: Radius.circular(10),
                  //                             ),
                  //                             image: DecorationImage(
                  //                               fit: BoxFit.fill,
                  //                               image: NetworkImage(
                  //                                 '${moreProductController.productList?[index].images?.length == 0 ? AppService.noImageUrl : moreProductController.productList?[index].images?[0]['src'].toString()}',
                  //                               ),
                  //                             ),
                  //                           ),
                  //                           child: Row(
                  //                             mainAxisAlignment:
                  //                                 MainAxisAlignment.start,
                  //                             crossAxisAlignment:
                  //                                 CrossAxisAlignment.start,
                  //                             children: [
                  //                               Container(
                  //                                 height: 40,
                  //                                 width: 156,
                  //                                 child: Row(
                  //                                   mainAxisAlignment:
                  //                                       MainAxisAlignment
                  //                                           .spaceBetween,
                  //                                   children: [
                  //                                     discountPercentage != 0.0
                  //                                         ? Padding(
                  //                                             padding:
                  //                                                 const EdgeInsets
                  //                                                     .only(
                  //                                                     top: 0,
                  //                                                     left: 6),
                  //                                             child: Container(
                  //                                               width: 46,
                  //                                               height: 20,
                  //                                               // color: CustomAppColors.lblOrgColor,
                  //                                               decoration:
                  //                                                   BoxDecoration(
                  //                                                 color: CustomAppColors
                  //                                                     .lblOrgColor,
                  //                                                 borderRadius:
                  //                                                     BorderRadius.all(
                  //                                                         Radius.circular(
                  //                                                             8)),
                  //                                               ),
                  //                                               child: Center(
                  //                                                 child:
                  //                                                     CustomeTextStyle(
                  //                                                   text: discountPercentage
                  //                                                           .toString() +
                  //                                                       '%',
                  //                                                   size: 12,
                  //                                                   fontWeight:
                  //                                                       FontWeight
                  //                                                           .w500,
                  //                                                   color: CustomAppColors
                  //                                                       .appWhiteColor,
                  //                                                   wordSpacing:
                  //                                                       0.5,
                  //                                                 ),
                  //                                               ),
                  //                                             ),
                  //                                           )
                  //                                         : Container(),
                  //                                     Padding(
                  //                                       padding:
                  //                                           const EdgeInsets
                  //                                               .only(right: 6),
                  //                                       child: Container(
                  //                                         width: 28,
                  //                                         height: 28,
                  //                                         decoration:
                  //                                             const BoxDecoration(
                  //                                           color: CustomAppColors
                  //                                               .appWhiteColor,
                  //                                           borderRadius:
                  //                                               BorderRadius
                  //                                                   .all(Radius
                  //                                                       .circular(
                  //                                                           28)),
                  //                                         ),
                  //                                         child: Center(
                  //                                           child: Container(
                  //                                             width: 16,
                  //                                             height: 16,
                  //                                             decoration:
                  //                                                 const BoxDecoration(
                  //                                               image:
                  //                                                   DecorationImage(
                  //                                                 image: AssetImage(
                  //                                                     AppImages
                  //                                                         .ProfileFavoriteIcon),
                  //                                               ),
                  //                                             ),
                  //                                           ),
                  //                                         ),
                  //                                       ),
                  //                                     ),
                  //                                   ],
                  //                                 ),
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                         Padding(
                  //                           padding: const EdgeInsets.fromLTRB(
                  //                               9, 4, 9, 2),
                  //                           child: Container(
                  //                             child: CustomeTextStyle(
                  //                               text:
                  //                                   '${moreProductController.productList?[index].name ?? ''}',
                  //                               size: 12,
                  //                               fontWeight: FontWeight.w400,
                  //                               color: CustomAppColors
                  //                                   .lblDarkColor,
                  //                               wordSpacing: 0.5,
                  //                             ),
                  //                           ),
                  //                         ),
                  //                         Padding(
                  //                           padding: const EdgeInsets.fromLTRB(
                  //                               9, 4, 9, 2),
                  //                           child: Row(
                  //                             crossAxisAlignment:
                  //                                 CrossAxisAlignment.center,
                  //                             mainAxisAlignment:
                  //                                 MainAxisAlignment.start,
                  //                             children: [
                  //                               RatingBarIndicator(
                  //                                 rating: ConvertData
                  //                                     .stringToDouble(
                  //                                         '${moreProductController.productList?[index].averageRating ?? 0.0}'),
                  //                                 itemCount: 5,
                  //                                 itemSize: 12.0,
                  //                                 itemBuilder: (context, _) =>
                  //                                     const Icon(
                  //                                   Icons.star,
                  //                                   color: CustomAppColors
                  //                                       .lblOrgColor,
                  //                                 ),
                  //                               ),
                  //                               4.widthBox,
                  //                               CustomeTextStyle(
                  //                                 text:
                  //                                     '(${moreProductController.productList?[index].ratingCount.toString() ?? "0"})',
                  //                                 size: 10,
                  //                                 fontWeight: FontWeight.w400,
                  //                                 color: CustomAppColors
                  //                                     .txtPlaceholderColor,
                  //                                 wordSpacing: 0.5,
                  //                               ),
                  //                             ],
                  //                           ),
                  //                         ),
                  //                         Padding(
                  //                           padding: const EdgeInsets.fromLTRB(
                  //                               10, 2, 9, 2),
                  //                           child: Container(
                  //                             width: 120,
                  //                             height: 10,
                  //                             child: CustomeTextStyle(
                  //                               text:
                  //                                   '${moreProductController.productList?[index].stockStatus ?? ""}',
                  //                               size: 10,
                  //                               fontWeight: FontWeight.w400,
                  //                               color: CustomAppColors
                  //                                   .lblDarkColor,
                  //                               wordSpacing: 0.5,
                  //                             ),
                  //                           ),
                  //                         ),
                  //                         moreProductController
                  //                                     .productList?[index]
                  //                                     .onSale ==
                  //                                 true
                  //                             ? Padding(
                  //                                 padding:
                  //                                     const EdgeInsets.fromLTRB(
                  //                                         9, 10, 9, 2),
                  //                                 child: Container(
                  //                                   width: 120,
                  //                                   height: 10,
                  //                                   child: RichText(
                  //                                     text: TextSpan(
                  //                                       children: [
                  //                                         TextSpan(
                  //                                           text: ' ₹'
                  //                                               '${moreProductController.productList?[index].regularPrice ?? "0"}',
                  //                                           style: TextStyle(
                  //                                             decoration:
                  //                                                 TextDecoration
                  //                                                     .lineThrough,
                  //                                             fontFamily:
                  //                                                 'Inter',
                  //                                             fontWeight:
                  //                                                 FontWeight
                  //                                                     .normal,
                  //                                             fontSize: 10,
                  //                                             color: CustomAppColors
                  //                                                 .txtPlaceholderColor,
                  //                                             wordSpacing: 1,
                  //                                             height: 0.5,
                  //                                           ),
                  //                                         ),
                  //                                         TextSpan(
                  //                                           text: ' ₹'
                  //                                               '${moreProductController.productList?[index].salePrice ?? "0"}',
                  //                                           style: TextStyle(
                  //                                             fontFamily:
                  //                                                 'Inter',
                  //                                             fontWeight:
                  //                                                 FontWeight
                  //                                                     .normal,
                  //                                             fontSize: 10,
                  //                                             color: CustomAppColors
                  //                                                 .lblOrgColor,
                  //                                             wordSpacing: 1,
                  //                                             height: 0.5,
                  //                                           ),
                  //                                         ),
                  //                                       ],
                  //                                     ),
                  //                                     textAlign: TextAlign.left,
                  //                                   ),
                  //                                 ),
                  //                               )
                  //                             : Padding(
                  //                                 padding:
                  //                                     const EdgeInsets.fromLTRB(
                  //                                         9, 8, 9, 4),
                  //                                 child: Container(
                  //                                   width: 120,
                  //                                   height: 10,
                  //                                   child: CustomeTextStyle(
                  //                                     text: ' ₹'
                  //                                         '${moreProductController.productList?[index].regularPrice ?? "0"}',
                  //                                     size: 10,
                  //                                     fontWeight:
                  //                                         FontWeight.normal,
                  //                                     color: CustomAppColors
                  //                                         .lblOrgColor,
                  //                                     wordSpacing: 0.5,
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                         InkWell(
                  //                           focusColor: Colors.transparent,
                  //                           highlightColor: Colors.transparent,
                  //                           hoverColor: Colors.transparent,
                  //                           splashColor: Colors.transparent,
                  //                           onTap: () {
                  //                             print('Add To Cart Item: $index');
                  //                             if (getStorge.read("isLogin") ==
                  //                                 null) {
                  //                               Future.delayed(
                  //                                   const Duration(
                  //                                       milliseconds: 100), () {
                  //                                 Get.find<
                  //                                         MoreProductController>()
                  //                                     .LoginScreen();
                  //                               });
                  //                             }
                  //                           },
                  //                           child: Padding(
                  //                             padding: const EdgeInsets.only(
                  //                                 left: 7, top: 2),
                  //                             child: Container(
                  //                               height: 30,
                  //                               width: 142,
                  //                               decoration: BoxDecoration(
                  //                                 color: CustomAppColors
                  //                                     .lblOrgColor,
                  //                                 borderRadius:
                  //                                     BorderRadius.all(
                  //                                         Radius.circular(8)),
                  //                               ),
                  //                               child: Center(
                  //                                 child: Container(
                  //                                   width: 16,
                  //                                   height: 16,
                  //                                   decoration:
                  //                                       const BoxDecoration(
                  //                                     image: DecorationImage(
                  //                                       image: AssetImage(AppImages
                  //                                           .ProfileAddToCart),
                  //                                     ),
                  //                                   ),
                  //                                 ),
                  //                               ),
                  //                             ),
                  //                           ),
                  //                         )
                  //                       ],
                  //                     ),
                  //                   ),
                  //                 );
                  //               },
                  //             );
                  //           } else {
                  //             print('Page Scroll is Ending');
                  //             return const Padding(
                  //               padding: EdgeInsets.symmetric(vertical: 32),
                  //               child: Center(
                  //                 child: CircularProgressIndicator(
                  //                   color: CustomAppColors.lblOrgColor,
                  //                   backgroundColor:
                  //                       CustomAppColors.switchOrgColor,
                  //                 ),
                  //               ),
                  //             );
                  //           }
                  //         }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} */

/*class MyFavoriteView extends GetView<MyFavoriteController> {
  const MyFavoriteView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    SearchTabController shopProductController = Get.put(SearchTabController());

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
                    itemCount: arrMyFavoriteLis.length + 1,
                    // itemBuilder: (context, index) => ProductTileAnimation(
                    //   itemNo: index,
                    //   product: products[index],
                    // ),
                    /*
                    focusColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () async {
                          print('Click Show Product Detail');
                          Get.toNamed(Routes.PROFILEPRODUCTDETAILROUTES);
                        },
                     */
                    itemBuilder: (context, index) {
                      if (index < arrMyFavoriteLis.length) {
                        return OpenContainer<bool>(
                          closedElevation: 0,
                          closedColor: Colors.transparent,
                          openColor: Colors.transparent,
                          middleColor: Colors.transparent,
                          openElevation: 0,
                          transitionType: _transitionType,
                          openBuilder:
                              (BuildContext _, VoidCallback openContainer) {
                            return ProductDetailView(); //Get.toNamed(Routes.PROFILEPRODUCTDETAILROUTES);
                          },
                          closedBuilder:
                              (BuildContext _, VoidCallback openContainer) {
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
                                        image: DecorationImage(
                                          image: AssetImage(
                                              AppImages.ProfileMyFavorite),
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
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
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
                                                              Radius.circular(
                                                                  8)),
                                                    ),
                                                    child: Center(
                                                      child: CustomeTextStyle(
                                                        text: "63%",
                                                        size: 10,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: CustomAppColors
                                                            .appWhiteColor,
                                                        wordSpacing: 0.5,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 6),
                                                  child: Container(
                                                    width: 28,
                                                    height: 28,
                                                    decoration:
                                                        const BoxDecoration(
                                                      color: CustomAppColors
                                                          .appWhiteColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
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
                                              color:
                                                  CustomAppColors.lblOrgColor,
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
                                          10, 2, 9, 2),
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
                                      padding: const EdgeInsets.fromLTRB(
                                          9, 10, 9, 2),
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
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 7, top: 2),
                                      child: Container(
                                        height: 30,
                                        width: 142,
                                        decoration: BoxDecoration(
                                          color: CustomAppColors.lblOrgColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                        ),
                                        child: arrMyFavoriteLis[index]
                                                        ['favoriteID']
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
                                                              Radius.circular(
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
                                                          InkWell(
                                                            focusColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            splashColor: Colors
                                                                .transparent,
                                                            onTap: () {
                                                              print(
                                                                  'Remove Item into cart Count: $index');
                                                            },
                                                            child: Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                height: 30,
                                                                width: 25,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              6),
                                                                  child:
                                                                      CustomeTextStyle(
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    text: "-",
                                                                    size: 12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    color: CustomAppColors
                                                                        .appWhiteColor,
                                                                    wordSpacing:
                                                                        0.5,
                                                                  ),
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
                                                                  text: "10",
                                                                  size: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800,
                                                                  color: CustomAppColors
                                                                      .appWhiteColor,
                                                                  wordSpacing:
                                                                      0.5,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          InkWell(
                                                            focusColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            splashColor: Colors
                                                                .transparent,
                                                            onTap: () {
                                                              print(
                                                                  'Add Item into cart Count: $index');
                                                            },
                                                            child: Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                height: 30,
                                                                width: 25,
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              6),
                                                                  child:
                                                                      CustomeTextStyle(
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    text: "+",
                                                                    size: 12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w800,
                                                                    color: CustomAppColors
                                                                        .appWhiteColor,
                                                                    wordSpacing:
                                                                        0.5,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    focusColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    splashColor:
                                                        Colors.transparent,
                                                    onTap: () {
                                                      print(
                                                          'Add To Cart Item: $index');
                                                    },
                                                    child: Expanded(
                                                      flex: 1,
                                                      child: Container(
                                                        height: 30,
                                                        width: 71,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: CustomAppColors
                                                              .lblOrgColor,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    8),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    8),
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
                                                                        .ProfileAddToCart),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Center(
                                                child: InkWell(
                                                  focusColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  splashColor:
                                                      Colors.transparent,
                                                  onTap: () {
                                                    print(
                                                        'Add To Cart Item: $index');
                                                  },
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
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 32),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: CustomAppColors.lblOrgColor,
                              backgroundColor: CustomAppColors.switchOrgColor,
                            ),
                          ),
                        );
                      }
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}*/
