// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class FirebaseServices {
//
//   FirebaseServices(this._fireStore);
//
//   final FirebaseFirestore _fireStore;
//
//   // Stream<List<OrderModel>> watchOrdersByDriver(String driverId) {
//   //   return _firestore.collection('orders')
//   //       .where('driverId', isEqualTo: driverId)
//   //       .snapshots()
//   //       .map((snapshot) =>
//   //       snapshot.docs.map((doc) => OrderModel.fromFirestore(doc)).toList());
//   // }
//
//   Future<void> updateOrderStatus(
//       String orderId,
//       OrderStatus status,
//       GeoPoint location,
//       ) async {
//     await _firestore.collection('orders').doc(orderId).update({
//       'status': orderStatusToString(status),
//       'updatedAt': FieldValue.serverTimestamp(),
//       'driverLocation': location,
//     });
//   }
//
//   // Future<void> updateOrderStatus(String orderId, String status) {
//   //   return _firestore.collection('orders').doc(orderId).update({'status': status});
//   // }
//
//   // Future<void> acceptOrder(String orderId, String driverId) {
//   //   return _firestore.collection('orders').doc(orderId).update({
//   //     'driverId': driverId,
//   //     'status': 'accepted',
//   //   });
//   // }
// }
