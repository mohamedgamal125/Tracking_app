import 'package:json_annotation/json_annotation.dart';

part 'apply_response_dto.g.dart';

@JsonSerializable()
class ApplyResponseDTO {
  final String message;
  final Driver driver;
  final String token;

  ApplyResponseDTO({
    required this.message,
    required this.driver,
    required this.token,
  });

  factory ApplyResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ApplyResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ApplyResponseDTOToJson(this);
}

@JsonSerializable()
class Driver {
  @JsonKey(name: '_id')
  final String country;
  final String firstName;
  final String lastName;
  final String vehicleType;
  final String vehicleNumber;
  final String vehicleLicense;
  final String NID;
  final String NIDImg;
  final String email;
  final String gender;
  final String phone;
  final String photo;
  final String role;
  final String id;
  final String createdAt;

  Driver({
    required this.country,
    required this.firstName,
    required this.lastName,
    required this.vehicleType,
    required this.vehicleNumber,
    required this.vehicleLicense,
    required this.NID,
    required this.NIDImg,
    required this.email,
    required this.gender,
    required this.phone,
    required this.photo,
    required this.role,
    required this.id,
    required this.createdAt,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);
}
