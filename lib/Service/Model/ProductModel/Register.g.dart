// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Register.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterUser _$BrandFromJson(Map<String, dynamic> json) => RegisterUser(
      otp_sent: json['otp_sent'] as int?,
      otp: json['otp'] as String?,
      phone: json['phone'] as String?,
      phone_no: json['phone_no'] as String?,
      email: json['email'] as String?,
      phone_code: json['phone_code'] as String?,
      error: json['error'] as int?,
      user_id: json['user_id'] as int?,
      status: json['status'] as bool?,
      otp_txt: json['otp_txt'] as String?,
      notice: json['notice'] as String?,
    );

Map<String, dynamic> _$BrandToJson(RegisterUser instance) => <String, dynamic>{
      'otp_sent': instance.otp_sent,
      'otp': instance.otp,
      'phone': instance.phone,
      'phone_no': instance.phone_no,
      'email': instance.email,
      'phone_code': instance.phone_code,
      'error': instance.error,
      'user_id': instance.user_id,
      'status': instance.status,
      'otp_txt': instance.otp_txt,
      'notice': instance.notice,
    };
