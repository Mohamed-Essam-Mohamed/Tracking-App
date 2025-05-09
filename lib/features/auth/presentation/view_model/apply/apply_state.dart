import 'package:equatable/equatable.dart';
import 'package:tracking_app/features/auth/domain/entities/apply_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/vehicles_entitiy.dart';

sealed class ApplyState extends Equatable {
  const ApplyState();
  @override
  List<Object?> get props => [];
}

class ApplyInitial extends ApplyState {
  const ApplyInitial();
}

class ApplyLoadingState extends ApplyState {
  const ApplyLoadingState();
}

class ApplySuccessState extends ApplyState {
  const ApplySuccessState({
    required this.applyEntity,
  });
  final ApplyEntity applyEntity;

  @override
  List<Object> get props => [applyEntity];
}

class ApplyErrorState extends ApplyState {
  const ApplyErrorState(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}

class VehiclesInitial extends ApplyState {}

class VehiclesLoadingState extends ApplyState {}

class VehiclesSuccessState extends ApplyState {
  const VehiclesSuccessState(
    this.vehiclesModelEntity,
  );
  final VehiclesModelEntity vehiclesModelEntity;

  @override
  List<Object> get props => [vehiclesModelEntity];
}

class VehiclesErrorState extends ApplyState {
  const VehiclesErrorState(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}
