// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordDTO _$ChangePasswordDTOFromJson(Map<String, dynamic> json) =>
    ChangePasswordDTO(
      message: json['message'] as String?,
      error: json['error'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$ChangePasswordDTOToJson(ChangePasswordDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'error': instance.error,
    };
