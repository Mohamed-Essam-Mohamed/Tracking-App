class VehiclesModelEntity {
  VehiclesModelEntity({this.message, this.vehicles});
  String? message;

  List<VehiclesEntity>? vehicles;
}

class VehiclesEntity {
  VehiclesEntity(
      {this.id, this.type, this.image, this.createdAt, this.updatedAt, this.v});
  String? id;
  String? type;
  String? image;
  String? createdAt;
  String? updatedAt;
  num? v;
}
