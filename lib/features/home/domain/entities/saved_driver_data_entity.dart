import 'package:tracking_app/features/home/presentation/widgets/OrderProgressIndicator.dart';

class SavedDriverDataEntity {

  SavedDriverDataEntity({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.vehicleImage,
    required this.orderNumber,
    required this.orderStatus
  });
  final String firstName;
  final String lastName;
  final String phone;
  final String vehicleImage;
  final String orderNumber;
  final OrderStatus orderStatus;

}
