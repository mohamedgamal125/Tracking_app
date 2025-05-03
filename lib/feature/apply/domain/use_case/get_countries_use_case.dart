import 'package:tracking_app/feature/apply/domain/repo/apply_repo.dart';

class GetCountriesUseCase {
  final ApplyRepo _applyRepo;

  GetCountriesUseCase(this._applyRepo);

  Future<List> getCountries() async {
    return _applyRepo.getCountries();
  }
}
