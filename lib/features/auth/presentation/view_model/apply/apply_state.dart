

import 'package:equatable/equatable.dart';
import 'package:tracking_app/features/auth/domain/entities/apply_entity.dart';

import '../../../../../core/base_state/base_state.dart';
import '../../../domain/entities/vehicles_entitiy.dart';

sealed class ApplyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ApplyInitial extends ApplyState {}

class ApplyLoadingState extends ApplyState {}

class ApplySuccessState extends ApplyState {
ApplyEntity applyEntity;
ApplySuccessState({required this.applyEntity,});

  @override
  List<Object> get props => [applyEntity];
}

class ApplyErrorState extends ApplyState {
  final String error;
  ApplyErrorState(this.error);
  @override
  List<Object> get props => [error];
}
class VehiclesInitial extends ApplyState {}

class VehiclesLoadingState extends ApplyState {}

class VehiclesSuccessState extends ApplyState {
  VehiclesModelEntity  vehiclesModelEntity;
VehiclesSuccessState(this.vehiclesModelEntity,);

  @override
  List<Object> get props => [vehiclesModelEntity];
}

class VehiclesErrorState extends ApplyState {
  final String error;
  VehiclesErrorState(this.error);
  @override
  List<Object> get props => [error];
}
