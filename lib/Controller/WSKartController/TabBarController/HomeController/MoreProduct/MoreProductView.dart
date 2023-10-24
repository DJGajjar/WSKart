import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wskart/Constants/ServiceList.dart';
import 'package:wskart/Constants/convert_data.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/SearchController/SearchTabController.dart';
import 'package:wskart/Service/Model/ProductModel/Product.dart';
import '../../../../../ExtraClass/Routes/AppPages.dart';
import 'MoreProductController.dart';
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

class MoreProductView extends GetView<MoreProductController> {
  const MoreProductView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    MoreProductController moreProductController =
        Get.put(MoreProductController());

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

    final getStorge = GetStorage();
    final String strTitle = getStorge.read("NavTitle");

    ContainerTransitionType _transitionType = ContainerTransitionType.fade;

    controller.onInit();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: CustomeTextStyle(
          text: strTitle,
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
      body: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.heightBox,
            Container(
              child: Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: moreProductController.isHomeLoading.value
                      ? Center(
                          child: CircularProgressIndicator(
                            color: CustomAppColors.lblOrgColor,
                            backgroundColor: CustomAppColors.switchOrgColor,
                          ),
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 0.57,
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 24,
                          ),
                          itemCount: moreProductController.productListCount,
                          //shopProductController.products!.length, //,
                          itemBuilder: (context, index) {
                            String? price;
                            if (moreProductController
                                    .products?[index].regularPrice !=
                                '0') {
                              price = moreProductController
                                  .products?[index].regularPrice;
                            } else {
                              price =
                                  moreProductController.products?[index].price;
                            }

                            double numberPrice =
                                ConvertData.stringToDouble(price);
                            double numberSale = ConvertData.stringToDouble(
                                moreProductController
                                    .products?[index].salePrice);
                            double percent =
                                ((numberPrice - numberSale) * 100) /
                                    numberPrice;
                            String discountPercentage = percent.toStringAsFixed(
                                percent.truncateToDouble() == percent ? 0 : 1);
                            Product productDetail =
                                moreProductController.products![index];

                            if (index <
                                moreProductController.productListCount) {
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
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  '${moreProductController.products?[index].images?.length == 0 ? AppService.noImageUrl : moreProductController.products?[index].images?[0]['src'].toString()}',
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
                                                      discountPercentage != 0.0
                                                          ? Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 0,
                                                                      left: 6),
                                                              child: Container(
                                                                width: 46,
                                                                height: 20,
                                                                // color: CustomAppColors.lblOrgColor,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: CustomAppColors
                                                                      .lblOrgColor,
                                                                  borderRadius:
                                                                      BorderRadius.all(
                                                                          Radius.circular(
                                                                              8)),
                                                                ),
                                                                child: Center(
                                                                  child:
                                                                      CustomeTextStyle(
                                                                    text: discountPercentage
                                                                            .toString() +
                                                                        '%',
                                                                    size: 12,
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
                                                                .only(right: 6),
                                                        child: Container(
                                                          width: 28,
                                                          height: 28,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: CustomAppColors
                                                                .appWhiteColor,
                                                            borderRadius:
                                                                BorderRadius
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
                                            padding: const EdgeInsets.fromLTRB(
                                                9, 4, 9, 2),
                                            child: Container(
                                              child: CustomeTextStyle(
                                                text:
                                                    '${moreProductController.products?[index].name ?? ''}',
                                                size: 12,
                                                fontWeight: FontWeight.w400,
                                                color: CustomAppColors
                                                    .lblDarkColor,
                                                wordSpacing: 0.5,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
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
                                                          '${moreProductController.products?[index].averageRating ?? 0.0}'),
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
                                                      '(${moreProductController.products?[index].ratingCount.toString() ?? "0"})',
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
                                                text:
                                                    '${moreProductController.products?[index].stockStatus ?? ""}',
                                                size: 10,
                                                fontWeight: FontWeight.w400,
                                                color: CustomAppColors
                                                    .lblDarkColor,
                                                wordSpacing: 0.5,
                                              ),
                                            ),
                                          ),
                                          moreProductController.products?[index]
                                                      .onSale ==
                                                  true
                                              ? Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          9, 10, 9, 2),
                                                  child: Container(
                                                    width: 120,
                                                    height: 10,
                                                    child: RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text: ' ₹'
                                                                '${moreProductController.products?[index].regularPrice ?? "0"}',
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
                                                                '${moreProductController.products?[index].salePrice ?? "0"}',
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
                                                      textAlign: TextAlign.left,
                                                    ),
                                                  ),
                                                )
                                              : Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          9, 8, 9, 4),
                                                  child: Container(
                                                    width: 120,
                                                    height: 10,
                                                    child: CustomeTextStyle(
                                                      text: ' ₹'
                                                          '${moreProductController.products?[index].regularPrice ?? "0"}',
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
                                            highlightColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            onTap: () {
                                              print('Add To Cart Item: $index');
                                              if (getStorge.read("isLogin") ==
                                                  null) {
                                                Future.delayed(
                                                    const Duration(
                                                        milliseconds: 100), () {
                                                  controller.LoginScreen();
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
                          }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
