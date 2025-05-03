class GetVehiclesEntity {
  final String? message;
  final List<VehicleEntity>? vehicles;

  GetVehiclesEntity({
    this.message,
    this.vehicles,
  });
}

class VehicleEntity {
  final String? id;
  final String? type;
  final String? image;
  final String? createdAt;
  final String? updatedAt;
  final int? version;

  VehicleEntity({
    this.id,
    this.type,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.version,
  });
}
