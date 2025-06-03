// import 'dart:io';
// import 'package:json_annotation/json_annotation.dart';
//
// part 'edit_vehicle_request.g.dart';
//
// @JsonSerializable()
// class EditeVehicleRequest {
//   final String name;
//
//   @JsonKey(ignore: true)
//   final File image;
//
//   EditeVehicleRequest({
//     required this.name,
//     required this.image,
//   });
//
//   factory EditeVehicleRequest.fromJson(Map<String, dynamic> json) =>
//       _$EditeVehicleRequestFromJson(json);
//
//   Map<String, dynamic> toJson() => _$EditeVehicleRequestToJson(this);
// }
import 'dart:io';
import 'package:json_annotation/json_annotation.dart';

part 'edit_vehicle_request.g.dart';

@JsonSerializable()
class EditeVehicleRequest {
  final String name;

  @JsonKey(ignore: true)
  final File? image; // Make it nullable

  EditeVehicleRequest({
    required this.name,
    this.image, // Make it optional
  });

  factory EditeVehicleRequest.fromJson(Map<String, dynamic> json) =>
      _$EditeVehicleRequestFromJson(json);

  Map<String, dynamic> toJson() => _$EditeVehicleRequestToJson(this);
}
