import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/feature/profile/presentation/cubit/upload_photo_cubit/upload_photo_state.dart';

import '../../../../../core/common/result.dart';
import '../../../domain/use_case/upload_photo_use_case.dart';

@injectable
class UploadPhotoViewModel extends Cubit<UploadPhotoState> {
  final UploadPhotoUseCase _uploadPhotoUseCase;
  UploadPhotoViewModel(this._uploadPhotoUseCase)
    : super(UploadPhotoInitialState());
  void uploadPhoto(File photo) async {
    emit(UploadPhotoLoadingState());
    final result = await _uploadPhotoUseCase.execute(photo);
    switch (result) {
      case Success():
        emit(UploadPhotoSuccessState());
      case Error():
        emit(UploadPhotoErrorState(result.exception!));
    }
  }
}
