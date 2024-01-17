import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class CartData {
  @JsonKey(name: 'cart_count')
  String? cartCount;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  String? data;

  @JsonKey(name: 'time')
  String? time;

  // @JsonKey(fromJson: toList)
  // List<CartItem>? cart_items;

  // @JsonKey(name: 'shipping_rates', fromJson: shippingRateToList)
  // List<ShippingRate>? shippingRate;
  //
  // List? coupons;
  //
  // Map<String, dynamic>? totals;
  //
  // @JsonKey(name: 'shipping_address')
  // Map<String, dynamic> shippingAddress;
  //
  // @JsonKey(name: 'billing_address')
  // Map<String, dynamic>? billingAddress;

  CartData({
    this.message,
    this.data,
    this.time,
    this.cartCount,
    // this.cart_items,
  });

  factory CartData.fromJson(Map<String, dynamic> json) =>
      _$CartDataFromJson(json);

  Map<String, dynamic> toJson() => _$CartDataToJson(this);

  static List<CartItem> toList(List<dynamic>? data) {
    List<CartItem> newItems = <CartItem>[];

    if (data == null) return newItems;

    newItems = data.map((d) => CartItem.fromJson(d)).toList().cast<CartItem>();

    return newItems;
  }

  static List<ShippingRate> shippingRateToList(List<dynamic>? data) {
    List<ShippingRate> newShippingRate = <ShippingRate>[];

    if (data == null) return newShippingRate;

    newShippingRate =
        data.map((d) => ShippingRate.fromJson(d)).toList().cast<ShippingRate>();

    return newShippingRate;
  }
}

@JsonSerializable()
class ShippingRate {
  @JsonKey(name: 'package_id')
  int? packageId;

  Map<String, dynamic>? destination;

  @JsonKey(name: 'shipping_rates', fromJson: toList)
  List<ShipItem>? shipItem;

  String? name;

  ShippingRate({this.packageId, this.name, this.destination});
  factory ShippingRate.fromJson(Map<String, dynamic> json) =>
      _$ShippingRateFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingRateToJson(this);

  static List<ShipItem> toList(List<dynamic>? data) {
    List<ShipItem> shipItems = <ShipItem>[];

    if (data == null) return shipItems;

    shipItems = data.map((d) => ShipItem.fromJson(d)).toList().cast<ShipItem>();

    return shipItems;
  }
}

@JsonSerializable()
class CartItem {
  String? key;

  int? product_id;

  String? quantity;

  String? product_name;

  String? product_price;

  String? product_image;

  CartItem({
    this.key,
    this.product_id,
    this.quantity,
    this.product_name,
    this.product_price,
    this.product_image,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}

@JsonSerializable()
class ShipItem {
  @JsonKey(name: 'rate_id')
  String? rateId;
  String? name;
  String? description;
  @JsonKey(name: 'delivery_time')
  String? deliveryTime;
  String? price;
  String? taxes;
  @JsonKey(name: 'method_id')
  String? methodId;
  bool? selected;
  @JsonKey(name: 'currency_code')
  String? currencyCode;
  @JsonKey(name: 'currency_symbol')
  String? currencySymbol;
  ShipItem(
      {this.rateId,
      this.name,
      this.deliveryTime,
      this.currencyCode,
      this.currencySymbol,
      this.description,
      this.methodId,
      this.price,
      this.taxes,
      this.selected});
  factory ShipItem.fromJson(Map<String, dynamic> json) =>
      _$ShipItemFromJson(json);

  Map<String, dynamic> toJson() => _$ShipItemToJson(this);
}

@JsonSerializable()
class QuantityLimit {
  @JsonKey(defaultValue: 1)
  int minimum;

  @JsonKey()
  int? maximum;

  @JsonKey(
    name: "multiple_of",
    defaultValue: 1,
  )
  int step;

  QuantityLimit({
    required this.minimum,
    this.maximum,
    required this.step,
  });
  factory QuantityLimit.fromJson(Map<String, dynamic> json) =>
      _$QuantityLimitFromJson(json);

  Map<String, dynamic> toJson() => _$QuantityLimitToJson(this);
}
