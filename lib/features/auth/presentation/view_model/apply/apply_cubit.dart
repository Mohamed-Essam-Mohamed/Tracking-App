import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/network/common/api_result.dart';
import 'package:tracking_app/features/auth/data/models/post_auth.dart';
import 'package:tracking_app/features/auth/domain/entities/apply_entity.dart';
import 'package:tracking_app/features/auth/domain/entities/vehicles_entitiy.dart';
import 'package:tracking_app/features/auth/domain/use_cases/apply_use_cases.dart';
import 'package:tracking_app/features/auth/presentation/view_model/apply/apply_state.dart';

@injectable
class ApplyCubit extends Cubit<ApplyState> {
  ApplyCubit(this.applyUseCases) : super(const ApplyInitial());
  final ApplyUseCases applyUseCases;

  void signup(PostAuth postAuth) async {
    emit(const ApplyLoadingState());
    try {
      final formData = await postAuth.toFormData();
      final result = await applyUseCases.apply(formData);

      switch (result) {
        case SuccessResult<ApplyEntity>():
          final data = result.data;
          if (data == null) {
            emit(ApplyErrorState(data.message ?? 'Error'));
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
