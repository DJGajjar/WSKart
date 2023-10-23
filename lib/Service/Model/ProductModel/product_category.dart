import 'package:json_annotation/json_annotation.dart';
import 'package:wskart/Constants/UnescapeMixin.dart' show unescape;
import 'package:wskart/Constants/convert_data.dart';
part 'product_category.g.dart';

@JsonSerializable(createToJson: false)
class ProductCategory {
  int? id;

  @JsonKey(fromJson: unescape)
  String? name;

  String? slug;

  int? parent;

  // @JsonKey(fromJson: toList)
  // List<ProductCategory?>? categories;

  String? description;

  String? display;

  @JsonKey(defaultValue: {})
  Map<String, dynamic>? image;

  @JsonKey(name: 'menu_order')
  int? menuOrder;

  int? count;

  Map<String, dynamic>? rawData;

  ProductCategory({
    this.id,
    this.name,
    this.slug,
    this.parent,
    // this.categories,
    this.description,
    this.count,
    this.image,
  });

  static String _fromJson(dynamic value) {
    if (value == '') return '0';
    if (value is String) return value;
    if (value is int || value is double) return value.toString();
    return '0';
  }

  static List<Map<String, dynamic>> _fromJsonImage(dynamic data) {
    if (data is! List) return [];
    List<Map<String, dynamic>> value = [];
    for (int i = 0; i < data.length; i++) {
      if (data[i] is Map) {
        value.add(data[i]);
      }
    }
    return value;
  }

  static Map _fromAcfFields(dynamic data) {
    if (data is! Map) return {};

    return data;
  }

  static List<int>? _toListInt(dynamic data) {
    if (data is List<dynamic>?) {
      return data?.map((e) => e as int).toList();
    }
    return null;
  }

  static int? _toInt(dynamic json) {
    return ConvertData.stringToInt(json);
  }

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryFromJson({
        ...json,
        "rawData": json,
      });

  // factory ProductCategory.fromJson(Map<String, dynamic> json) =>
  //     _$ProductCategoryFromJson(json);
  //
  // Map<String, dynamic> toJson() => _$ProductCategoryToJson(this);
  //
  // static List<ProductCategory> toList(List<dynamic>? data) {
  //   List<ProductCategory> newCategories = <ProductCategory>[];
  //
  //   if (data == null) return newCategories;
  //
  //   newCategories = data
  //       .map((d) => ProductCategory.fromJson(d))
  //       .toList()
  //       .cast<ProductCategory>();
  //
  //   return newCategories;
  // }
}
