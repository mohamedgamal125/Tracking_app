
sealed class CheckImageWithGeminiStates {}

class CheckImageWithGeminiInitialState extends CheckImageWithGeminiStates {}

class CheckImageLicenseLoadingState extends CheckImageWithGeminiStates {}

class CheckImageLicenseValidateState extends CheckImageWithGeminiStates {
  final String? licenseValidate;
  CheckImageLicenseValidateState(this.licenseValidate);
}

class CheckImageLicenseErrorState extends CheckImageWithGeminiStates {
  final String error;
  CheckImageLicenseErrorState(this.error);
}

class CheckImageNationalIdLoadingState extends CheckImageWithGeminiStates {}

class CheckImageNationalIdValidateState extends CheckImageWithGeminiStates {
  final String? nationalIdValidate;
  final String? nationalId;
  CheckImageNationalIdValidateState({this.nationalIdValidate, this.nationalId});
}

class CheckImageNationalIdErrorState extends CheckImageWithGeminiStates {
  final String error;
  CheckImageNationalIdErrorState(this.error);
}
