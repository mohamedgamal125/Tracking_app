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
import 'package:shared_preferences/shared_preferences.dart' as _i460;

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
import '../../feature/apply/presentation/cubits/check_image_with_gemini_view_model/check_image_with_gemini_view_model.dart'
    as _i101;
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
import '../../feature/home/data/data_source/home_remote_data_source/home_remote_data_source.dart'
    as _i825;
import '../../feature/home/data/data_source/home_remote_data_source/home_remote_data_source_impl.dart'
    as _i421;
import '../../feature/home/data/repo_impl/pending_orders_repo_impl.dart'
    as _i551;
import '../../feature/home/domain/repo/pending_orders_repo.dart' as _i220;
import '../../feature/home/domain/use_case/get_pending_orders_use_case.dart'
    as _i158;
import '../../feature/home/presentation/cubits/home_view_model.dart' as _i949;
import '../../feature/order_details/data/data_source/update_order_state_remote_data_source.dart'
    as _i377;
import '../../feature/order_details/data/data_source/update_order_state_remote_data_source_imp.dart'
    as _i197;
import '../../feature/order_details/data/repository_imp/update_order_state_repo_imp.dart'
    as _i528;
import '../../feature/order_details/domain/repository/update_order_state_repo.dart'
    as _i476;
import '../../feature/order_details/presentation/cubits/states_cubit.dart'
    as _i146;
import '../../feature/order_details/presentation/cubits/update_order_state_cubit/update_order_state_cubit.dart'
    as _i718;
import '../../feature/profile/data/data_source/profile_local_data_source.dart'
    as _i363;
import '../../feature/profile/data/data_source/profile_remote_data_source.dart'
    as _i371;
import '../../feature/profile/data/repository_imp/profile_screen_repository_imp.dart'
    as _i685;
import '../../feature/profile/domain/repository/profile_screen_repository.dart'
    as _i176;
import '../../feature/profile/domain/use_case/change_password_use_case.dart'
    as _i1053;
import '../../feature/profile/domain/use_case/edit_profile_use_case.dart'
    as _i36;
import '../../feature/profile/domain/use_case/edit_vehicle_use_case.dart'
    as _i261;
import '../../feature/profile/domain/use_case/profile_screen_use_case.dart'
    as _i705;
import '../../feature/profile/domain/use_case/upload_photo_use_case.dart'
    as _i625;
import '../../feature/profile/presentation/cubit/change_password_cubit/change_password_view-model.dart'
    as _i557;
import '../../feature/profile/presentation/cubit/edit_profile_cubit/edit_profile_view_model.dart'
    as _i917;
import '../../feature/profile/presentation/cubit/edite_vehicle_cubit/edit_vehicle_view_model.dart'
    as _i663;
import '../../feature/profile/presentation/cubit/profile_view_model.dart'
    as _i8;
import '../../feature/profile/presentation/cubit/upload_photo_cubit/upload_photo_view_model.dart'
    as _i804;
import '../api/api_client.dart' as _i277;
import '../api/network_factory.dart' as _i1013;
import '../services/gemini_service.dart' as _i846;

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
    gh.factory<_i846.GeminiService>(() => _i846.GeminiService());
    gh.factory<_i146.StatesCubit>(() => _i146.StatesCubit());
    gh.lazySingleton<_i361.Dio>(() => dioProvider.dioProvider());
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioProvider.providePretty());
    gh.lazySingleton<_i1013.AuthInterceptor>(() => _i1013.AuthInterceptor());
    gh.factory<_i101.CheckImageWithGeminiViewModel>(
        () => _i101.CheckImageWithGeminiViewModel(gh<_i846.GeminiService>()));
    gh.factory<_i178.ApplyOfflineDataSource>(
        () => _i42.ApplyOfflineDataSourceImpl());
    gh.factory<_i804.AuthLocalDataSource>(
        () => _i804.AuthLocalDataSourceImpl());
    gh.singleton<_i277.ApiClient>(() => _i277.ApiClient(gh<_i361.Dio>()));
    gh.factory<_i363.ProfileLocalDataSource>(
        () => _i363.ProfileLocalDataSourceImpl(gh<_i460.SharedPreferences>()));
    gh.factory<_i825.HomeRemoteDataSource>(
        () => _i421.HomeRemoteDataSourceImpl(gh<_i277.ApiClient>()));
    gh.factory<_i140.AuthRemoteDataSource>(
        () => _i140.AuthRemoteDataSourceImpl(gh<_i277.ApiClient>()));
    gh.factory<_i602.ApplyRemoteDataSource>(
        () => _i625.ApplyRemoteDataSourceImpl(gh<_i277.ApiClient>()));
    gh.factory<_i377.UpdateOrderStateRemoteDataSource>(
        () => _i197.UpdateOrderStateRemoteDataSourceImp(gh<_i277.ApiClient>()));
    gh.factory<_i476.UpdateOrderStateRepo>(() => _i528.UpdateOrderStateRepoImp(
        gh<_i377.UpdateOrderStateRemoteDataSource>()));
    gh.factory<_i371.ProfileRemoteDataSource>(
        () => _i371.ProfileRemoteDataSourceImpl(gh<_i277.ApiClient>()));
    gh.factory<_i718.UpdateOrderStateCubit>(
        () => _i718.UpdateOrderStateCubit(gh<_i476.UpdateOrderStateRepo>()));
    gh.factory<_i884.AuthRepository>(() => _i384.AuthRepositoryImpl(
          gh<_i140.AuthRemoteDataSource>(),
          gh<_i804.AuthLocalDataSource>(),
        ));
    gh.factory<_i1036.ApplyRepo>(() => _i753.ApplyRepoImpl(
          gh<_i602.ApplyRemoteDataSource>(),
          gh<_i178.ApplyOfflineDataSource>(),
        ));
    gh.factory<_i220.PendingOrdersRepo>(
        () => _i551.PendingOrdersRepoImpl(gh<_i825.HomeRemoteDataSource>()));
    gh.factory<_i137.AuthUseCase>(
        () => _i137.AuthUseCase(gh<_i884.AuthRepository>()));
    gh.factory<_i189.SignInUseCase>(
        () => _i189.SignInUseCase(gh<_i884.AuthRepository>()));
    gh.factory<_i176.ProfileRepository>(() => _i685.ProfileRepositoryImpl(
          gh<_i371.ProfileRemoteDataSource>(),
          gh<_i363.ProfileLocalDataSource>(),
        ));
    gh.factory<_i1056.ForgetPasswordViewModel>(
        () => _i1056.ForgetPasswordViewModel(gh<_i137.AuthUseCase>()));
    gh.factory<_i828.ResetPasswordViewModel>(
        () => _i828.ResetPasswordViewModel(gh<_i137.AuthUseCase>()));
    gh.factory<_i158.GetPendingOrdersUseCase>(
        () => _i158.GetPendingOrdersUseCase(gh<_i220.PendingOrdersRepo>()));
    gh.factory<_i1053.ChangePasswordUseCase>(
        () => _i1053.ChangePasswordUseCase(gh<_i176.ProfileRepository>()));
    gh.factory<_i36.EditProfileUseCase>(
        () => _i36.EditProfileUseCase(gh<_i176.ProfileRepository>()));
    gh.factory<_i261.EditVehicleUseCase>(
        () => _i261.EditVehicleUseCase(gh<_i176.ProfileRepository>()));
    gh.factory<_i705.ProfileUseCase>(
        () => _i705.ProfileUseCase(gh<_i176.ProfileRepository>()));
    gh.factory<_i625.UploadPhotoUseCase>(
        () => _i625.UploadPhotoUseCase(gh<_i176.ProfileRepository>()));
    gh.factory<_i628.ApplyUseCase>(
        () => _i628.ApplyUseCase(gh<_i1036.ApplyRepo>()));
    gh.factory<_i150.GetCountriesUseCase>(
        () => _i150.GetCountriesUseCase(gh<_i1036.ApplyRepo>()));
    gh.factory<_i275.GetVehiclesUseCase>(
        () => _i275.GetVehiclesUseCase(gh<_i1036.ApplyRepo>()));
    gh.factory<_i741.SignInViewModel>(
        () => _i741.SignInViewModel(gh<_i189.SignInUseCase>()));
    gh.factory<_i949.HomeViewModel>(
        () => _i949.HomeViewModel(gh<_i158.GetPendingOrdersUseCase>()));
    gh.factory<_i8.ProfileViewModel>(() => _i8.ProfileViewModel(
          gh<_i705.ProfileUseCase>(),
          gh<_i363.ProfileLocalDataSource>(),
        ));
    gh.factory<_i798.VerifyEmailViewModel>(
        () => _i798.VerifyEmailViewModel(gh<_i137.AuthUseCase>()));
    gh.factory<_i804.UploadPhotoViewModel>(
        () => _i804.UploadPhotoViewModel(gh<_i625.UploadPhotoUseCase>()));
    gh.factory<_i663.EditVehicleViewModel>(
        () => _i663.EditVehicleViewModel(gh<_i261.EditVehicleUseCase>()));
    gh.factory<_i734.ApplyViewModel>(() => _i734.ApplyViewModel(
          gh<_i628.ApplyUseCase>(),
          gh<_i275.GetVehiclesUseCase>(),
        ));
    gh.factory<_i917.EditProfileViewModel>(
        () => _i917.EditProfileViewModel(gh<_i36.EditProfileUseCase>()));
    gh.factory<_i557.ChangePasswordViewModel>(() =>
        _i557.ChangePasswordViewModel(gh<_i1053.ChangePasswordUseCase>()));
    return this;
  }
}

class _$DioProvider extends _i1013.DioProvider {}
