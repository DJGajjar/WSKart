import 'package:wskart/Constants/utility_mixin.dart' show get;
import 'package:json_annotation/json_annotation.dart';

part 'brand.g.dart';

@JsonSerializable()
class Brand {
  int? id;

  String? name;

  String? slug;

  // @JsonKey(fromJson: _imageFromJson)
  String? image_url;

  Brand({
    this.id,
    this.name,
    this.slug,
    this.image_url,
  });

  // static String? _imageFromJson(dynamic value) => get(value, ['src'], '');

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}
