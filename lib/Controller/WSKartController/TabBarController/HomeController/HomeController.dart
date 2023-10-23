import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/Constants/convert_data.dart';
import 'package:wskart/Service/Helper/APIHelper.dart';
import 'package:wskart/Service/Helper/RequestHelper.dart';
import 'package:wskart/Service/Model/ProductModel/BestProduct.dart';
import 'package:wskart/Service/Model/ProductModel/NewlyProduct.dart';
import 'package:wskart/Service/Model/ProductModel/RandomProduct.dart';
import 'package:wskart/Service/Model/ProductModel/TodayProduct.dart';
import 'package:wskart/Service/Model/ProductModel/TrendingProduct.dart';
import 'package:wskart/Service/Model/ProductModel/product_category.dart';
import 'package:wskart/Constants/query.dart';

class HomeController extends GetxController {
  var isHomeLoading = false.obs;

  final getStorage = GetStorage();
  final RequestHelper _requestHelper = RequestHelper();
  final APIHelper _apiHelper = APIHelper();
  List<ProductCategory>? categories = <ProductCategory>[];
  List<RandomProduct>? randomProducts = <RandomProduct>[];
  List<TodayProduct>? todayProducts = <TodayProduct>[];
  List<BestProduct>? bestProducts = <BestProduct>[];
  List<NewlyProduct>? newlyProducts = <NewlyProduct>[];
  List<TrendingProduct>? trendingProducts = <TrendingProduct>[];

  int productListCount = 0;

  String? todayPrice1;
  String? todayPrice2;
  String? bestPrice1;
  String? bestPrice2;
  String? newlyPrice1;
  String? newlyPrice2;
  String? trendingPrice1;
  String? trendingPrice2;

  String? discountTodayPercentage1;
  String? discountTodayPercentage2;
  String? discountBestPercentage1;
  String? discountBestPercentage2;
  String? discountNewlyPercentage1;
  String? discountNewlyPercentage2;
  String? discountTrendingPercentage1;
  String? discountTrendingPercentage2;

  @override
  void onInit() {
    super.onInit();
    fetchRendomProductDataList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchRendomProductDataList() async {
    isHomeLoading(true);

    final randomParam = {
      "per_page": '10',
      "status": 'publish',
      "stock_status": 'instock',
      "orderby": 'rand',
      "on_sale": 'true',
    };

    print('Home Param Random API Call>>>>: $randomParam');

    try {
      randomProducts = await _requestHelper.getWSKartRandomProductsItemList(
          queryParameters: preQueryParameters(randomParam));

      print("Value OF Data List: ${randomProducts!.length.toInt()}");
      print('Random Product Data: ${randomProducts![0].name}');

      getHomeCategoriesDataList();
    } catch (e) {
      print('Get categories error.');
      getHomeCategoriesDataList();
    }
  }

  getHomeCategoriesDataList() async {
    final catParam = {
      "per_page": '100',
      "parent": '0',
    };

    print('Home Param Cat API Call>>>>: $catParam');

    try {
      categories = await _requestHelper.getProductCategoriesList(
          queryParameters: preQueryParameters(catParam));

      print("Value OF Data List: ${categories!.length.toInt()}");
      print('Cat Name: ${categories![0].name}');

      fetchTodayProductDataList();
    } catch (e) {
      print('Get categories error.');
      fetchTodayProductDataList();
    }
  }

  fetchTodayProductDataList() async {
    final randomParam = {
      "per_page": '10',
      "status": 'publish',
      "stock_status": 'instock',
      "orderby": 'rand',
    };

    print('Home Param Today API Call>>>>: $randomParam');

    try {
      todayProducts = await _requestHelper.getWSKartTodayProductsItemList(
          queryParameters: preQueryParameters(randomParam));

      print(
          "Value OF Today Product Data List: ${todayProducts!.length.toInt()}");
      print('Random Product Data: ${todayProducts![0].name}');

      if (todayProducts!.length > 1) {
        if (todayProducts?[0].regularPrice != '0') {
          todayPrice1 = todayProducts?[0].regularPrice;
        } else {
          todayPrice1 = todayProducts?[0].price;
        }
        double numberPrice1 = ConvertData.stringToDouble(todayPrice1);
        double numberSale1 =
            ConvertData.stringToDouble(todayProducts?[0].salePrice);
        double percent1 = ((numberPrice1 - numberSale1) * 100) / numberPrice1;
        discountTodayPercentage1 = percent1
            .toStringAsFixed(percent1.truncateToDouble() == percent1 ? 0 : 1);

        if (todayProducts?[1].regularPrice != '0') {
          todayPrice2 = todayProducts?[1].regularPrice;
        } else {
          todayPrice2 = todayProducts?[1].price;
        }
        double numberPrice2 = ConvertData.stringToDouble(todayPrice2);
        double numberSale2 =
            ConvertData.stringToDouble(todayProducts?[1].salePrice);
        double percent2 = ((numberPrice2 - numberSale2) * 100) / numberPrice2;
        discountTodayPercentage2 = percent2
            .toStringAsFixed(percent2.truncateToDouble() == percent2 ? 0 : 1);
      }

      fetchBestProductDataList();
    } catch (e) {
      print('Get categories error.');
      fetchBestProductDataList();
    }
  }

  fetchBestProductDataList() async {
    final randomParam = {
      "per_page": '10',
      "status": 'publish',
      "stock_status": 'instock',
      "orderby": 'rand',
    };

    print('Home Param Today API Call>>>>: $randomParam');

    try {
      bestProducts = await _requestHelper.getWSKartBestProductsItemList(
          queryParameters: preQueryParameters(randomParam));

      print("Value OF Data List: ${bestProducts!.length.toInt()}");
      print('Random Product Data: ${bestProducts![0].name}');

      if (bestProducts!.length > 1) {
        if (bestProducts?[0].regularPrice != '0') {
          bestPrice1 = bestProducts?[0].regularPrice;
        } else {
          bestPrice1 = bestProducts?[0].price;
        }
        double numberPrice1 = ConvertData.stringToDouble(bestPrice1);
        double numberSale1 =
            ConvertData.stringToDouble(bestProducts?[0].salePrice);
        double percent1 = ((numberPrice1 - numberSale1) * 100) / numberPrice1;
        discountBestPercentage1 = percent1
            .toStringAsFixed(percent1.truncateToDouble() == percent1 ? 0 : 1);

        if (bestProducts?[1].regularPrice != '0') {
          bestPrice2 = bestProducts?[1].regularPrice;
        } else {
          bestPrice2 = bestProducts?[1].price;
        }
        double numberPrice2 = ConvertData.stringToDouble(bestPrice2);
        double numberSale2 =
            ConvertData.stringToDouble(bestProducts?[1].salePrice);
        double percent2 = ((numberPrice2 - numberSale2) * 100) / numberPrice2;
        discountBestPercentage2 = percent2
            .toStringAsFixed(percent2.truncateToDouble() == percent2 ? 0 : 1);
      }

      fetchNewlyProductDataList();
    } catch (e) {
      print('Get categories error.');
      fetchNewlyProductDataList();
    }
  }

  fetchNewlyProductDataList() async {
    final randomParam = {
      "per_page": '10',
      "status": 'publish',
      "stock_status": 'instock',
      "orderby": 'ID',
      "order": 'desc',
    };

    print('Home Param Today API Call>>>>: $randomParam');

    try {
      newlyProducts = await _requestHelper.getWSKartNewlyProductsItemList(
          queryParameters: preQueryParameters(randomParam));

      print("Value OF Data List: ${newlyProducts!.length.toInt()}");
      print('Random Product Data: ${newlyProducts![0].name}');

      if (newlyProducts!.length > 1) {
        if (newlyProducts?[0].regularPrice != '0') {
          newlyPrice1 = newlyProducts?[0].regularPrice;
        } else {
          newlyPrice1 = newlyProducts?[0].price;
        }
        double numberPrice1 = ConvertData.stringToDouble(newlyPrice1);
        double numberSale1 =
            ConvertData.stringToDouble(newlyProducts?[0].salePrice);
        double percent1 = ((numberPrice1 - numberSale1) * 100) / numberPrice1;
        discountNewlyPercentage1 = percent1
            .toStringAsFixed(percent1.truncateToDouble() == percent1 ? 0 : 1);

        if (newlyProducts?[1].regularPrice != '0') {
          newlyPrice2 = newlyProducts?[1].regularPrice;
        } else {
          newlyPrice2 = newlyProducts?[1].price;
        }
        double numberPrice2 = ConvertData.stringToDouble(newlyPrice2);
        double numberSale2 =
            ConvertData.stringToDouble(newlyProducts?[1].salePrice);
        double percent2 = ((numberPrice2 - numberSale2) * 100) / numberPrice2;
        discountNewlyPercentage2 = percent2
            .toStringAsFixed(percent2.truncateToDouble() == percent2 ? 0 : 1);
      }

      fetchTrendingProductDataList();
    } catch (e) {
      print('Get categories error.');

      fetchTrendingProductDataList();
    }
  }

  fetchTrendingProductDataList() async {
    final randomParam = {
      "per_page": '10',
      "status": 'publish',
      "orderby": 'date',
      "order": 'desc',
    };

    print('Home Param Today API Call>>>>: $randomParam');

    try {
      trendingProducts = await _requestHelper.getWSKartTrendingProductsItemList(
          queryParameters: preQueryParameters(randomParam));

      print("Value OF Data List: ${trendingProducts!.length.toInt()}");
      print('Random Product Data: ${trendingProducts![0].name}');

      isHomeLoading(false);

      if (trendingProducts!.length > 1) {
        if (trendingProducts?[0].regularPrice != '0') {
          trendingPrice1 = trendingProducts?[0].regularPrice;
        } else {
          trendingPrice1 = trendingProducts?[0].price;
        }
        double numberPrice1 = ConvertData.stringToDouble(trendingPrice1);
        double numberSale1 =
            ConvertData.stringToDouble(trendingProducts?[0].salePrice);
        double percent1 = ((numberPrice1 - numberSale1) * 100) / numberPrice1;
        discountTrendingPercentage1 = percent1
            .toStringAsFixed(percent1.truncateToDouble() == percent1 ? 0 : 1);

        if (trendingProducts?[1].regularPrice != '0') {
          trendingPrice2 = trendingProducts?[1].regularPrice;
        } else {
          trendingPrice2 = trendingProducts?[1].price;
        }
        double numberPrice2 = ConvertData.stringToDouble(trendingPrice2);
        double numberSale2 =
            ConvertData.stringToDouble(trendingProducts?[1].salePrice);
        double percent2 = ((numberPrice2 - numberSale2) * 100) / numberPrice2;
        discountTrendingPercentage2 = percent2
            .toStringAsFixed(percent2.truncateToDouble() == percent2 ? 0 : 1);
      }

      //fetchBrandDataList();
    } catch (e) {
      print('Get categories error.');
      isHomeLoading(false);
      // fetchBrandDataList();
    }
  }

  fetchBrandDataList() async {
    final randomParam = {
      "attribute": 'brand',
      "attribute_term_ids": '5',
    };

    print('Home Param Today API Call>>>>: $randomParam');

    try {
      todayProducts = await _requestHelper.getWSKartTodayProductsItemList(
          queryParameters: preQueryParameters(randomParam));

      print("Value OF Data List: ${todayProducts!.length.toInt()}");
      print('Random Product Data: ${todayProducts![0].name}');

      isHomeLoading(false);
    } catch (e) {
      print('Get categories error.');

      isHomeLoading(false);
    }
  }

  // fetchProductShopData(String? categoryID) async {
  //   print('CatID:>>>>>> $categoryID');
  //
  //   final catID = {
  //     "category": categoryID,
  //   };
  //
  //   try {
  //     if (categoryID == "1") {
  //       products = await _requestHelper.getWSKartProductsItemList();
  //     } else {
  //       products = await _requestHelper.getWSKartProductsCategoryItemList(
  //           queryParameters: preQueryParameters(catID));
  //     }
  //     productListCount = products!.length.toInt();
  //
  //     print(products!.length.toString());
  //     print(products?[0].id);
  //
  //     isHomeLoading(false);
  //   } catch (error) {
  //     print('Store Product Error: $error');
  //     isHomeLoading(false);
  //   } finally {
  //     print('Get categories error.');
  //     isHomeLoading(false);
  //   }
  // }
}

/*

 */
