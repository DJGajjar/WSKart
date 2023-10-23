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

  final getStorage = GetStorage();
  final RequestHelper _requestHelper = RequestHelper();
  final APIHelper _apiHelper = APIHelper();
  final TabBarController _tabController = TabBarController();
  List<Product>? products = <Product>[];
  List<ProductCategory>? categories = <ProductCategory>[];

  // ObservableList<ProductCategory> _categories = ObservableList<ProductCategory>.from([]);

  // ObservableList<ProductCategory> get categories => _categories;

  int productListCount = 0;

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
    // Map<String, String?> queryParams = {
    //   'consumer_key': 'ck_75f0fb4f01d40ba1d3a929ecad0e945ad4a45835',
    //   'consumer_secret': 'cs_ec0d804850aed2c78ef589e31b40ad08521831fc',
    // };
    //
    print('CatID:>>>>>> $categoryID');

    final catID = {
      "category": categoryID,
    };

    try {
      isLoading(true);
      // List<Product>? avb = await _requestHelper.getWSKartProductsItemList();

      if (categoryID == "1") {
        products = await _requestHelper.getWSKartProductsItemList();
      } else {
        products = await _requestHelper.getWSKartProductsCategoryItemList(
            queryParameters: preQueryParameters(catID));
      }
      productListCount = products!.length.toInt();
      print(products!.length.toString());
      print(products?[0].id);
    } catch (error) {
      print('Store Product Error: $error');
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
