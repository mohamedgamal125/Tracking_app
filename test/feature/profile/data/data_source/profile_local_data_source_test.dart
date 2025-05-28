import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/core/utils/constant_manager.dart';
import 'package:tracking_app/feature/profile/data/data_source/profile_local_data_source.dart';

import 'profile_local_data_source_test.mocks.dart';

@GenerateMocks([SharedPreferences])
void main() {
  late MockSharedPreferences mockSharedPreferences;
  late ProfileLocalDataSourceImpl dataSource;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    dataSource = ProfileLocalDataSourceImpl(mockSharedPreferences);
  });

  group('ProfileLocalDataSource', () {
    const tToken = 'test_token';

    test('should cache token using SharedPreferences', () async {
      when(mockSharedPreferences.setString(AppConstants.token, tToken))
          .thenAnswer((_) async => true);

      await dataSource.cacheToken(tToken);

      verify(mockSharedPreferences.setString(AppConstants.token, tToken)).called(1);
    });

    test('should get cached token from SharedPreferences', () async {
      when(mockSharedPreferences.getString(AppConstants.token)).thenReturn(tToken);

      final result = await dataSource.getToken();

      verify(mockSharedPreferences.getString(AppConstants.token)).called(1);
      expect(result, tToken);
    });

    test('should delete token from SharedPreferences', () async {
      when(mockSharedPreferences.remove(AppConstants.token)).thenAnswer((_) async => true);

      await dataSource.deleteToken();

      verify(mockSharedPreferences.remove(AppConstants.token)).called(1);
    });
  });
}
