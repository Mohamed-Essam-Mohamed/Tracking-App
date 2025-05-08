import '../../domain/entities/vehicles_entitiy.dart';

/// message : "success"
/// metadata : {"currentPage":1,"totalPages":1,"limit":40,"totalItems":7}
/// vehicles : [{"_id":"676b63c99f3884b3405c149b","type":"Motor Cycle","image":"https://flower.elevateegy.com/uploads/3be99805-65e0-4f05-9e98-4ccfb0b2ca5f-Chopper.png","createdAt":"2024-12-25T01:45:45.397Z","updatedAt":"2024-12-25T01:45:45.397Z","__v":0},{"_id":"676b63ef9f3884b3405c14a5","type":"Compact","image":"https://flower.elevateegy.com/uploads/663cb0ed-cc46-4b7c-99f4-d425e9f78437-Compact.png","createdAt":"2024-12-25T01:46:23.416Z","updatedAt":"2024-12-25T01:46:23.416Z","__v":0},{"_id":"676b63fc9f3884b3405c14ad","type":"Sedan","image":"https://flower.elevateegy.com/uploads/39bcda45-6ab6-45cc-9eda-a72c30947bd9-Sedan.png","createdAt":"2024-12-25T01:46:36.564Z","updatedAt":"2024-12-25T01:46:36.564Z","__v":0},{"_id":"676b640e9f3884b3405c14b5","type":"Semi","image":"https://flower.elevateegy.com/uploads/81814934-f55c-4ebd-8d57-dc8abd60623a-Semi.png","createdAt":"2024-12-25T01:46:54.868Z","updatedAt":"2024-12-25T01:46:54.868Z","__v":0},{"_id":"676b641c9f3884b3405c14bd","type":"Sports","image":"https://flower.elevateegy.com/uploads/eb29f197-b672-431b-8037-0bb1571df928-Sports.png","createdAt":"2024-12-25T01:47:08.129Z","updatedAt":"2024-12-25T01:47:08.129Z","__v":0},{"_id":"676b64279f3884b3405c14c5","type":"SUV","image":"https://flower.elevateegy.com/uploads/209b736d-8570-4f18-9ba5-2708859dda07-SUV.png","createdAt":"2024-12-25T01:47:19.749Z","updatedAt":"2024-12-25T01:47:19.749Z","__v":0},{"_id":"676b64349f3884b3405c14cd","type":"Truck","image":"https://flower.elevateegy.com/uploads/68b0117b-cb13-4d45-a0ef-0a3099581551-Truck.png","createdAt":"2024-12-25T01:47:32.964Z","updatedAt":"2024-12-25T01:47:32.964Z","__v":0}]

class VehiclesModelDto {
  VehiclesModelDto({
    this.message,
    this.vehicles,
  });

  VehiclesModelDto.fromJson(dynamic json) {
    message = json['message'];

    if (json['vehicles'] != null) {
      vehicles = [];
      json['vehicles'].forEach((v) {
        vehicles?.add(Vehicles.fromJson(v));
      });
    }
  }

  String? message;

  List<Vehicles>? vehicles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;

    if (vehicles != null) {
      map['vehicles'] = vehicles?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  VehiclesModelEntity toEntity() =>
      VehiclesModelEntity(message: message, vehicles: vehicles!.map((e) => e.toEntity()).toList());
}

/// _id : "676b63c99f3884b3405c149b"
/// type : "Motor Cycle"
/// image : "https://flower.elevateegy.com/uploads/3be99805-65e0-4f05-9e98-4ccfb0b2ca5f-Chopper.png"
/// createdAt : "2024-12-25T01:45:45.397Z"
/// updatedAt : "2024-12-25T01:45:45.397Z"
/// __v : 0

class Vehicles {
  Vehicles({
    this.id,
    this.type,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  Vehicles.fromJson(dynamic json) {
    id = json['_id'];
    type = json['type'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
  }

  String? id;
  String? type;
  String? image;
  String? createdAt;
  String? updatedAt;
  num? v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['type'] = type;
    map['image'] = image;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    map['__v'] = v;
    return map;
  }

  VehiclesEntity toEntity() => VehiclesEntity(
      id: id,
      type: type,
      image: image,
      createdAt: createdAt,
      updatedAt: updatedAt,
      v: v);
}

/// currentPage : 1
/// totalPages : 1
/// limit : 40
/// totalItems : 7
