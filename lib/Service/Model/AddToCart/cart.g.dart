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
      userData: UserData.fromJson(json['user_data']),
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

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      full_name: json['full_name'] as String?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      shippingData: ShippingInfo.fromJson(json['shipping']),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'full_name': instance.full_name,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
    };

ShippingInfo _$ShippingInfoFromJson(Map<String, dynamic> json) => ShippingInfo(
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      company: json['company'] as String?,
      address_1: json['address_1'] as String?,
      address_2: json['address_2'] as String?,
      city: json['city'] as String?,
      postcode: json['postcode'] as String?,
      country: json['country'] as String?,
      state: json['state'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ShippingInfoToJson(ShippingInfo instance) =>
    <String, dynamic>{
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'company': instance.company,
      'address_1': instance.address_1,
      'address_2': instance.address_2,
      'city': instance.city,
      'postcode': instance.postcode,
      'country': instance.country,
      'state': instance.state,
      'phone': instance.phone,
    };
