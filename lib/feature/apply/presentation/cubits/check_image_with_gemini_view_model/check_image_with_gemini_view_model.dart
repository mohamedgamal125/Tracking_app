import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:tracking_app/core/services/gemini_service.dart';

import 'package:tracking_app/feature/apply/presentation/cubits/check_image_with_gemini_view_model/check_image_with_gemini_states.dart';

@injectable
class CheckImageWithGeminiViewModel extends Cubit<CheckImageWithGeminiStates> {
  final GeminiService _geminiService;
  CheckImageWithGeminiViewModel(
    this._geminiService,
  ) : super(CheckImageWithGeminiInitialState());

  Future<void> analyzeNationalId(File image, String country) async {
    emit(CheckImageNationalIdLoadingState());

    try {
      List<String> result =
          await _geminiService.validateNationalIdCard(image, country);
      final message = _geminiService.generateNationalIdMessage(result, country);
      emit(CheckImageNationalIdValidateState(
          nationalIdValidate: message, nationalId: result[1] ?? ''));
    } catch (e) {
      emit(CheckImageNationalIdErrorState(
          'Failed to analyze national ID card.'));
    }
  }

  Future<void> analyzeDrivingLicense(File image, String country) async {
    emit(CheckImageLicenseLoadingState());
    try {
      final valid = await _geminiService.validateVehicleLicense(image, country);
      final message =
          _geminiService.generateDrivingLicenseMessage(valid, country);
      emit(CheckImageLicenseValidateState(message));
    } catch (e) {
      emit(CheckImageLicenseErrorState('Failed to analyze driving license.'));
    }
  }
}
