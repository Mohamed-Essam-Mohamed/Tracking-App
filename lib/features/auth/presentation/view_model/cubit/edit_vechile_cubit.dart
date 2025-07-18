import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/auth/domain/entities/vehicles_entitiy.dart';
import 'package:tracking_app/features/auth/domain/use_cases/apply_use_cases.dart';
import 'package:tracking_app/features/auth/domain/use_cases/edit_vechile_usecase.dart';
import 'package:tracking_app/features/auth/presentation/view_model/apply/apply_state.dart';

@injectable
class VehicleCubit extends Cubit<ApplyState> {
  VehicleCubit(this.editVechileUsecase) : super(const ApplyInitial());

  final EditVechileUsecase editVechileUsecase;

  List<VehiclesEntity> vehiclesList = [];

  void getAllVehicles() async {
    emit(VehiclesLoadingState());
    try {
      final result = await editVechileUsecase.getAllVehicles();
      if (result is SuccessResult<VehiclesModelEntity>) {
        vehiclesList = result.data.vehicles ?? [];
        emit(VehiclesSuccessState(result.data));
      } else if (result is FailureResult<VehiclesModelEntity>) {
        emit(VehiclesErrorState(result.exception.toString()));
      }
    } catch (e) {
      emit(VehiclesErrorState(e.toString()));
    }
  }
  void apply() async {
    emit(VehiclesLoadingState());
    try {
      final result = await editVechileUsecase.getAllVehicles();
      if (result is SuccessResult<VehiclesModelEntity>) {
        vehiclesList = result.data.vehicles ?? [];
        emit(VehiclesSuccessState(result.data));
      } else if (result is FailureResult<VehiclesModelEntity>) {
        emit(VehiclesErrorState(result.exception.toString()));
      }
    } catch (e) {
      emit(VehiclesErrorState(e.toString()));
    }
  }

// Optional: Add a method to submit or update vehicle info later if needed
}
