import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tracking_app/core/network/remote/firebase_manager/firebase_order_model.dart';
class FirebaseServices {

  FirebaseServices(this._firestore);

  final FirebaseFirestore _firestore;

  Stream<List<OrderModel>> watchOrdersByDriver(String driverId) {
    return _firestore.collection('orders')
        .where('driverId', isEqualTo: driverId)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => OrderModel.fromFirestore(doc)).toList());
  }

  Future<void> updateOrderStatus(String orderId, String status) {
    return _firestore.collection('orders').doc(orderId).update({'status': status});
  }

  // Future<void> acceptOrder(String orderId, String driverId) {
  //   return _firestore.collection('orders').doc(orderId).update({
  //     'driverId': driverId,
  //     'status': 'accepted',
  //   });
  // }
}
