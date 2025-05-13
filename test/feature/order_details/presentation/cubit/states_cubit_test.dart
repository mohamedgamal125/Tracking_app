import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:tracking_app/feature/order_details/presentation/cubits/states_cubit.dart';

void main() {
  group('StatesCubit', () {
    late StatesCubit cubit;

    setUp(() {
      cubit = StatesCubit();
    });

    tearDown(() {
      cubit.close();
    });

    test('initial state should be 0', () {
      expect(cubit.state, 0);
    });

    blocTest<StatesCubit, int>(
      'emits [1] when changeState is called once',
      build: () => StatesCubit(),
      act: (cubit) => cubit.changeState(),
      expect: () => [1],
    );

    blocTest<StatesCubit, int>(
      'emits [1, 2, 3, 4] when changeState is called 4 times',
      build: () => StatesCubit(),
      act: (cubit) {
        cubit.changeState();
        cubit.changeState();
        cubit.changeState();
        cubit.changeState();
      },
      expect: () => [1, 2, 3, 4],
    );

    blocTest<StatesCubit, int>(
      'does not emit values beyond 4',
      build: () => StatesCubit(),
      act: (cubit) {
        for (int i = 0; i < 10; i++) {
          cubit.changeState();
        }
      },
      expect: () => [1, 2, 3, 4],
    );
  });
}
