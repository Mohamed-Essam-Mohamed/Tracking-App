class VehiclesModelEntity {
  String? message;

  List<VehiclesEntity>? vehicles;

  VehiclesModelEntity({this.message, this.vehicles});
}

class VehiclesEntity {
  String? id;
  String? type;
  String? image;
  String? createdAt;
  String? updatedAt;
  num? v;

  VehiclesEntity({ this.id, this.type, this.image, this.createdAt, this.updatedAt, this.v});
}