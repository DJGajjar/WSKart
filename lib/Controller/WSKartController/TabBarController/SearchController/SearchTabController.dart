import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:observable/observable.dart';
import 'package:wskart/Controller/WSKartController/TabBarController/TabBarController.dart';
import 'package:wskart/ExtraClass/Routes/AppPages.dart';
import 'package:wskart/Service/Helper/APIHelper.dart';
import 'package:wskart/Service/Helper/RequestHelper.dart';
import 'package:wskart/Service/Model/ProductModel/Product.dart';
import 'package:wskart/Service/Model/ProductModel/product_category.dart';
import 'package:wskart/Constants/query.dart';

class SearchTabController extends GetxController {
  var isLoading = false.obs;
  var isPageEnd = false.obs;

  String? selectCatID;
  String? clickCatID = "Yes";

  final getStorage = GetStorage();
  final RequestHelper _requestHelper = RequestHelper();
  final APIHelper _apiHelper = APIHelper();
  final TabBarController _tabController = TabBarController();

  List<Product>? products = <Product>[];
  var productList = List<Product>.empty(growable: true).obs;

  List<ProductCategory>? categories = <ProductCategory>[];

  int productListCount = 0;
  int perPageCount = 1;

  @override
  Future<void> onInit() async {
    super.onInit();
    print('Shop View Opne data Call');

    if (getStorage.read("TabIndex") != null) {
      if (getStorage.read("TabIndex") == 1) {
        print('Tab Index Select: 1');
        fetchProductShopData("1");
      }
    }
  }

  fetchProductShopData(String? categoryID) async {
    print('CatID:>>>>>> $categoryID');

    final catID = {
      "category": categoryID,
      "page": perPageCount.toString(),
      "per_page": '10',
    };

    final catAllID = {
      "page": perPageCount.toString(),
      "per_page": '10',
    };

    print('CatAllID: $catAllID');
    print('catID: $catID');

    try {
      isLoading(true);

      if (categoryID == "1") {
        products = await _requestHelper.getWSKartProductsCategoryItemList(
            queryParameters: preQueryParameters(catAllID));
      } else {
        products = await _requestHelper.getWSKartProductsCategoryItemList(
            queryParameters: preQueryParameters(catID));
      }

      if (products?.length != 0) {
        productList.addAll(products!);
        print('Product ADD : ${productList.length}');
      }

      print('Product DataList : ${productList.length}');
      print("Product Data List: ${products!.length.toInt()}");

      clickCatID = "No";

      productListCount = productList.length.toInt();
    } catch (error) {
      print('Store Product Error: $error');
      isLoading(false);
    } finally {
      getCategoriesDataList();
    }
  }

  getCategoriesDataList() async {
    final catParam = {
      "per_page": '100',
      "parent": '0',
    };

    print('Param Cat API Call>>>>: $catParam');

    try {
      categories = await _requestHelper.getProductCategoriesList(
          queryParameters: preQueryParameters(catParam));

      categories?.insert(
          0,
          ProductCategory(
            id: 1,
            name: "All",
            slug: "all",
            parent: 0,
            description: "",
            image: {
              "id": 1,
              "date_created": "2023-09-25T13:45:10",
              "date_created_gmt": "2023-09-25T08:15:10",
              "date_modified": "2023-09-25T13:45:10",
              "date_modified_gmt": "2023-09-25T08:15:10",
              "src":
                  "https://wskart.in/wp-content/uploads/2023/09/61FUnHMINL._SL1500_-2.jpg",
              "name": "61FUnHMIN+L._SL1500_",
              "alt": ""
            },
            count: 1,
          ));

      print("Value OF Data List: ${categories!.length.toInt()}");
      print('Cat Name: ${categories![0].name}');
      isLoading(false);

      // categories = data
      //     .map((category) => ProductCategory.fromJson(category))
      //     .toList()
      //     .cast<ProductCategory>();

      // _categories = ObservableList<ProductCategory>.from(categories);

      // print('Value Of : $categories');

      // if (data.isNotEmpty) {
      //   // await _persistHelper.saveCategories(jsonEncode(data));
      // }
    } catch (e) {
      print('Get categories error.');
      isLoading(false);
    }
  }

  LoginScreen() {
    Get.toNamed(Routes.LOGIN);
  }

  /*
  Future<void> _handleAddToCart(
      BuildContext context, int productID, String stockStatus) async {
    if (productID == null) return;

    if (stockStatus == 'outofstock') {
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
      // showError(context, translate('product_status_outstock'));
      return;
    }

    try {
      await addToCart(productId: productID, qty: 1);
      if (mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        showSuccess(
          context,
          translate('product_add_to_cart_success'),
          action: SnackBarAction(
            label: translate('product_view_cart'),
            textColor: Colors.white,
            onPressed: () {
              navigate(context, {
                'type': 'tab',
                'route': '/',
                'args': {'key': 'screens_cart'}
              });
            },
          ),
        );
      }
    } catch (e) {
      if (context.mounted) ScaffoldMessenger.of(context).hideCurrentSnackBar();
      if (context.mounted) showError(context, e);
    }
  }

  Future<void> addToCart(
      {int? productId, int? qty, List<dynamic>? variation}) async {
    isLoading(true);
    try {
      await _cartStore.addToCart({
        'id': productId,
        'quantity': qty,
        'variation': variation,
      });
      isLoading(false);
    } catch (e) {
      isLoading(false);
      rethrow;
    }
  }
  */

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
