import 'package:injectable/injectable.dart';
import 'package:tracking_app/feature/apply/domain/repo/apply_repo.dart';

@injectable
class GetCountriesUseCase {
  final ApplyRepo _applyRepo;

  GetCountriesUseCase(this._applyRepo);

  Future<List> execute() async {
    return _applyRepo.getCountries();
  }
}
