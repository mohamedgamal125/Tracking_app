import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/di/injectable_initializer.dart';
import '../../../../../core/common/result.dart';
import '../../../domain/use_case/edit_profile_use_case.dart';
import '../profile_view_model.dart';
import 'edit_profile_state.dart';

@injectable
class EditProfileViewModel extends Cubit<EditProfileState> {
  final EditProfileUseCase _editProfileUseCase;
  EditProfileViewModel(this._editProfileUseCase)
    : super(EditProfileInitialState());

  void editProfile(Map<String, dynamic> data) async {
    emit(EditProfileLoadingState());
    final result = await _editProfileUseCase.execute(data);
    switch (result) {
      case Success():
        emit(EditProfileSuccessState(data: result.data!));
        getIt.get<ProfileViewModel>().doIntent(ProfileClickedIntent());

      case Error():
        emit(EditProfileErrorState(result.exception!));
    }
  }
}
