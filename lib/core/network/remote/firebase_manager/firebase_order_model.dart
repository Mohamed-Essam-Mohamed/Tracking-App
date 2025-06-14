import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tracking_app/core/network/remote/firebase_manager/firebase_order_entity.dart';

class OrderModel extends OrderEntity {

  factory OrderModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> doc,
      ) {
    final data = doc.data()!;
    return OrderModel(
      id: doc.id,
      status: data['status'] as String,
      driverId: data['driverId'] as String,
    );
  }
  OrderModel({
    required super.id,
    required super.status,
    required super.driverId,
  });

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'driverId': driverId,
    };
  }

  // factory OrderModel.fromJson(Map<String, dynamic> json) {
  //   return OrderModel(
  //     id: json['id'] as String,
  //     status: json['status'] as String,
  //     driverId: json['driverId'] as String,
  //   );
  // }
}
