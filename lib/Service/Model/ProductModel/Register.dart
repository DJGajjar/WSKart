import 'package:wskart/Constants/utility_mixin.dart' show get;
import 'package:json_annotation/json_annotation.dart';

part 'Register.g.dart';

@JsonSerializable()
class RegisterUser {
  int? otp_sent;

  String? otp;

  String? phone;

  String? phone_no;

  String? email;

  String? phone_code;

  int? error;

  int? user_id;

  bool? status;

  String? otp_txt;

  String? notice;

  RegisterUser({
    this.otp_sent,
    this.otp,
    this.phone,
    this.phone_no,
    this.email,
    this.phone_code,
    this.error,
    this.user_id,
    this.status,
    this.otp_txt,
    this.notice,
  });

  factory RegisterUser.fromJson(Map<String, dynamic> json) =>
      _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}
