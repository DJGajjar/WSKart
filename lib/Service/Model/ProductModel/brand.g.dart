// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
      id: json['id'] as int?,
      name: json['name'] as String?,
      count: json['count'] as int?,
      //image: Brand._imageFromJson(json['image']),
      description: json['description'] as String?,
      menu_order: json['menu_order'] as int?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'parent': instance.menu_order,
      'description': instance.description,
      'count': instance.count,
      //'image': instance.image,
    };
