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

  CartProductList({
    this.cart_count,
    this.message,
    this.data,
    this.time,
    this.cartItems,
    this.cartTotals,
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

/*
class Store {
  Store({
    required this.cart_count,
    required this.message,
    required this.data,
    required this.time,
    required this.cart_items,
  });
  int cart_count;
  String message;
  String data;
  String time;
  List cart_items;
  factory Store.fromJson(Map json) => Store(
        cart_count: json["cart_count"],
        message: json["message"],
        data: json["data"],
        time: json["time"],
        cart_items: List.from(json["cart_items"].map((x) => Datum.fromJson(x))),
      );
  Map toJson() => {
        "cart_count": cart_count,
        "message": message,
        "data": data,
        "time": time,
        "cart_items": List.from(cart_items.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.key,
    required this.product_id,
    required this.product_name,
    required this.product_price,
    required this.product_image,
    required this.quantity,
  });
  String key;
  String product_id;
  String product_name;
  String product_price;
  String product_image;
  String quantity;

  factory Datum.fromJson(Map json) => Datum(
        key: json["key"],
        product_id: json["product_id"],
        product_name: json["product_name"],
        product_price: json["product_price"],
        product_image: json["product_image"],
        quantity: json["quantity"],
      );
  Map toJson() => {
        "key": key,
        "product_id": product_id,
        "product_name": product_name,
        "product_price": product_price,
        "product_image": product_image,
        "quantity": quantity,
      };
}

*/
