import 'package:injectable/injectable.dart';
import '../../../../core/services/shared_preference_services.dart';
import '../../../../core/utils/constant_manager.dart';

abstract class AuthLocalDataSource {
  Future<void> saveToken(String token);
  Future<void> saveEmail(String email);
  Future<void> deleteToken();
}

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<void> saveToken(String token) async {
    await SharedPreferenceServices.saveData(AppConstants.token, token);
  }

  @override
  Future<void> saveEmail(String email) async {
    await SharedPreferenceServices.saveData(AppConstants.email, email);
  }

  @override
  Future<void> deleteToken() async {
    await SharedPreferenceServices.deleteData(AppConstants.token);
  }
}

