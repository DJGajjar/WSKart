import 'package:wskart/Constants/utility_mixin.dart' show get;
import 'package:json_annotation/json_annotation.dart';

part 'AddRemoveWishlist.g.dart';

@JsonSerializable()
class AddRemoveWishlist {
  String? status;

  AddRemoveWishlist({
    this.status,
  });

  factory AddRemoveWishlist.fromJson(Map<String, dynamic> json) =>
      _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}
