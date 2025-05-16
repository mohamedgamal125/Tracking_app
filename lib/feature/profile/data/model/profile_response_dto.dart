import 'package:json_annotation/json_annotation.dart';
import '../../domain/entity/profile_response_entity.dart';

part 'profile_response_dto.g.dart';

@JsonSerializable()
class ProfileResponseDTO extends ProfileResponseEntity {
  @JsonKey(name: 'driver')
  @override
  final DriverDTO? driver;

  ProfileResponseDTO({super.message, this.driver});

  factory ProfileResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileResponseDTOToJson(this);

  ProfileResponseEntity toEntity() {
    return ProfileResponseEntity(
      message: message,
      driver: driver?.toEntity(),
    );
  }
}

@JsonSerializable()
class DriverDTO extends DriverEntity {
  @JsonKey(name: '_id')
  @override
  final String? id;

  @JsonKey(name: 'NID')
  @override
  final String? nid;

  @JsonKey(name: 'NIDImg')
  @override
  final String? nidImg;

  DriverDTO({
    this.id,
    super.firstName,
    super.lastName,
    super.email,
    super.gender,
    super.phone,
    super.photo,
    super.role,
    super.country,
    super.vehicleType,
    super.vehicleNumber,
    super.vehicleLicense,
    this.nid,
    this.nidImg,
  });

  factory DriverDTO.fromJson(Map<String, dynamic> json) =>
      _$DriverDTOFromJson(json);

  Map<String, dynamic> toJson() => _$DriverDTOToJson(this);

  DriverEntity toEntity() {
    return DriverEntity(
      id: id,
      firstName: firstName,
      lastName: lastName,
      email: email,
      gender: gender,
      phone: phone,
      photo: photo,
      role: role,
      country: country,
      vehicleType: vehicleType,
      vehicleNumber: vehicleNumber,
      vehicleLicense: vehicleLicense,
      nid: nid,
      nidImg: nidImg,
    );
  }
}
