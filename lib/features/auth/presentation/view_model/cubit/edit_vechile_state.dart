import 'package:equatable/equatable.dart';
import 'package:tracking_app/features/auth/domain/entities/vehicles_entitiy.dart';

sealed class VehicleState extends Equatable {
  const VehicleState();

  @override
  List<Object?> get props => [];
}

class VehicleInitial extends VehicleState {
  const VehicleInitial();
}

class VehicleLoading extends VehicleState {
  const VehicleLoading();
}
class VehiclesSuccessState extends VehicleState {
  const VehiclesSuccessState(
      this.vehiclesModelEntity,
      );
  final VehiclesModelEntity vehiclesModelEntity;

  @override
  List<Object> get props => [vehiclesModelEntity];
}

class EditVehicleSuccess extends VehicleState {
  const EditVehicleSuccess(this.message);
  final String message;

  @override
  List<Object> get props => [message];
}

class VehicleError extends VehicleState {
  const VehicleError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
