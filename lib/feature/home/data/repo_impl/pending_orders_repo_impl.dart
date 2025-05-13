import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/api/api_execute.dart';
import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/home/data/data_source/home_remote_data_source/home_remote_data_source.dart';
import 'package:tracking_app/feature/home/domain/entites/pending_orders_response_entity.dart';
import 'package:tracking_app/feature/home/domain/repo/pending_orders_repo.dart';

@Injectable(as: PendingOrdersRepo)
class PendingOrdersRepoImpl implements PendingOrdersRepo {
  final HomeRemoteDataSource _homeRemoteDataSource;
  PendingOrdersRepoImpl(this._homeRemoteDataSource);
  @override
  Future<Result<PendingOrdersResponseEntity>> getPendingOrders() async {
    return await executeApi(() async {
      final data = await _homeRemoteDataSource.getPendingOrders();
      return data.toEntity();
    });
  }
}
