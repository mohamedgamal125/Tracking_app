// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponseDTO _$SignInResponseDTOFromJson(Map<String, dynamic> json) =>
    SignInResponseDTO(
      message: json['message'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$SignInResponseDTOToJson(SignInResponseDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
    };
