
import '../../../domain/entity/profile_response_entity.dart';

sealed class EditProfileState {}

class EditProfileInitialState extends EditProfileState {}

class EditProfileLoadingState extends EditProfileState {}

class EditProfileSuccessState extends EditProfileState {
  final ProfileResponseEntity data;
  EditProfileSuccessState({required this.data});
}

class EditProfileErrorState extends EditProfileState {
  final String message;
  EditProfileErrorState(this.message);
}
