import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/order_details/data/data_source/update_order_state_remote_data_source.dart';
import 'package:tracking_app/feature/order_details/data/repository_imp/update_order_state_repo_imp.dart';
import 'package:tracking_app/feature/order_details/domain/repository/update_order_state_repo.dart';

import 'update_order_state_repo_imp_test.mocks.dart';

@GenerateMocks([UpdateOrderStateRemoteDataSource])
void main() {
  late MockUpdateOrderStateRemoteDataSource mockRemoteDataSource;
  late UpdateOrderStateRepo repo;

  setUp(() {
    mockRemoteDataSource = MockUpdateOrderStateRemoteDataSource();
    repo = UpdateOrderStateRepoImp(mockRemoteDataSource);
  });

  group('UpdateOrderStateRepoImp', () {
    const orderId = 'order123';
    final data = {'status': 'shipped'};

    test('should return Result.success when remote call succeeds', () async {
      // Arrange
      when(mockRemoteDataSource.updateOrderState(orderId, data))
          .thenAnswer((_) async => Future.value());

      // Act
      final result = await repo.updateOrderState(orderId, data);

      // Assert
      expect(result, isA<Success<void>>());
      verify(mockRemoteDataSource.updateOrderState(orderId, data)).called(1);
    });

    test('should return Result.failure when remote call throws', () async {
      // Arrange
      when(mockRemoteDataSource.updateOrderState(orderId, data))
          .thenThrow(Exception('API error'));

      // Act
      final result = await repo.updateOrderState(orderId, data);

      // Assert
      expect(result, isA<Error<void>>());
      verify(mockRemoteDataSource.updateOrderState(orderId, data)).called(1);
    });
  });
}
