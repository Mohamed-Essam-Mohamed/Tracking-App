import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/features/home/domain/entities/saved_driver_data_entity.dart';
import 'package:tracking_app/features/home/presentation/view_model/order_details/order_details_state.dart';
import 'package:tracking_app/features/home/presentation/widgets/OrderProgressIndicator.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

@injectable
class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(const OrderDetailsStatusChangedInitial());

  OrderStatus currentStatus = OrderStatus.accepted;

  String getButtonText(OrderStatus status) {
    switch (status) {
      case OrderStatus.accepted:
        return LocaleKeys.OrderDetails_ArrivedAtPickupPoint.tr();
      case OrderStatus.preparing:
        return LocaleKeys.OrderDetails_startDeliver.tr();
      case OrderStatus.onTheWay:
        return LocaleKeys.OrderDetails_arrivedToUser.tr();
      case OrderStatus.delivered:
        return LocaleKeys.OrderDetails_deliveredToUser.tr();
      case OrderStatus.completed:
        return LocaleKeys.OrderDetails_completed.tr();
    }
  }

  void advanceOrderStatus(String orderId) async {
    emit(const OrderDetailsStatusChangedInitial());
    print('➡️ currentStatus before: $currentStatus');

    final nextIndex = currentStatus.index + 1;
    if (nextIndex < OrderStatus.values.length) {
      currentStatus = OrderStatus.values[nextIndex];
      emit(OrderDetailsStatusChanged(currentStatus));
      print('➡️ currentStatus after: $currentStatus');

      await updateOrderStatusInFirebase(orderId, currentStatus);

    } else {
      print('🔔 وصلت لآخر حالة: $currentStatus');
    }
  }



  Future<SavedDriverDataEntity> collectDriverData(String? orderNumber) async {
    final pref = await SharedPreferences.getInstance();

    return SavedDriverDataEntity(
        firstName: pref.getString('firstName') ?? '',
        lastName: pref.getString('lastName') ?? '' ,
        phone: pref.getString('phone') ?? '',
        vehicleImage: pref.getString('VehicleImage') ?? '',
    orderNumber: orderNumber ?? '' ,
    orderStatus: currentStatus );

  }
  Future<void> initializeDriverOrder(String? orderNumber) async {
    final data = await collectDriverData(orderNumber);

    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final fireStore = FirebaseFirestore.instance;
    final docRef = fireStore.collection('drivers').doc(user.uid).collection('orders').doc(orderNumber);
    await docRef.set({
      'uid': user.uid,
      'firstName': data.firstName,
      'lastName': data.lastName,
      'phone': data.phone,
      'vehicleImage': data.vehicleImage,
      'orderNumber': data.orderNumber,
      'orderStatus': data.orderStatus.name,
      'driverLatLong' : '31.205753,29.924526',
      'userLatLong' : '25.687243,32.639637',
      'initializedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> updateOrderStatusInFirebase(String orderNumber, OrderStatus status) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;
    final fireStore = FirebaseFirestore.instance;
    final docRef = fireStore.collection('drivers').doc(user.uid).collection('orders').doc(orderNumber);

    await docRef.update({
      'orderStatus': status.name,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }



}



