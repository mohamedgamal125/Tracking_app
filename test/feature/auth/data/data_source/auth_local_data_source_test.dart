// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';
// import 'package:tracking_app/core/services/shared_preference_services.dart';
// import 'package:tracking_app/feature/auth/data/data_source/auth_local_data_source.dart';
// import 'package:tracking_app/core/utils/constant_manager.dart';
//
// import 'auth_local_data_source_test.mocks.dart';
//
// @GenerateMocks([SharedPreferenceServices])
// void main() {
//   late SharedPreferenceServices sharedPreferenceServices;
//   late AuthLocalDataSourceImpl localDataSource;
//
//   setUp(() {
//     sharedPreferenceServices = MockSharedPreferenceServices();
//     localDataSource = AuthLocalDataSourceImpl();
//   });
//
//   group('AuthLocalDataSourceImpl', () {
//     test("Should save token when calling saveToken", () async {
//       const token = "abc123";
//
//       when(sharedPreferenceServices.saveData(AppConstants.token, token))
//           .thenAnswer((_) async => {});
//
//       await localDataSource.saveToken(token);
//
//       verify(sharedPreferenceServices.saveData(AppConstants.token, token)).called(1);
//     });
//
//     test("Should save email when calling saveEmail", () async {
//       const email = "test@example.com";
//
//       when(sharedPreferenceServices.saveData(AppConstants.email, email))
//           .thenAnswer((_) async => {});
//
//       await localDataSource.saveEmail(email);
//
//       verify(sharedPreferenceServices.saveData(AppConstants.email, email)).called(1);
//     });
//
//     test("Should delete token when calling deleteToken", () async {
//       when(sharedPreferenceServices.deleteData(AppConstants.token))
//           .thenAnswer((_) async => {});
//
//       await localDataSource.deleteToken();
//
//       verify(sharedPreferenceServices.deleteData(AppConstants.token)).called(1);
//     });
//   });
// }
