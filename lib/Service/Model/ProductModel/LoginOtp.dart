import 'package:wskart/Constants/utility_mixin.dart' show get;
import 'package:json_annotation/json_annotation.dart';

part 'LoginOtp.g.dart';

@JsonSerializable()
class LoginOtp {
  int? otp_sent;

  String? otp;

  String? phone;

  String? phone_no;

  String? phone_code;

  int? error;

  String? otp_txt;

  LoginOtp({
    this.otp_sent,
    this.otp,
    this.phone,
    this.phone_no,
    this.phone_code,
    this.error,
    this.otp_txt,
  });

  factory LoginOtp.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}
