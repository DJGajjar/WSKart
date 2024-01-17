import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/Service/Helper/RequestHelper.dart';
import 'dart:convert';

import 'package:wskart/Service/Model/AddToCart/cart.dart';

class MyCartController extends GetxController {
  var isShowCartIcon = false.obs;

  List<CartData>? addToCartList = <CartData>[];

  final RequestHelper _requestHelper = RequestHelper();
  final getStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    listOfMyCartProduct();
  }

  listOfMyCartProduct() async {
    isShowCartIcon = true.obs;

    String strUName = getStorage.read('username');
    print("Username: $strUName");

    final cartParam = {
      "username": strUName,
    };

    String username = 'ck_75f0fb4f01d40ba1d3a929ecad0e945ad4a45835';
    String password = 'cs_ec0d804850aed2c78ef589e31b40ad08521831fc';

    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    print(basicAuth);

    try {
      addToCartList = await _requestHelper.getListOfMyCartProduct(
          queryParameters: cartParam);

      print('CAlue OD: ${addToCartList}');

      // var response = await Dio(BaseOptions(
      //         headers: <String, String>{'authorization': basicAuth}))
      //     .get('https://wskart.in/wp-json/ade-woocart/v1/cart');
      //
      // print('Responce: ${response.data}');
      // print('Responce message: ${response.data['message']}');
    } catch (error) {
      print(error);
    }
  }

  /*Future<List<AddToCart>> getListOfMyCartProduct() async {


    try {
      var response = await Dio(BaseOptions(
          headers: <String, String>{'authorization': basicAuth}))
          .get('https://wskart.in/wp-json/ade-woocart/v1/cart');

      // http.Response response = await http.get(Uri.parse(myUrl), headers: {
      //   'Accept': 'application/json',
      //   'Authorization': 'Bearer $token'
      // });

      // here you get your response data as Map
      final Map<String, dynamic> responseData = json.decode(response.data);
      // here you convert your data list to UserData list
      final userDataList = (responseData['cart_items'])
          .map((e) => AddToCart.fromJson(e))
          .toList();

      // factory UserCollection.fromJson(Map<String, dynamic> json) {
      //   return UserCollection(
      //       statusCode: json['statusCode'] as int,
      //       data: User.fromJson(json.decode(json['data'])),
      //       version: json['version'] as String );
      // }

      for (final element in userDataList) {
        // if you need comp_type you can get it from your model
        print(element.product_id);
      }

      return userDataList;
    } on DioException {
      rethrow;
    }
  }*/

  Future<List<CartData>?> getListOfMyCartProduct() async {
    String username = 'ck_75f0fb4f01d40ba1d3a929ecad0e945ad4a45835';
    String password = 'cs_ec0d804850aed2c78ef589e31b40ad08521831fc';

    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));
    print(basicAuth);

    try {
      var response = await Dio(BaseOptions(
              headers: <String, String>{'authorization': basicAuth}))
          .get('https://wskart.in/wp-json/ade-woocart/v1/cart');

      print('Responce: ${response.data}');
      print('Responce message: ${response.data['message']}');

      List<CartData>? cartList = <CartData>[];

      cartList = response.data
          .map((cartList) => CartData.fromJson(cartList))
          .toList()
          .cast<CartData>();

      print("Valllll>>>> ${cartList}");
      return cartList;
    } on DioException {
      rethrow;
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
}
