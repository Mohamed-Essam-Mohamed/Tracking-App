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

class VehicleSuccess extends VehicleState {
  const VehicleSuccess(this.vehiclesModelEntity);
  final VehiclesModelEntity vehiclesModelEntity;

  @override
  List<Object> get props => [vehiclesModelEntity];
}

class VehicleError extends VehicleState {
  const VehicleError(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
