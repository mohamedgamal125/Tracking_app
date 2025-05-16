class ProfileResponseEntity {
  ProfileResponseEntity({this.message, this.driver});

  String? message;
  DriverEntity? driver;
}

class DriverEntity {
  DriverEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.gender,
    this.phone,
    this.photo,
    this.role,
    this.country,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.nid,
    this.nidImg,
  });

  String? id;
  String? firstName;
  String? lastName;
  String? email;
  String? gender;
  String? phone;
  String? photo;
  String? role;
  String? country;
  String? vehicleType;
  String? vehicleNumber;
  String? vehicleLicense;
  String? nid;
  String? nidImg;
}
