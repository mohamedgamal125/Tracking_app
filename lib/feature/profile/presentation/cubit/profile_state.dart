

import '../../domain/entity/profile_response_entity.dart';

sealed class ProfileState {}

class LoadingProfileState extends ProfileState {}

class SuccessProfileState extends ProfileState {
  final DriverEntity? user;
  SuccessProfileState(this.user);
}

class ErrorProfileState extends ProfileState {
  final String message;
  ErrorProfileState(this.message);
}

class LogoutSuccessState extends ProfileState {}
