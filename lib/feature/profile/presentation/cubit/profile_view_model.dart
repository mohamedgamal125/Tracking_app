import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/common/result.dart';
import '../../domain/use_case/profile_screen_use_case.dart';
import '../../domain/entity/profile_response_entity.dart';
import '../cubit/profile_state.dart';
import '../../data/data_source/profile_local_data_source.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileState> {
  ProfileViewModel(this._profileUseCase, this._localDataSource)
      : super(LoadingProfileState());

  final ProfileUseCase _profileUseCase;
  final ProfileLocalDataSource _localDataSource;

  void doIntent(ProfileIntent profileIntent) {
    switch (profileIntent) {
      case ProfileClickedIntent():
        _getProfile();
        break;
    }
  }

  Future<void> _getProfile() async {
    emit(LoadingProfileState());

    final result = await _profileUseCase.execute();

    switch (result) {
      case Success():
        final profile = result.data;
        if (isClosed) {
          log("The Cubit is closed");
          return;
        }
        if (profile != null) {
          emit(SuccessProfileState(profile.driver));
          log('Fetched successfully: $state');
          log("Fetched successfully: ${profile.driver?.email}");
        } else {
          emit(ErrorProfileState("No driver data found"));
        }
        break;

      case Error():
        emit(ErrorProfileState("Profile API Error: ${result.exception}"));
        log("Profile API Error: ${result.exception}");
        break;
    }
  }
}

sealed class ProfileIntent {}

class ProfileClickedIntent extends ProfileIntent {}
