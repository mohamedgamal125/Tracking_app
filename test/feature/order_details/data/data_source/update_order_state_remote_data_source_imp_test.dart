import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

// Replace with your actual imports
import 'package:tracking_app/core/api/api_client.dart';
import 'package:tracking_app/feature/order_details/data/data_source/update_order_state_remote_data_source.dart';
import 'package:tracking_app/feature/order_details/data/data_source/update_order_state_remote_data_source_imp.dart';
import 'update_order_state_remote_data_source_imp_test.mocks.dart' show MockApiClient;

// Generate the mock class using build_runner
@GenerateMocks([ApiClient])

void main() {
  late MockApiClient mockApiClient;
  late UpdateOrderStateRemoteDataSource dataSource;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = UpdateOrderStateRemoteDataSourceImp(mockApiClient);
  });

  group('UpdateOrderStateRemoteDataSourceImp', () {
    test('should call ApiClient.updateOrderState with correct parameters', () async {
      // Arrange
      const orderId = 'order123';
      final data = {'status': 'delivered'};

      when(mockApiClient.updateOrderState(orderId, data))
          .thenAnswer((_) async => Future.value());

      // Act
      await dataSource.updateOrderState(orderId, data);

      // Assert
      verify(mockApiClient.updateOrderState(orderId, data)).called(1);
    });

    test('should throw if ApiClient.updateOrderState throws', () async {
      // Arrange
      const orderId = 'order456';
      final data = {'status': 'cancelled'};

      when(mockApiClient.updateOrderState(orderId, data))
          .thenThrow(Exception('API error'));

      // Act & Assert
      expect(() => dataSource.updateOrderState(orderId, data), throwsException);
    });
  });
}
