import 'package:tracking_app/feature/apply/domain/repo/apply_repo.dart';

class GetCountriesUseCase {
  final ApplyRepo _applyRepo;

  GetCountriesUseCase(this._applyRepo);

  Future<List> execute() async {
    return _applyRepo.getCountries();
  }
}
