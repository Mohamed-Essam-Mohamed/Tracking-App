
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/features/auth/domain/entities/apply_entity.dart';

import '../../../../../core/network/common/api_result.dart';
import '../../../data/models/post_auth.dart';
import '../../../data/models/vehicles_model.dart';
import '../../../domain/entities/vehicles_entitiy.dart';
import '../../../domain/use_cases/apply_use_cases.dart';
import 'apply_state.dart';
@injectable
class ApplyCubit extends Cubit<ApplyState> {
  final ApplyUseCases applyUseCases;

  ApplyCubit(this.applyUseCases) : super(ApplyInitial());

  void signup(PostAuth postAuth) async {

    emit(ApplyLoadingState());
    try {
      final formData = await postAuth.toFormData();
      final result = await applyUseCases.apply(formData);

      switch (result) {
        case SuccessResult<ApplyEntity>():
          final data = result.data;
          if (data == null) {
            emit(ApplyErrorState(data.message ?? "Error"));
            return;
          }
          emit(ApplySuccessState(applyEntity: data));
          break;

        case FailureResult<ApplyEntity>():
          emit(ApplyErrorState(result.exception.toString()));
          break;
      }
    } catch (e) {
      emit(ApplyErrorState(e.toString()));
    }
  }
  List<VehiclesEntity> vehiclesList = [];
  void getAllVehicles() async {
    emit(VehiclesLoadingState());
    try {
      final result = await applyUseCases.getAllVehicles();
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




}
