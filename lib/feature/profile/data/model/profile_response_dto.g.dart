// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponseDTO _$ProfileResponseDTOFromJson(Map<String, dynamic> json) =>
    ProfileResponseDTO(
      message: json['message'] as String?,
      driver: json['driver'] == null
          ? null
          : DriverDTO.fromJson(json['driver'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseDTOToJson(ProfileResponseDTO instance) =>
    <String, dynamic>{
      'message': instance.message,
      'driver': instance.driver,
    };

DriverDTO _$DriverDTOFromJson(Map<String, dynamic> json) => DriverDTO(
      id: json['_id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      gender: json['gender'] as String?,
      phone: json['phone'] as String?,
      photo: json['photo'] as String?,
      role: json['role'] as String?,
      country: json['country'] as String?,
      vehicleType: json['vehicleType'] as String?,
      vehicleNumber: json['vehicleNumber'] as String?,
      vehicleLicense: json['vehicleLicense'] as String?,
      nid: json['NID'] as String?,
      nidImg: json['NIDImg'] as String?,
    );

Map<String, dynamic> _$DriverDTOToJson(DriverDTO instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'gender': instance.gender,
      'phone': instance.phone,
      'photo': instance.photo,
      'role': instance.role,
      'country': instance.country,
      'vehicleType': instance.vehicleType,
      'vehicleNumber': instance.vehicleNumber,
      'vehicleLicense': instance.vehicleLicense,
      '_id': instance.id,
      'NID': instance.nid,
      'NIDImg': instance.nidImg,
    };
