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
  var isShowCartIcon = false.obs;

  var isSlowAnimations = true.obs;

  var isHomeLoading = false.obs;

  final RequestHelper _requestHelper = RequestHelper();
  final APIHelper _apiHelper = APIHelper();
  final getStorage = GetStorage();

  List<Product>? products = <Product>[];

  int productListCount = 0;

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
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  fetchTodayProductDataList() async {
    isHomeLoading(true);

    final randomParam = {
      "per_page": '10',
      "status": 'publish',
      "stock_status": 'instock',
      "orderby": 'rand',
    };

    print('Home Param Today API Call>>>>: $randomParam');

    try {
      products = await _requestHelper.getWSKartProductsCategoryItemList(
          queryParameters: preQueryParameters(randomParam));

      print("Today Product Data List: ${products!.length.toInt()}");

      productListCount = products!.length.toInt();

      isHomeLoading(false);
    } catch (e) {
      print('Get categories error.');
      isHomeLoading(false);
    }
  }

  fetchBestProductDataList() async {
    isHomeLoading(true);

    final randomParam = {
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

      productListCount = products!.length.toInt();

      isHomeLoading(false);
    } catch (e) {
      print('Get categories error.');
      isHomeLoading(false);
    }
  }

  fetchNewlyProductDataList() async {
    isHomeLoading(true);

    final randomParam = {
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

      print("Newly Data List: ${products!.length.toInt()}");

      productListCount = products!.length.toInt();

      isHomeLoading(false);
    } catch (e) {
      print('Get categories error.');

      isHomeLoading(false);
    }
  }

  fetchTrendingProductDataList() async {
    isHomeLoading(true);

    final randomParam = {
      "per_page": '10',
      "status": 'publish',
      "orderby": 'date',
      "order": 'desc',
    };

    print('Home Param Trending API Call>>>>: $randomParam');

    try {
      products = await _requestHelper.getWSKartProductsCategoryItemList(
          queryParameters: preQueryParameters(randomParam));

      print("Trending Data List: ${products!.length.toInt()}");

      productListCount = products!.length.toInt();

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
