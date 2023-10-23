// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BestProduct.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestProduct _$BestProductFromJson(Map<String, dynamic> json) => BestProduct(
      id: json['id'] as int?,
      name: unescape(json['name']),
      slug: json['slug'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      sku: json['sku'] as String?,
      description: json['description'] as String?,
      shortDescription: json['short_description'] as String?,
      images: BestProduct._fromJsonImage(json['images']),
      price: BestProduct._fromJson(json['price']),
      regularPrice: BestProduct._fromJson(json['regular_price']),
      salePrice: BestProduct._fromJson(json['sale_price']),
      onSale: json['on_sale'] as bool?,
      date: json['date_created'] as String?,
      averageRating: json['average_rating'] as String?,
      ratingCount: json['rating_count'] as int?,
      formatPrice: json['format_price'] == null
          ? null
          : ProductPriceFormat.fromJson(
              json['format_price'] as Map<String, dynamic>),
      catalogVisibility: json['catalog_visibility'] as String?,
      stockStatus: json['stock_status'] as String?,
      manageStock: json['manage_stock'] as bool? ?? false,
      stockQuantity: json['stock_quantity'] as int? ?? 0,
      totalSales: json['total_sales'] == null
          ? 0
          : BestProduct._toInt(json['total_sales']),
      relatedIds: BestProduct._toListInt(json['related_ids']),
      upsellIds: BestProduct._toListInt(json['upsell_ids']),
      groupedIds: (json['grouped_products'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ProductCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      externalUrl: json['external_url'] as String?,
      buttonText: json['button_text'] as String?,
      purchasable: json['purchasable'] as bool?,
      store: json['store'] as Map<String, dynamic>?,
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      defaultAttributes: (json['default_attributes'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      parentId: json['parent_id'] as int? ?? 0,
      metaData: (json['meta_data'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      acf: json['acf'] as Map<String, dynamic>?,
      brands: (json['brands'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : ProductBrand.fromJson(e as Map<String, dynamic>))
          .toList(),
      priceHtml: json['price_html'] as String?,
      afcFields: BestProduct._fromAcfFields(json['afc_fields']),
      permalink: json['permalink'] as String?,
      rawData: json['rawData'] as Map<String, dynamic>?,
    );
