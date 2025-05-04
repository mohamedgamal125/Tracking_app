// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../feature/apply/data/data_source/offline_data_source/apply_offline_data_source.dart'
    as _i178;
import '../../feature/apply/data/data_source/offline_data_source/apply_offline_data_source_impl.dart'
    as _i42;
import '../../feature/apply/data/data_source/remote_data_source/apply_remote_data_source.dart'
    as _i602;
import '../../feature/apply/data/data_source/remote_data_source/apply_remote_data_source_impl.dart'
    as _i625;
import '../../feature/apply/data/repo_impl/apply_repo_impl.dart' as _i753;
import '../../feature/apply/domain/repo/apply_repo.dart' as _i1036;
import '../../feature/apply/domain/use_case/apply_use_case.dart' as _i628;
import '../../feature/apply/domain/use_case/get_countries_use_case.dart'
    as _i150;
import '../../feature/apply/domain/use_case/get_vehicles_use_case.dart'
    as _i275;
import '../../feature/apply/presentation/cubits/apply_view_model/apply_view_model.dart'
    as _i734;
import '../api/api_client.dart' as _i277;
import '../api/network_factory.dart' as _i1013;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioProvider = _$DioProvider();
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.lazySingleton<_i1013.AuthInterceptor>(() => _i1013.AuthInterceptor());
    gh.factory<_i178.ApplyOfflineDataSource>(
        () => _i42.ApplyOfflineDataSourceImpl());
    gh.singleton<_i277.ApiClient>(() => _i277.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i602.ApplyRemoteDataSource>(
        () => _i625.ApplyRemoteDataSourceImpl(gh<_i277.ApiClient>()));
    gh.factory<_i1036.ApplyRepo>(() => _i753.ApplyRepoImpl(
          gh<_i602.ApplyRemoteDataSource>(),
          gh<_i178.ApplyOfflineDataSource>(),
        ));
    gh.factory<_i628.ApplyUseCase>(
        () => _i628.ApplyUseCase(gh<_i1036.ApplyRepo>()));
    gh.factory<_i150.GetCountriesUseCase>(
        () => _i150.GetCountriesUseCase(gh<_i1036.ApplyRepo>()));
    gh.factory<_i275.GetVehiclesUseCase>(
        () => _i275.GetVehiclesUseCase(gh<_i1036.ApplyRepo>()));
    gh.factory<_i734.ApplyViewModel>(() => _i734.ApplyViewModel(
          gh<_i628.ApplyUseCase>(),
          gh<_i275.GetVehiclesUseCase>(),
        ));
    return this;
  }
}

class _$DioProvider extends _i1013.DioProvider {}
