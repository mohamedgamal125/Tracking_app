import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api/api_execute.dart';
import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/order_details/data/data_source/update_order_state_remote_data_source.dart';
import 'package:tracking_app/feature/order_details/domain/repository/update_order_state_repo.dart';

@Injectable(as: UpdateOrderStateRepo)
class UpdateOrderStateRepoImp implements UpdateOrderStateRepo {
  final UpdateOrderStateRemoteDataSource _updateOrderStateRemoteDataSource;

  UpdateOrderStateRepoImp(this._updateOrderStateRemoteDataSource);
  @override
  Future<Result<void>> updateOrderState(
      String orderId, Map<String, dynamic> data) async {
    return await executeApi<void>(
      () async {
        await _updateOrderStateRemoteDataSource.updateOrderState(orderId, data);
      },
    );
  }
}
