// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProductList _$CartProductFromJson(Map<String, dynamic> json) =>
    CartProductList(
      cart_count: json['cart_count'] as int?,
      message: json['message'],
      data: json['data'],
      time: json['time'],
      cartTotals: CartTotal.fromJson(json['cart_totals']),
      cartItems: (json['cart_items'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : CartList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

CartList _$CartListFromJson(Map<String, dynamic> json) => CartList(
      key: json['key'] as String?,
      product_id: json['product_id'] as String?,
      product_name: json['product_name'] as String?,
      product_price: json['product_price'] as String?,
      product_image: json['product_image'] as String?,
      quantity: json['quantity'] as String?,
    );

Map<String, dynamic> _$CartToJson(CartList instance) => <String, dynamic>{
      'key': instance.key,
      'product_id': instance.product_id,
      'product_name': instance.product_name,
      'product_price': instance.product_price,
      'product_image': instance.product_image,
      'quantity': instance.quantity,
    };

CartTotal _$CartTotalFromJson(Map<String, dynamic> json) => CartTotal(
      subtotal: json['subtotal'] as String?,
      subtotal_tax: json['subtotal_tax'] as String?,
      shipping_total: json['shipping_total'] as String?,
      shipping_tax: json['shipping_tax'] as String?,
      discount_total: json['discount_total'] as String?,
      discount_tax: json['discount_tax'] as String?,
      cart_contents_total: json['cart_contents_total'] as String?,
      cart_contents_tax: json['cart_contents_tax'] as String?,
      fee_total: json['fee_total'] as String?,
      fee_tax: json['fee_tax'] as String?,
      total: json['total'] as String?,
      total_tax: json['total_tax'] as String?,
    );

Map<String, dynamic> _$CartTotalToJson(CartTotal instance) => <String, dynamic>{
      'subtotal': instance.subtotal,
      'subtotal_tax': instance.subtotal_tax,
      'shipping_total': instance.shipping_total,
      'shipping_tax': instance.shipping_tax,
      'discount_total': instance.discount_total,
      'discount_tax': instance.discount_tax,
      'cart_contents_total': instance.cart_contents_total,
      'cart_contents_tax': instance.cart_contents_tax,
      'fee_total': instance.fee_total,
      'fee_tax': instance.fee_tax,
      'total': instance.total,
      'total_tax': instance.total_tax,
    };
