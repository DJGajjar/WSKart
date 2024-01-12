import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
import 'package:wskart/Constants/UnescapeMixin.dart' show unescape;
import 'package:wskart/Constants/convert_data.dart';
part 'AddCart.g.dart';

@JsonSerializable(createToJson: false)
class AddToCart {
  @JsonKey(fromJson: unescape)
  String? username;

  String? message;

  String? data;

  String? time;

  int? cart_count;

  Map<String, dynamic>? rawData;

  AddToCart({
    this.username,
    this.message,
    this.data,
    this.time,
    this.cart_count,
    this.rawData,
  });

  factory AddToCart.fromJson(Map<String, dynamic> json) =>
      _$AddCartProductFromJson({
        ...json,
        "rawData": json,
      });
}

// @JsonSerializable()
// class AddToCart {
//   String? key;
//   int? product_id;
//   String? product_name;
//   String? product_price;
//   String? product_image;
//   String? quantity;
//
//   AddToCart({
//     this.key,
//     this.product_id,
//     this.product_name,
//     this.product_price,
//     this.product_image,
//     this.quantity,
//   });
//
//   AddToCart.fromJson(Map<String, dynamic> json) {
//     key = json['key'];
//     product_id = json['product_id'];
//     product_name = json['product_name'];
//     product_price = json['product_price'];
//     product_image = json['product_image'];
//     quantity = json['quantity'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['key'] = key;
//     data['product_id'] = product_id;
//     data['product_name'] = product_name;
//     data['product_price'] = product_price;
//     data['product_image'] = product_image;
//     data['quantity'] = quantity;
//
//     return data;
//   }
// }
