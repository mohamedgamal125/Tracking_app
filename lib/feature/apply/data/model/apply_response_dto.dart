import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/apply/domain/entites/apply_response_entity.dart';

part 'apply_response_dto.g.dart';

@JsonSerializable()
class ApplyResponseDTO {
  final String? message;
  final Driver? driver;
  final String? token;

  ApplyResponseDTO({
    this.message,
    this.driver,
    this.token,
  });

  factory ApplyResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ApplyResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ApplyResponseDTOToJson(this);

  ApplyResponseEntity toEntity() => ApplyResponseEntity(
        message: message,
        driver: driver?.toEntity(),
        token: token,
      );
}

@JsonSerializable()
class Driver {
  @JsonKey(name: '_id')
  final String? country;
  final String? firstName;
  final String? lastName;
  final String? vehicleType;
  final String? vehicleNumber;
  final String? vehicleLicense;
  final String? NID;
  final String? NIDImg;
  final String? email;
  final String? gender;
  final String? phone;
  final String? photo;
  final String? role;
  final String? id;
  final String? createdAt;

  Driver({
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.NID,
    this.NIDImg,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.id,
    this.createdAt,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => _$DriverFromJson(json);

  Map<String, dynamic> toJson() => _$DriverToJson(this);

  DriverEntity toEntity() => DriverEntity(
        country: country,
        firstName: firstName,
        lastName: lastName,
        vehicleType: vehicleType,
        vehicleNumber: vehicleNumber,
        vehicleLicense: vehicleLicense,
        NID: NID,
        NIDImg: NIDImg,
        email: email,
        gender: gender,
        phone: phone,
        photo: photo,
        role: role,
        id: id,
        createdAt: createdAt,
      );
}
