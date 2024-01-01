import 'package:json_annotation/json_annotation.dart';
import 'package:wskart/Constants/UnescapeMixin.dart' show unescape;
import 'package:wskart/Constants/convert_data.dart';
part 'Wishlist.g.dart';

@JsonSerializable(createToJson: false)
class Wishlist {
  String? ID;

  @JsonKey(fromJson: unescape)
  // String? name;

  String? post_author;

  String? post_date;

  String? post_date_gmt;

  String? post_content;

  String? post_title;

  String? post_excerpt;

  String? post_status;

  String? comment_status;

  String? ping_status;

  String? post_password;

  String? post_name;

  String? to_ping;

  String? pinged;

  String? post_modified;

  String? post_modified_gmt;

  String? post_content_filtered;

  String? post_parent;

  String? guid;

  String? menu_order;

  String? post_type;

  String? post_mime_type;

  String? comment_count;

  Map<String, dynamic>? rawData;

  Wishlist({
    this.ID,
    this.post_author,
    this.post_date,
    this.post_date_gmt,
    this.post_content,
    this.post_title,
    this.post_excerpt,
    this.post_status,
    this.comment_status,
    this.ping_status,
    this.post_password,
    this.post_name,
    this.to_ping,
    this.pinged,
    this.post_modified,
    this.post_modified_gmt,
    this.post_content_filtered,
    this.post_parent,
    this.guid,
    this.menu_order,
    this.post_type,
    this.post_mime_type,
    this.comment_count,
    this.rawData,
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

  factory Wishlist.fromJson(Map<String, dynamic> json) =>
      _$WishlistProductFromJson({
        ...json,
        "rawData": json,
      });

  factory Wishlist.fromVariation(Map<String, dynamic> json) =>
      _wishlistProductFromVariation(json);
}

Wishlist _wishlistProductFromVariation(dynamic json) {
  Map<String, dynamic> product = Map<String, dynamic>.of(json);
  product.update('attributes', (value) => null, ifAbsent: () => null);
  return Wishlist.fromJson(product);
}
