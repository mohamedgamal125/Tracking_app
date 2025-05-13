import 'package:json_annotation/json_annotation.dart';
import 'package:tracking_app/feature/apply/domain/entites/get_vehicles_entity.dart';

part 'get_vehicles_response_dto.g.dart';

@JsonSerializable()
class GetVehiclesResponseDTO {
  final String? message;
  final Metadata? metadata;
  final List<Vehicle>? vehicles;

  GetVehiclesResponseDTO({
    this.message,
    this.metadata,
    this.vehicles,
  });

  factory GetVehiclesResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$GetVehiclesResponseDTOFromJson(json);

  Map<String, dynamic> toJson() => _$GetVehiclesResponseDTOToJson(this);

  GetVehiclesEntity toEntity() => GetVehiclesEntity(
        message: message,
        vehicles: vehicles?.map((e) => e.toEntity()).toList(),
      );
}

@JsonSerializable()
class Metadata {
  final int? currentPage;
  final int? totalPages;
  final int? limit;
  final int? totalItems;

  Metadata({
    this.currentPage,
    this.totalPages,
    this.limit,
    this.totalItems,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);

  Map<String, dynamic> toJson() => _$MetadataToJson(this);
}

@JsonSerializable()
class Vehicle {
  @JsonKey(name: '_id')
  final String? id;
  final String? type;
  final String? image;
  final String? createdAt;
  final String? updatedAt;
  @JsonKey(name: '__v')
  final int? version;

  Vehicle({
    this.id,
    this.type,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.version,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleToJson(this);

  VehicleEntity toEntity() => VehicleEntity(
        id: id,
        type: type,
        image: image,
        createdAt: createdAt,
        updatedAt: updatedAt,
        version: version,
      );
}
