import 'package:json_annotation/json_annotation.dart';

part 'get_vehicles_response_dto.g.dart';

@JsonSerializable()
class GetVehiclesResponseDTO {
  final String message;
  final Metadata metadata;
  final List<Vehicle> vehicles;

  GetVehiclesResponseDTO({
    required this.message,
    required this.metadata,
    required this.vehicles,
  });

  factory GetVehiclesResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$GetVehiclesResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetVehiclesResponseDTOToJson(this);
}

@JsonSerializable()
class Metadata {
  final int currentPage;
  final int totalPages;
  final int limit;
  final int totalItems;

  Metadata({
    required this.currentPage,
    required this.totalPages,
    required this.limit,
    required this.totalItems,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class Vehicle {
  @JsonKey(name: '_id')
  final String id;
  final String type;
  final String image;
  final String createdAt;
  final String updatedAt;
  @JsonKey(name: '__v')
  final int version;

  Vehicle({
    required this.id,
    required this.type,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);
}