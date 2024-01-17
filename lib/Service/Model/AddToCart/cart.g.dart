// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartData _$CartDataFromJson(Map<String, dynamic> json) => CartData(
      cartCount: json['cart_count'] as String?,
      message: json['message'] as String?,
      data: json['data'] as String?,
      time: json['time'] as String?,
    );
// ..cart_items = CartData.toList(json['cart_items'] as List?);

Map<String, dynamic> _$CartDataToJson(CartData instance) => <String, dynamic>{
      'cart_count': instance.cartCount,
      'message': instance.message,
      'data': instance.data,
      'time': instance.time,
      // 'cart_items': instance.cart_items,
    };

ShippingRate _$ShippingRateFromJson(Map<String, dynamic> json) => ShippingRate(
      packageId: json['package_id'] as int?,
      name: json['name'] as String?,
      destination: json['destination'] as Map<String, dynamic>?,
    )..shipItem = ShippingRate.toList(json['shipping_rates'] as List?);

Map<String, dynamic> _$ShippingRateToJson(ShippingRate instance) =>
    <String, dynamic>{
      'package_id': instance.packageId,
      'destination': instance.destination,
      'shipping_rates': instance.shipItem,
      'name': instance.name,
    };

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      key: json['key'] as String?,
      product_id: json['product_id'] as int?,
      quantity: json['quantity'] as String?,
      product_name: json['product_name'] as String?,
      product_price: json['product_price'] as String?,
      product_image: json['product_image'] as String?,
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'key': instance.key,
      'product_id': instance.product_id,
      'quantity': instance.quantity,
      'product_name': instance.product_name,
      'product_price': instance.product_price,
      'product_image': instance.product_image,
    };

ShipItem _$ShipItemFromJson(Map<String, dynamic> json) => ShipItem(
      rateId: json['rate_id'] as String?,
      name: json['name'] as String?,
      deliveryTime: json['delivery_time'] as String?,
      currencyCode: json['currency_code'] as String?,
      currencySymbol: json['currency_symbol'] as String?,
      description: json['description'] as String?,
      methodId: json['method_id'] as String?,
      price: json['price'] as String?,
      taxes: json['taxes'] as String?,
      selected: json['selected'] as bool?,
    );

Map<String, dynamic> _$ShipItemToJson(ShipItem instance) => <String, dynamic>{
      'rate_id': instance.rateId,
      'name': instance.name,
      'description': instance.description,
      'delivery_time': instance.deliveryTime,
      'price': instance.price,
      'taxes': instance.taxes,
      'method_id': instance.methodId,
      'selected': instance.selected,
      'currency_code': instance.currencyCode,
      'currency_symbol': instance.currencySymbol,
    };

QuantityLimit _$QuantityLimitFromJson(Map<String, dynamic> json) =>
    QuantityLimit(
      minimum: json['minimum'] as int? ?? 1,
      maximum: json['maximum'] as int?,
      step: json['multiple_of'] as int? ?? 1,
    );

Map<String, dynamic> _$QuantityLimitToJson(QuantityLimit instance) =>
    <String, dynamic>{
      'minimum': instance.minimum,
      'maximum': instance.maximum,
      'multiple_of': instance.step,
    };
