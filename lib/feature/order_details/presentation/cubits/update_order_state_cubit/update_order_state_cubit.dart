import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/order_details/domain/repository/update_order_state_repo.dart';
import 'package:tracking_app/feature/order_details/presentation/cubits/update_order_state_cubit/update_order_state_states.dart';

@injectable
class UpdateOrderStateCubit extends Cubit<UpdateOrderStateStates> {
  final UpdateOrderStateRepo _updateOrderStateRepo;

  UpdateOrderStateCubit(this._updateOrderStateRepo)
      : super(UpdateOrderStateInitial());

  Future<void> updateOrderState(
      String orderId, Map<String, dynamic> data) async {
    emit(UpdateOrderStateLoading());
    final Result<void> result =
        await _updateOrderStateRepo.updateOrderState(orderId, data);
    switch (result) {
      case Success():
        emit(UpdateOrderStateSuccess());
        break;
      case Error():
        log(result.exception.toString() + "+++++++++++++++++++++++++++++++");
        emit(UpdateOrderStateError(
          message: result.exception.toString(),
        ));
        break;
    }
  }
}
