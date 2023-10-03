import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/ProfileController/MyFavorite/ProductDetail/ProductDetailView.dart';
import '../../../../Service/Helper/RequestHelper.dart';
import 'SearchTabController.dart';
import 'package:wskart/ExtraClass/AppColor.dart';
import 'package:wskart/ExtraClass/AppImage.dart';
import 'package:wskart/ExtraClass/TextStyle/TestStyle.dart';
import 'package:wskart/ExtraClass/CustomButton/RoundedButton.dart';
import 'package:get_storage/get_storage.dart';
import 'package:dio/dio.dart';
import 'package:wskart/Constants/ServiceList.dart';
import 'package:wskart/Service/Modules/NetworkModule.dart';
import 'package:wskart/Service/Model/ProductModel/Product.dart';

/*
class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  var isLoading = false.obs;
  late final DioClient _dioClient;
  // final dio = Dio();
  // final _requestHelper = RequestHelper;
  // RequestHelper? _requestHelper;
  // final product = products;

  final dio = Dio();
  List<Product>? products = <Product>[];

  @override
  void initState() {
    super.initState();
    print('Shop View Opne data Call');
    getData();
  }

  void getData() async {
    try {
      var response = await Dio().get(
        AppService.restUrl + AppService.getProducts,
        queryParameters: {
          'consumer_key': 'ck_75f0fb4f01d40ba1d3a929ecad0e945ad4a45835',
          'consumer_secret': 'cs_ec0d804850aed2c78ef589e31b40ad08521831fc',
        },
      );
      print('URL_List_Data: ${AppService.restUrl + AppService.getProducts}');
      print('RESPONCE DATA LIST: $response');

      if (response.statusCode == 200) {
        setState(() {
          print('Responce>>>>>>: $response');

          products = response.data
              .map((product) => Product.fromJson(product))
              .toList()
              .cast<Product>();

          //List<MessageData> messages = _messageStore.messages;
          print('List Of Product Data: ${products}');
          print('List Of Product Data123: ${products?.length}');
          print('List Of Product Dat589996: ${products}');
        });
      } else {
        print('RESPONSE DATA>>>>>>++++: ${response.statusCode}');
      }
    } catch (e) {
      print('ERROR SHOW+++++: $e');
    }
  }

  void showProductDataList(BuildContext context, Product product) {
    print('Value of product ID: ${product.id}');
  }
  // fetchProductShopData() async {
  //   Map<String, String?> queryParams = {
  //     'consumer_key': 'ck_75f0fb4f01d40ba1d3a929ecad0e945ad4a45835',
  //     'consumer_secret': 'cs_ec0d804850aed2c78ef589e31b40ad08521831fc',
  //   };
  //
  //   print('Value Of Param: $queryParams');
  //
  //   try {
  //     final response = await dio.get(
  //       AppService.getProducts,
  //       queryParameters: {
  //         'consumer_key': 'ck_75f0fb4f01d40ba1d3a929ecad0e945ad4a45835',
  //         'consumer_secret': 'cs_ec0d804850aed2c78ef589e31b40ad08521831fc',
  //       },
  //     );
  //
  //     print('respinc datasds dasd: $response');
  //
  //     // final data = await _dioClient.get(
  //     //   AppService.getProducts,
  //     //   queryParameters: queryParams,
  //     //   // cancelToken: cancelToken,
  //     // );
  //     //
  //     // print('Product API Responce : $data');
  //
  //     // List<Product>? products = <Product>[];
  //     // products = data
  //     //     .map((product) => Product.fromJson(product))
  //     //     .toList()
  //     //     .cast<Product>();
  //     //
  //     // print('List Of Product Data: $products');
  //     // return products;
  //   } on DioException {
  //     rethrow;
  //   }
  //
  //   // try {
  //   //   isLoading(true);
  //   //   // _requestHelper
  //   //   // _requestHelper?.getWSKartProductsItemList(queryParameters: queryParams);
  //   // } catch (error) {
  //   //   print('Store Product Error: $error');
  //   // } finally {
  //   //   isLoading(false);
  //   //   print('Finish API Call');
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    var screenSize = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (screenSize.height - kToolbarHeight - 24) / 2;
    final double itemWidth = screenSize.width / 2;

    var isAllSelect = true.obs;
    var isHoodiesSelect = false.obs;
    var isTshirtSelect = false.obs;
    var isDressesSelect = false.obs;
    var isSportswearSelect = false.obs;
    var isSingleSelect = false.obs;

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

    ContainerTransitionType _transitionType = ContainerTransitionType.fade;

    SearchController shopProductController = Get.put(SearchController());

    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: formGlobalKey,
          child: Obx(
            () => Column(
              children: [
                10.heightBox,
                Container(
                  height: 36,
                  width: (screenSize.width),
                  // color: CustomAppColors.lblOrgColor,
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
                            print('All Item');
                            isAllSelect.value = true;
                            isHoodiesSelect.value = false;
                            isTshirtSelect.value = false;
                            isDressesSelect.value = false;
                            isSportswearSelect.value = false;
                            isSingleSelect.value = false;
                          },
                          child: Container(
                            width: 62,
                            height: 36,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  isAllSelect == true
                                      ? Container(
                                          width: 6,
                                          height: 6,
                                          decoration: const BoxDecoration(
                                            color: CustomAppColors.badgeBGColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(6),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  isAllSelect == true ? 8.widthBox : 0.widthBox,
                                  Container(
                                    child: CustomeTextStyle(
                                      text: "All",
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: CustomAppColors.lblDarkColor,
                                      wordSpacing: 4,
                                    ),
                                  ),
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
                            print('Hoodies Item');
                            isAllSelect.value = false;
                            isHoodiesSelect.value = true;
                            isTshirtSelect.value = false;
                            isDressesSelect.value = false;
                            isSportswearSelect.value = false;
                            isSingleSelect.value = false;
                          },
                          child: Container(
                            width: 96,
                            height: 36,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  isHoodiesSelect == true
                                      ? Container(
                                          width: 6,
                                          height: 6,
                                          decoration: const BoxDecoration(
                                            color: CustomAppColors.badgeBGColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(6),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  isHoodiesSelect == true
                                      ? 8.widthBox
                                      : 0.widthBox,
                                  Container(
                                    child: CustomeTextStyle(
                                      text: "Hoodies",
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: CustomAppColors.lblDarkColor,
                                      wordSpacing: 4,
                                    ),
                                  ),
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
                            print('Hoodies Item');
                            isAllSelect.value = false;
                            isHoodiesSelect.value = false;
                            isTshirtSelect.value = true;
                            isDressesSelect.value = false;
                            isSportswearSelect.value = false;
                            isSingleSelect.value = false;
                          },
                          child: Container(
                            width: 86,
                            height: 36,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  isTshirtSelect == true
                                      ? Container(
                                          width: 6,
                                          height: 6,
                                          decoration: const BoxDecoration(
                                            color: CustomAppColors.badgeBGColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(6),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  isTshirtSelect == true
                                      ? 8.widthBox
                                      : 0.widthBox,
                                  Container(
                                    child: CustomeTextStyle(
                                      text: "T-shirt",
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: CustomAppColors.lblDarkColor,
                                      wordSpacing: 4,
                                    ),
                                  ),
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
                            print('Hoodies Item');
                            isAllSelect.value = false;
                            isHoodiesSelect.value = false;
                            isTshirtSelect.value = false;
                            isDressesSelect.value = true;
                            isSportswearSelect.value = false;
                            isSingleSelect.value = false;
                          },
                          child: Container(
                            width: 84,
                            height: 36,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  isDressesSelect == true
                                      ? Container(
                                          width: 6,
                                          height: 6,
                                          decoration: const BoxDecoration(
                                            color: CustomAppColors.badgeBGColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(6),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  isDressesSelect == true
                                      ? 8.widthBox
                                      : 0.widthBox,
                                  Container(
                                    child: CustomeTextStyle(
                                      text: "Dresses",
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: CustomAppColors.lblDarkColor,
                                      wordSpacing: 4,
                                    ),
                                  ),
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
                            print('Hoodies Item');
                            isAllSelect.value = false;
                            isHoodiesSelect.value = false;
                            isTshirtSelect.value = false;
                            isDressesSelect.value = false;
                            isSportswearSelect.value = true;
                            isSingleSelect.value = false;
                          },
                          child: Container(
                            width: 110,
                            height: 36,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  isSportswearSelect == true
                                      ? Container(
                                          width: 6,
                                          height: 6,
                                          decoration: const BoxDecoration(
                                            color: CustomAppColors.badgeBGColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(6),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  isSportswearSelect == true
                                      ? 8.widthBox
                                      : 0.widthBox,
                                  Container(
                                    child: CustomeTextStyle(
                                      text: "Sportswear",
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: CustomAppColors.lblDarkColor,
                                      wordSpacing: 4,
                                    ),
                                  ),
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
                            print('Hoodies Item');
                            isAllSelect.value = false;
                            isHoodiesSelect.value = false;
                            isTshirtSelect.value = false;
                            isDressesSelect.value = false;
                            isSportswearSelect.value = false;
                            isSingleSelect.value = true;
                          },
                          child: Container(
                            width: 80,
                            height: 36,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  isSingleSelect == true
                                      ? Container(
                                          width: 6,
                                          height: 6,
                                          decoration: const BoxDecoration(
                                            color: CustomAppColors.badgeBGColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(6),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  isSingleSelect == true
                                      ? 8.widthBox
                                      : 0.widthBox,
                                  Container(
                                    child: CustomeTextStyle(
                                      text: "Single",
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: CustomAppColors.lblDarkColor,
                                      wordSpacing: 4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        16.widthBox,
                      ],
                    ),
                  ),
                ),
                10.heightBox,
                Container(
                  height: (screenSize.height - 275),
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: CustomAppColors
                                                              .lblOrgColor,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8)),
                                                        ),
                                                        child: Center(
                                                          child:
                                                              CustomeTextStyle(
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
                                                                  Radius
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
                                              text: "Sofa Furniture Leg 3",
                                              size: 12,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  CustomAppColors.lblDarkColor,
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
                                              10, 2, 9, 2),
                                          child: Container(
                                            width: 120,
                                            height: 10,
                                            child: CustomeTextStyle(
                                              text: "In Stock",
                                              size: 10,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  CustomAppColors.lblDarkColor,
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
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 7, top: 2),
                                          child: Container(
                                            height: 30,
                                            width: 142,
                                            decoration: BoxDecoration(
                                              color:
                                                  CustomAppColors.lblOrgColor,
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
                                                                  .circular(8),
                                                              bottomLeft: Radius
                                                                  .circular(8),
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
                                                                  child:
                                                                      Container(
                                                                    height: 30,
                                                                    width: 25,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              6),
                                                                      child:
                                                                          CustomeTextStyle(
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        text:
                                                                            "-",
                                                                        size:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w800,
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
                                                                child:
                                                                    Container(
                                                                  height: 30,
                                                                  child: Center(
                                                                    child:
                                                                        CustomeTextStyle(
                                                                      text:
                                                                          "10",
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
                                                                  child:
                                                                      Container(
                                                                    height: 30,
                                                                    width: 25,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              6),
                                                                      child:
                                                                          CustomeTextStyle(
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        text:
                                                                            "+",
                                                                        size:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w800,
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
                                                                  BorderRadius
                                                                      .only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
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
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} */

// GetX Method Call
class SearchView extends GetView<SearchTabController> {
  const SearchView({Key? key}) : super(key: key);

  static final GlobalKey<FormState> formGlobalKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final mobileNumber = GetStorage();

    var screenSize = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (screenSize.height - kToolbarHeight - 24) / 2;
    final double itemWidth = screenSize.width / 2;

    var isAllSelect = true.obs;
    var isHoodiesSelect = false.obs;
    var isTshirtSelect = false.obs;
    var isDressesSelect = false.obs;
    var isSportswearSelect = false.obs;
    var isSingleSelect = false.obs;

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

    ContainerTransitionType _transitionType = ContainerTransitionType.fade;

    SearchController shopProductController = Get.put(SearchController());

    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Form(
          key: formGlobalKey,
          child: Obx(
            () => Column(
              children: [
                10.heightBox,
                Container(
                  height: 36,
                  width: (screenSize.width),
                  // color: CustomAppColors.lblOrgColor,
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
                            print('All Item');
                            isAllSelect.value = true;
                            isHoodiesSelect.value = false;
                            isTshirtSelect.value = false;
                            isDressesSelect.value = false;
                            isSportswearSelect.value = false;
                            isSingleSelect.value = false;
                          },
                          child: Container(
                            width: 62,
                            height: 36,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  isAllSelect == true
                                      ? Container(
                                          width: 6,
                                          height: 6,
                                          decoration: const BoxDecoration(
                                            color: CustomAppColors.badgeBGColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(6),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  isAllSelect == true ? 8.widthBox : 0.widthBox,
                                  Container(
                                    child: CustomeTextStyle(
                                      text: "All",
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: CustomAppColors.lblDarkColor,
                                      wordSpacing: 4,
                                    ),
                                  ),
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
                            print('Hoodies Item');
                            isAllSelect.value = false;
                            isHoodiesSelect.value = true;
                            isTshirtSelect.value = false;
                            isDressesSelect.value = false;
                            isSportswearSelect.value = false;
                            isSingleSelect.value = false;
                          },
                          child: Container(
                            width: 96,
                            height: 36,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  isHoodiesSelect == true
                                      ? Container(
                                          width: 6,
                                          height: 6,
                                          decoration: const BoxDecoration(
                                            color: CustomAppColors.badgeBGColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(6),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  isHoodiesSelect == true
                                      ? 8.widthBox
                                      : 0.widthBox,
                                  Container(
                                    child: CustomeTextStyle(
                                      text: "Hoodies",
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: CustomAppColors.lblDarkColor,
                                      wordSpacing: 4,
                                    ),
                                  ),
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
                            print('Hoodies Item');
                            isAllSelect.value = false;
                            isHoodiesSelect.value = false;
                            isTshirtSelect.value = true;
                            isDressesSelect.value = false;
                            isSportswearSelect.value = false;
                            isSingleSelect.value = false;
                          },
                          child: Container(
                            width: 86,
                            height: 36,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  isTshirtSelect == true
                                      ? Container(
                                          width: 6,
                                          height: 6,
                                          decoration: const BoxDecoration(
                                            color: CustomAppColors.badgeBGColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(6),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  isTshirtSelect == true
                                      ? 8.widthBox
                                      : 0.widthBox,
                                  Container(
                                    child: CustomeTextStyle(
                                      text: "T-shirt",
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: CustomAppColors.lblDarkColor,
                                      wordSpacing: 4,
                                    ),
                                  ),
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
                            print('Hoodies Item');
                            isAllSelect.value = false;
                            isHoodiesSelect.value = false;
                            isTshirtSelect.value = false;
                            isDressesSelect.value = true;
                            isSportswearSelect.value = false;
                            isSingleSelect.value = false;
                          },
                          child: Container(
                            width: 84,
                            height: 36,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  isDressesSelect == true
                                      ? Container(
                                          width: 6,
                                          height: 6,
                                          decoration: const BoxDecoration(
                                            color: CustomAppColors.badgeBGColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(6),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  isDressesSelect == true
                                      ? 8.widthBox
                                      : 0.widthBox,
                                  Container(
                                    child: CustomeTextStyle(
                                      text: "Dresses",
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: CustomAppColors.lblDarkColor,
                                      wordSpacing: 4,
                                    ),
                                  ),
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
                            print('Hoodies Item');
                            isAllSelect.value = false;
                            isHoodiesSelect.value = false;
                            isTshirtSelect.value = false;
                            isDressesSelect.value = false;
                            isSportswearSelect.value = true;
                            isSingleSelect.value = false;
                          },
                          child: Container(
                            width: 110,
                            height: 36,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  isSportswearSelect == true
                                      ? Container(
                                          width: 6,
                                          height: 6,
                                          decoration: const BoxDecoration(
                                            color: CustomAppColors.badgeBGColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(6),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  isSportswearSelect == true
                                      ? 8.widthBox
                                      : 0.widthBox,
                                  Container(
                                    child: CustomeTextStyle(
                                      text: "Sportswear",
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: CustomAppColors.lblDarkColor,
                                      wordSpacing: 4,
                                    ),
                                  ),
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
                            print('Hoodies Item');
                            isAllSelect.value = false;
                            isHoodiesSelect.value = false;
                            isTshirtSelect.value = false;
                            isDressesSelect.value = false;
                            isSportswearSelect.value = false;
                            isSingleSelect.value = true;
                          },
                          child: Container(
                            width: 80,
                            height: 36,
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  isSingleSelect == true
                                      ? Container(
                                          width: 6,
                                          height: 6,
                                          decoration: const BoxDecoration(
                                            color: CustomAppColors.badgeBGColor,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(6),
                                            ),
                                          ),
                                        )
                                      : Container(),
                                  isSingleSelect == true
                                      ? 8.widthBox
                                      : 0.widthBox,
                                  Container(
                                    child: CustomeTextStyle(
                                      text: "Single",
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                      color: CustomAppColors.lblDarkColor,
                                      wordSpacing: 4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        16.widthBox,
                      ],
                    ),
                  ),
                ),
                10.heightBox,
                Container(
                  height: (screenSize.height - 275),
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
                                                        decoration:
                                                            BoxDecoration(
                                                          color: CustomAppColors
                                                              .lblOrgColor,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                  Radius
                                                                      .circular(
                                                                          8)),
                                                        ),
                                                        child: Center(
                                                          child:
                                                              CustomeTextStyle(
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
                                                                  Radius
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
                                              text: "Sofa Furniture Leg 3",
                                              size: 12,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  CustomAppColors.lblDarkColor,
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
                                              10, 2, 9, 2),
                                          child: Container(
                                            width: 120,
                                            height: 10,
                                            child: CustomeTextStyle(
                                              text: "In Stock",
                                              size: 10,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  CustomAppColors.lblDarkColor,
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
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 7, top: 2),
                                          child: Container(
                                            height: 30,
                                            width: 142,
                                            decoration: BoxDecoration(
                                              color:
                                                  CustomAppColors.lblOrgColor,
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
                                                                  .circular(8),
                                                              bottomLeft: Radius
                                                                  .circular(8),
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
                                                                  child:
                                                                      Container(
                                                                    height: 30,
                                                                    width: 25,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              6),
                                                                      child:
                                                                          CustomeTextStyle(
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        text:
                                                                            "-",
                                                                        size:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w800,
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
                                                                child:
                                                                    Container(
                                                                  height: 30,
                                                                  child: Center(
                                                                    child:
                                                                        CustomeTextStyle(
                                                                      text:
                                                                          "10",
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
                                                                  child:
                                                                      Container(
                                                                    height: 30,
                                                                    width: 25,
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              6),
                                                                      child:
                                                                          CustomeTextStyle(
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        text:
                                                                            "+",
                                                                        size:
                                                                            12,
                                                                        fontWeight:
                                                                            FontWeight.w800,
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
                                                                  BorderRadius
                                                                      .only(
                                                                topRight: Radius
                                                                    .circular(
                                                                        8),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
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
                          }),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
