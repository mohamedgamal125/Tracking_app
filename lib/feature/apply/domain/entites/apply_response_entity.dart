class ApplyResponseEntity {
  final String? message;
  final DriverEntity? driver;
  final String? token;

  ApplyResponseEntity({
    this.message,
    this.driver,
    this.token,
  });
}

class DriverEntity {
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

  DriverEntity({
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
}
