import 'package:bloc/bloc.dart';
import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/home/domain/use_case/get_pending_orders_use_case.dart';
import 'package:tracking_app/feature/home/presentation/cubits/home_states.dart';

class HomeViewModel extends Cubit<HomeState> {
  final GetPendingOrdersUseCase _getPendingOrdersUseCase;
  HomeViewModel(this._getPendingOrdersUseCase) : super(HomeInitialState());

  void getPendingOrders() async {
    emit(PendingOrdersLoadingState());
    final result = await _getPendingOrdersUseCase.execute();
    switch (result) {
      case Success():
        emit(PendingOrdersSuccessState(result.data?.orders ?? []));
        break;
      case Error():
        emit(PendingOrdersErrorState(result.exception ?? 'Error occurred'));
        break;
    }
  }
}
