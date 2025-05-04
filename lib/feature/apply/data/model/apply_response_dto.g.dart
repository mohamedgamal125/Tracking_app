// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyResponseDTO _$ApplyResponseDTOFromJson(Map<String, dynamic> json) =>
    ApplyResponseDTO(
      message: json['message'] as String?,
      driver: json['driver'] == null
          ? null
          : Driver.fromJson(json['driver'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$ApplyResponseDTOToJson(ApplyResponseDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'driver': instance.driver,
      'token': instance.token,
    };

Driver _$DriverFromJson(Map<String, dynamic> json) => Driver(
      country: json['_id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      vehicleType: json['vehicleType'] as String?,
      vehicleNumber: json['vehicleNumber'] as String?,
      vehicleLicense: json['vehicleLicense'] as String?,
      NID: json['NID'] as String?,
      NIDImg: json['NIDImg'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      photo: json['photo'] as String?,
      role: json['role'] as String?,
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$DriverToJson(Driver instance) => <String, dynamic>{
      '_id': instance.country,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'vehicleType': instance.vehicleType,
      'vehicleNumber': instance.vehicleNumber,
      'vehicleLicense': instance.vehicleLicense,
      'NID': instance.NID,
      'NIDImg': instance.NIDImg,
      'email': instance.email,
      'gender': instance.gender,
      'phone': instance.phone,
      'photo': instance.photo,
      'role': instance.role,
      'id': instance.id,
      'createdAt': instance.createdAt,
    };
