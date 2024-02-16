import 'package:json_annotation/json_annotation.dart';
import 'package:wskart/Constants/UnescapeMixin.dart' show unescape;
import 'package:wskart/Constants/convert_data.dart';
part 'cart.g.dart';

@JsonSerializable(createToJson: false)
class CartProductList {
  int? cart_count;

  String? message;

  String? data;

  String? time;

  @JsonKey(name: 'cart_totals')
  CartTotal? cartTotals;

  @JsonKey(name: 'cart_items')
  List<CartList?>? cartItems;

  @JsonKey(name: 'user_data')
  UserData? userData;

  CartProductList({
    this.cart_count,
    this.message,
    this.data,
    this.time,
    this.cartItems,
    this.cartTotals,
    this.userData,
  });

  factory CartProductList.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson({
        ...json,
        "rawData": json,
      });
}

class CartList {
  String? key;

  String? product_id;

  String? product_name;

  String? product_price;

  String? product_image;

  String? quantity;

  CartList({
    this.key,
    this.product_id,
    this.product_name,
    this.product_price,
    this.product_image,
    this.quantity,
  });

  factory CartList.fromJson(Map<String, dynamic> json) =>
      _$CartListFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}

class CartTotal {
  String? subtotal;
  String? subtotal_tax;
  String? shipping_total;
  String? shipping_tax;
  String? discount_total;
  String? discount_tax;
  String? cart_contents_total;
  String? cart_contents_tax;
  String? fee_total;
  String? fee_tax;
  String? total;
  String? total_tax;

  CartTotal({
    this.subtotal,
    this.subtotal_tax,
    this.shipping_total,
    this.shipping_tax,
    this.discount_total,
    this.discount_tax,
    this.cart_contents_total,
    this.cart_contents_tax,
    this.fee_total,
    this.fee_tax,
    this.total,
    this.total_tax,
  });

  factory CartTotal.fromJson(Map<String, dynamic> json) =>
      _$CartTotalFromJson(json);

  Map<String, dynamic> toJson() => _$CartTotalToJson(this);
}

class UserData {
  String? full_name;
  String? first_name;
  String? last_name;

  @JsonKey(name: 'shipping')
  ShippingInfo? shippingData;

  UserData({
    this.full_name,
    this.first_name,
    this.last_name,
    this.shippingData,
  });

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

class ShippingInfo {
  String? first_name;
  String? last_name;
  String? company;
  String? address_1;
  String? address_2;
  String? city;
  String? postcode;
  String? country;
  String? state;
  String? phone;

  ShippingInfo({
    this.first_name,
    this.last_name,
    this.company,
    this.address_1,
    this.address_2,
    this.city,
    this.postcode,
    this.country,
    this.state,
    this.phone,
  });

  factory ShippingInfo.fromJson(Map<String, dynamic> json) =>
      _$ShippingInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingInfoToJson(this);
}
