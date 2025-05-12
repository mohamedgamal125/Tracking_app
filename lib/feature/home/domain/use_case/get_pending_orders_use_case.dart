import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/common/result.dart';
import 'package:tracking_app/feature/home/domain/entites/pending_orders_response_entity.dart';
import 'package:tracking_app/feature/home/domain/repo/pending_orders_repo.dart';

@injectable
class GetPendingOrdersUseCase {
  final PendingOrdersRepo _pendingOrdersRepo;
  GetPendingOrdersUseCase(this._pendingOrdersRepo);

  Future<Result<PendingOrdersResponseEntity>> execute() async {
    return await _pendingOrdersRepo.getPendingOrders();
  }
}
