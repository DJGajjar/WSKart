import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/Constants/convert_data.dart';
import 'package:wskart/Constants/query.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';
import 'package:wskart/Service/Model/ProductModel/Product.dart';
import 'package:wskart/Service/Model/ProductModel/TodayProduct.dart';
import 'package:wskart/Service/Model/ProductModel/TrendingProduct.dart';
import 'package:wskart/Service/Model/ProductModel/BestProduct.dart';
import 'package:wskart/Service/Model/ProductModel/NewlyProduct.dart';
import 'package:wskart/Service/Helper/APIHelper.dart';
import 'package:wskart/Service/Helper/RequestHelper.dart';

class MoreProductController extends GetxController {
  var isHomeLoading = true.obs;
  var isAddLoading = false.obs;
  var isPageEnd = false.obs;

  final RequestHelper _requestHelper = RequestHelper();
  final APIHelper _apiHelper = APIHelper();
  final getStorage = GetStorage();
  Map<String, String>? randomParam;

  List<Product>? products = <Product>[];
  var productList = List<Product>.empty(growable: true).obs;

  int productListCount = 0;
  int perPageCount = 1;

  @override
  void onInit() {
    super.onInit();

    if (getStorage.read("NavTitle") == "Today's Best Deal") {
      fetchTodayProductDataList();
    } else if (getStorage.read("NavTitle") == "Best Selling") {
      fetchBestProductDataList();
    } else if (getStorage.read("NavTitle") == "Newly Arrival") {
      fetchNewlyProductDataList();
    } else if (getStorage.read("NavTitle") == "Trending Viewed") {
      fetchTrendingProductDataList();
    } else if (getStorage.read("BrandProduct") == "Yes") {
      fetchBrandProductDataList();
    }

    print('On init State');
  }

  @override
  void onReady() {
    super.onReady();

    print('On Ready State');
  }

  @override
  void onClose() {
    super.onClose();

    print('On Close Event');
  }

  @override
  void dispose() {
    super.dispose();

    print('Dispose State Call');
  }

  fetchTodayProductDataList() async {
    isHomeLoading(true);

    final randomParam = {
      "page": perPageCount.toString(),
      "per_page": '10',
      "status": 'publish',
      "stock_status": 'instock',
      "orderby": 'rand',
    };

    try {
      products = await _requestHelper.getWSKartProductsCategoryItemList(
          queryParameters: preQueryParameters(randomParam));

      if (products?.length != 0) {
        productList.addAll(products!);
        print('Product ADD : ${productList.length}');
      }

      print('Product DataList : ${productList.length}');
      print("Today Product Data List: ${products!.length.toInt()}");

      productListCount = productList.length.toInt();

      isHomeLoading(false);
    } catch (e) {
      print('Get categories error.');
      isHomeLoading(false);
    }
  }

  fetchBestProductDataList() async {
    isHomeLoading(true);

    final randomParam = {
      "page": perPageCount.toString(),
      "per_page": '10',
      "status": 'publish',
      "stock_status": 'instock',
      "orderby": 'rand',
    };

    print('Home Param Best API Call>>>>: $randomParam');

    try {
      products = await _requestHelper.getWSKartProductsCategoryItemList(
          queryParameters: preQueryParameters(randomParam));

      print("Best Data List: ${products!.length.toInt()}");

      if (products?.length != 0) {
        productList.addAll(products!);
        print('Best Product ADD : ${productList.length}');
      }

      print('Best Product DataList : ${productList.length}');
      print("Best Product Data List: ${products!.length.toInt()}");

      productListCount = productList.length.toInt();

      isHomeLoading(false);
    } catch (e) {
      print('Get categories error.');
      isHomeLoading(false);
    }
  }

  fetchNewlyProductDataList() async {
    isHomeLoading(true);

    final randomParam = {
      "page": perPageCount.toString(),
      "per_page": '10',
      "status": 'publish',
      "stock_status": 'instock',
      "orderby": 'id',
      "order": 'desc',
    };

    print('Home Param Newly API Call>>>>: $randomParam');

    try {
      products = await _requestHelper.getWSKartProductsCategoryItemList(
          queryParameters: preQueryParameters(randomParam));

      if (products?.length != 0) {
        productList.addAll(products!);
        print('Newly Product ADD : ${productList.length}');
      }

      print('Newly Product DataList : ${productList.length}');
      print("Newly Product Data List: ${products!.length.toInt()}");

      productListCount = productList.length.toInt();

      isHomeLoading(false);
    } catch (e) {
      print('Get categories error.');

      isHomeLoading(false);
    }
  }

  fetchTrendingProductDataList() async {
    isHomeLoading(true);

    final randomParam = {
      "page": perPageCount.toString(),
      "per_page": '10',
      "status": 'publish',
      "orderby": 'date',
      "order": 'desc',
    };

    print('Home Param Trending API Call>>>>: $randomParam');

    try {
      products = await _requestHelper.getWSKartProductsCategoryItemList(
          queryParameters: preQueryParameters(randomParam));

      if (products?.length != 0) {
        productList.addAll(products!);
        print('Trending Product ADD : ${productList.length}');
      }

      print('Trending Product DataList : ${productList.length}');
      print("Trending Product Data List: ${products!.length.toInt()}");

      productListCount = productList.length.toInt();

      isHomeLoading(false);
    } catch (e) {
      print('Get categories error.');
      isHomeLoading(false);
    }
  }

  fetchBrandProductDataList() async {
    print('Value Of Brand : ${perPageCount.toString()}');

    isHomeLoading(true);

    String strBrandID = getStorage.read("BrandID");

    print('Brand ID: $strBrandID');

    final randomParam = {
      "page": perPageCount.toString(),
      "per_page": '10',
      "status": 'publish',
      "stock_status": 'instock',
      "attribute": 'pa_brand',
      "attribute_term": int.parse(strBrandID),
    };

    print('Param: $randomParam');

    try {
      products = await _requestHelper.getWSKartProductsCategoryItemList(
          queryParameters: preQueryParameters(randomParam));

      if (products?.length != 0) {
        productList.addAll(products!);
        print('Product ADD : ${productList.length}');
      }

      print('Product DataList : ${productList.length}');
      print("Brand Product Data List: ${products!.length.toInt()}");

      productListCount = productList.length.toInt();

      isHomeLoading(false);
    } catch (e) {
      print('Get categories error.');
      isHomeLoading(false);
    }
  }

  LoginScreen() {
    Get.toNamed(Routes.LOGIN);
  }
}
