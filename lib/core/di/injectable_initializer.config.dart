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

import '../../feature/auth/data/data_source/auth_local_data_source.dart'
    as _i804;
import '../../feature/auth/data/data_source/auth_remote_data_source.dart'
    as _i140;
import '../../feature/auth/data/repository_imp/auth_repository_imp.dart'
    as _i384;
import '../../feature/auth/domain/repository/auth_repository.dart' as _i884;
import '../../feature/auth/domain/use_case/auth_use_case.dart' as _i137;
import '../../feature/auth/domain/use_case/sign_in_use_case.dart' as _i189;
import '../../feature/auth/presentation/cubit/forget_password_cubit/forget_password_view_model.dart'
    as _i1056;
import '../../feature/auth/presentation/cubit/reset_password_cubit/reset_password_view_model.dart'
    as _i828;
import '../../feature/auth/presentation/cubit/sign_in_cubit/sign_in_view_model.dart'
    as _i741;
import '../../feature/auth/presentation/cubit/verify_email_cubit/verify_email_vew_model.dart'
    as _i798;
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
    gh.factory<_i804.AuthLocalDataSource>(
        () => _i804.AuthLocalDataSourceImpl());
    gh.singleton<_i277.ApiClient>(() => _i277.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i140.AuthRemoteDataSource>(
        () => _i140.AuthRemoteDataSourceImpl(gh<_i277.ApiClient>()));
    gh.factory<_i884.AuthRepository>(() => _i384.AuthRepositoryImpl(
          gh<_i140.AuthRemoteDataSource>(),
          gh<_i804.AuthLocalDataSource>(),
        ));
    gh.factory<_i137.AuthUseCase>(
        () => _i137.AuthUseCase(gh<_i884.AuthRepository>()));
    gh.factory<_i189.SignInUseCase>(
        () => _i189.SignInUseCase(gh<_i884.AuthRepository>()));
    gh.factory<_i1056.ForgetPasswordViewModel>(
        () => _i1056.ForgetPasswordViewModel(gh<_i137.AuthUseCase>()));
    gh.factory<_i828.ResetPasswordViewModel>(
        () => _i828.ResetPasswordViewModel(gh<_i137.AuthUseCase>()));
    gh.factory<_i741.SignInViewModel>(
        () => _i741.SignInViewModel(gh<_i189.SignInUseCase>()));
    gh.factory<_i798.VerifyEmailViewModel>(
        () => _i798.VerifyEmailViewModel(gh<_i137.AuthUseCase>()));
    return this;
  }
}

class _$DioProvider extends _i1013.DioProvider {}
