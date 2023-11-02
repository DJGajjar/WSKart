// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginOtp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginOtp _$BrandFromJson(Map<String, dynamic> json) => LoginOtp(
      otp_sent: json['otp_sent'] as int?,
      otp: json['otp'] as String?,
      phone: json['phone'] as String?,
      phone_no: json['phone_no'] as String?,
      phone_code: json['phone_code'] as String?,
      error: json['error'] as int?,
      otp_txt: json['otp_txt'] as String?,
    );

Map<String, dynamic> _$BrandToJson(LoginOtp instance) => <String, dynamic>{
      'otp_sent': instance.otp_sent,
      'otp': instance.otp,
      'phone': instance.phone,
      'phone_no': instance.phone_no,
      'phone_code': instance.phone_code,
      'error': instance.error,
      'otp_txt': instance.otp_txt,
    };
