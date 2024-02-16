import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wskart/Service/Helper/RequestHelper.dart';
import 'dart:convert';
import 'package:wskart/Service/Model/AddToCart/cart.dart';

class MyCartController extends GetxController {
  var isShowCartIcon = true.obs;

  // List<Store>? addToCartList = <Store>[];

  final RequestHelper _requestHelper = RequestHelper();
  final getStorage = GetStorage();

  late CartProductList addToCartList;

  RxInt cartItemCount = 0.obs;

  @override
  void onInit() {
    super.onInit();
    listOfMyCartProduct();
  }

  listOfMyCartProduct() async {
    String strUName = getStorage.read('username');
    print("Username: $strUName");

    isShowCartIcon = true.obs;

    print("Valie Cehck?>>../>>");

    final cartParam = {
      "username": strUName,
    };

    print("Value OF User: $cartParam");

    String username = 'ck_75f0fb4f01d40ba1d3a929ecad0e945ad4a45835';
    String password = 'cs_ec0d804850aed2c78ef589e31b40ad08521831fc';

    String basicAuth =
        'Basic ' + base64.encode(utf8.encode('$username:$password'));

    print("Basic URL Create: $basicAuth");

    try {
      addToCartList = await _requestHelper.getListOfMyCartProduct(
          queryParameters: cartParam);

      print('CAlue OD: ${addToCartList.message}');
      print('Total Item List: ${addToCartList.cartItems?.length}');
      print('Total Msg: ${addToCartList.cartTotals?.subtotal}');
      print('UserData: ${addToCartList.userData?.full_name}');
      print('Shipping Data: ${addToCartList.userData?.shippingData?.country}');

      if (addToCartList.cartItems?.length != 0) {
        print("Value CJec lascal;df afkljadkls");
        cartItemCount.value = addToCartList.cartItems!.length;
        isShowCartIcon.value = false;
        print("Calea: $cartItemCount");
      }
    } catch (error) {
      print(error);
      isShowCartIcon = false.obs;
    }
  }

  /*listOfMyCartProduct() async {
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
      // addToCartList = await _requestHelper.getListOfMyCartProduct(
      //     queryParameters: cartParam);
      //
      // print('CAlue OD: ${addToCartList}');

      // var response = await Dio(BaseOptions(
      //         headers: <String, String>{'authorization': basicAuth}))
      //     .get('https://wskart.in/wp-json/ade-woocart/v1/cart');
      //
      // print('Responce: ${response.data}');
      // print('Responce message: ${response.data['message']}');
    } catch (error) {
      print(error);
    }
  }*/

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

  /*Future<List<CartProductData>?> getListOfMyCartProduct() async {
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

      List<CartProductData>? cartList = <CartProductData>[];

      cartList = response.data
          .map((cartList) => CartData.fromJson(cartList))
          .toList()
          .cast<CartData>();

      print("Valllll>>>> ${cartList}");
      return cartList;
    } on DioException {
      rethrow;
    }
  }*/

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
