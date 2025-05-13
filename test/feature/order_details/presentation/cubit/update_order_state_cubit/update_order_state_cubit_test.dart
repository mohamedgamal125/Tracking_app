import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/order_details/domain/repository/update_order_state_repo.dart';
import 'package:tracking_app/feature/order_details/presentation/cubits/update_order_state_cubit/update_order_state_cubit.dart';
import 'package:tracking_app/feature/order_details/presentation/cubits/update_order_state_cubit/update_order_state_states.dart';

import 'update_order_state_cubit_test.mocks.dart';

// Generate mock using build_runner
@GenerateMocks([UpdateOrderStateRepo])

void main() {
  late MockUpdateOrderStateRepo mockRepo;
  late UpdateOrderStateCubit cubit;

  setUp(() {
    mockRepo = MockUpdateOrderStateRepo();
    cubit = UpdateOrderStateCubit(mockRepo);
  });

  group('UpdateOrderStateCubit', () {
    const orderId = 'order123';
    final data = {'status': 'delivered'};

    blocTest<UpdateOrderStateCubit, UpdateOrderStateStates>(
      'emits [Loading, Success] when update is successful',
      build: () {
        when(mockRepo.updateOrderState(orderId, data))
            .thenAnswer((_) async => Success(true));
        return cubit;
      },
      act: (cubit) => cubit.updateOrderState(orderId, data),
      expect: () => [
        UpdateOrderStateLoading(),
        UpdateOrderStateSuccess(),
      ],
    );

    blocTest<UpdateOrderStateCubit, UpdateOrderStateStates>(
      'emits [Loading, Error] when update fails',
      build: () {
        when(mockRepo.updateOrderState(orderId, data))
            .thenAnswer((_) async => Error("Update failed"));
        return cubit;
      },
      act: (cubit) => cubit.updateOrderState(orderId, data),
      expect: () => [
        UpdateOrderStateLoading(),
        isA<UpdateOrderStateError>().having(
            (state) => state.message, 'message', contains("Update failed")),
      ],
    );
  });
}
