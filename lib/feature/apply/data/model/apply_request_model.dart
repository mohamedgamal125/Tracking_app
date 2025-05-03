import 'dart:io';

import 'package:dio/dio.dart';

class ApplyRequestModel {
  final String? country;
  final String? firstName;
  final String? lastName;
  final String? vehicleType;
  final String? vehicleNumber;
  final File? vehicleLicense;
  final String? NID;
  final File? NIDImg;
  final String? email;
  final String? password;
  final String? rePassword;
  final String? gender;
  final String? phone;

  ApplyRequestModel({
    this.country,
    this.firstName,
    this.lastName,
    this.vehicleType,
    this.vehicleNumber,
    this.vehicleLicense,
    this.NID,
    this.NIDImg,
    this.email,
    this.password,
    this.rePassword,
    this.gender,
    this.phone,
  });

  Map<String, dynamic> toJson() {
    return {
      'country': country,
      'firstName': firstName,
      'lastName': lastName,
      'vehicleType': vehicleType,
      'vehicleNumber': vehicleNumber,
      'vehicleLicense': vehicleLicense,
      'NID': NID,
      'NIDImg': NIDImg,
      'email': email,
      'password': password,
      'rePassword': rePassword,
      'gender': gender,
      'phone': phone,
    };
  }
}
