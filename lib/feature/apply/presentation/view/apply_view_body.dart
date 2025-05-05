import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tracking_app/core/common/get_resposive_height_and_width.dart';
import 'package:tracking_app/core/di/injectable_initializer.dart';
import 'package:tracking_app/core/router/pages_routes.dart';
import 'package:tracking_app/core/services/gemini_service.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/constans.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import 'package:tracking_app/core/widgets/custom_validate.dart';
import 'package:tracking_app/feature/apply/data/model/apply_request_model.dart';
import 'package:tracking_app/feature/apply/domain/use_case/get_countries_use_case.dart';
import 'package:tracking_app/feature/apply/presentation/cubits/apply_view_model/apply_states.dart';
import 'package:tracking_app/feature/apply/presentation/cubits/apply_view_model/apply_view_model.dart';
import 'package:tracking_app/feature/apply/presentation/cubits/check_image_with_gemini_view_model/check_image_with_gemini_states.dart';
import 'package:tracking_app/feature/apply/presentation/cubits/check_image_with_gemini_view_model/check_image_with_gemini_view_model.dart';
import 'package:tracking_app/feature/apply/presentation/view/widgets/country_drop_down.dart';
import 'package:tracking_app/feature/apply/presentation/view/widgets/gender_selection_widget.dart';
import 'package:tracking_app/feature/apply/presentation/view/widgets/vehicle_type_drop_down_widget.dart';
import 'package:tracking_app/feature/apply/presentation/view/widgets/welcome_message_widget.dart';

class ApplyViewBody extends StatefulWidget {
  ApplyViewBody(
      {super.key,
      required this.applyViewModel,
      required this.checkImageViewModel});

  final ApplyViewModel applyViewModel;
  final CheckImageWithGeminiViewModel checkImageViewModel;

  @override
  State<ApplyViewBody> createState() => _ApplyViewBodyState();
}

class _ApplyViewBodyState extends State<ApplyViewBody> {
  final TextEditingController _firstLegalNameController =
      TextEditingController();
  final TextEditingController _secondLegalNameController =
      TextEditingController();
  final TextEditingController _vehicleNumberController =
      TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _licenseImageNameController =
      TextEditingController();
  final TextEditingController _nationalIdImageNameController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _nationalIdNumberController =
      TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  AutovalidateMode validateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? selectedGender;
  File? image1;
  File? image2;
  Map<String, dynamic>? dropDownValue;
  List<Map<String, dynamic>> countries = [];
  String? vehicleType;

  @override
  void initState() {
    super.initState();
    widget.applyViewModel.getAllVehicles();
    _loadCountries(); // Call the async method here
  }

  void _loadCountries() async {
    countries = await getIt.get<GetCountriesUseCase>().execute();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ApplyViewModel, ApplyState>(
      bloc: widget.applyViewModel,
      listener: (context, state) {
        if (state is ApplyLoadingState) {
          log('loading');
          EasyLoading.show();
        } else if (state is ApplySuccessState) {
          EasyLoading.dismiss();
          Navigator.pushNamed(context, PagesRoutes.successApplyView);
        } else if (state is ApplyErrorState) {
          log('error');
          EasyLoading.dismiss();
          EasyLoading.showError(state.error);
        }
      },
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: resposiveWidth(16)),
          child: Form(
            key: _formKey,
            autovalidateMode: validateMode,
            child: Column(
              children: [
                WelcomeMessage(),
                SizedBox(
                  height: resposiveHeight(16),
                ),
                CountryDropdown(
                  countries: countries,
                  selectedCountry: dropDownValue,
                  onCountrySelected: (Map<String, dynamic>? newValue) {
                    setState(() {
                      dropDownValue = newValue;
                      if (dropDownValue != null) {
                        _phoneNumberController.text =
                            dropDownValue!['phoneCode'];
                        log("Name: ${dropDownValue!['name']}, Phone Code: ${dropDownValue!['phoneCode']}");
                      }
                    });
                  },
                ),
                SizedBox(
                  height: resposiveHeight(16),
                ),
                TextFormField(
                  autovalidateMode: validateMode,
                  controller: _firstLegalNameController,
                  decoration: InputDecoration(
                      labelText: 'First legal name',
                      hintText: 'Enter first legal name'),
                  validator: (value) {
                    if (value == null || value.isEmpty == true) {
                      return "empty first name are not allowed";
                    }
                    return null;
                  },
                  onChanged: checkValidateForTextField,
                ),
                SizedBox(
                  height: resposiveHeight(16),
                ),
                TextFormField(
                  autovalidateMode: validateMode,
                  controller: _secondLegalNameController,
                  decoration: InputDecoration(
                      labelText: 'Second legal name',
                      hintText: 'Enter Second legal name'),
                  validator: (value) {
                    if (value == null || value.isEmpty == true) {
                      return "empty last name are not allowed";
                    }
                    return null;
                  },
                  onChanged: checkValidateForTextField,
                ),
                SizedBox(
                  height: resposiveHeight(16),
                ),
                BlocBuilder<ApplyViewModel, ApplyState>(
                  builder: (context, state) {
                    if (state is GetVehiclesLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.primaryColor),
                      );
                    } else if (state is GetVehiclesSuccessState) {
                      return VehicleTypeDropdown(
                        vehicleType: vehicleType,
                        vehicleData: state.data,
                        onVehicleTypeSelected: (String? newValue) {
                          setState(() {
                            vehicleType = newValue;
                            log(vehicleType!);
                          });
                        },
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                SizedBox(
                  height: resposiveHeight(16),
                ),
                TextFormField(
                  autovalidateMode: validateMode,
                  controller: _vehicleNumberController,
                  decoration: InputDecoration(
                      labelText: 'Vehicle Number',
                      hintText: 'Enter Vehicle Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty == true) {
                      return "empty Vehicle Number are not allowed";
                    }
                    return null;
                  },
                  onChanged: checkValidateForTextField,
                ),
                SizedBox(
                  height: resposiveHeight(16),
                ),
                BlocListener<CheckImageWithGeminiViewModel,
                    CheckImageWithGeminiStates>(
                  bloc: widget.checkImageViewModel,
                  listener: (context, state) {
                    if (state is CheckImageLicenseLoadingState) {
                      EasyLoading.showInfo('Check of image is in progress');
                    } else if (state is CheckImageLicenseValidateState) {
                      EasyLoading.dismiss();
                      EasyLoading.showSuccess(state.licenseValidate ?? '');
                      if (state.licenseValidate!.contains('true')) {
                        _licenseImageNameController.text = image1!.path;
                      } else {
                        image1 = null;
                      }
                    } else if (state is CheckImageLicenseErrorState) {
                      EasyLoading.dismiss();
                      EasyLoading.showError(state.error);
                    }
                  },
                  child: InkWell(
                    onTap: () async {
                      if (dropDownValue == null) {
                        EasyLoading.showError("Please select country");
                        return;
                      }
                      image1 = await getImage();
                      widget.checkImageViewModel.analyzeDrivingLicense(
                          image1!, dropDownValue!['name']);
                    },
                    child: TextFormField(
                      enabled: false,
                      autovalidateMode: validateMode,
                      controller: _licenseImageNameController,
                      decoration: InputDecoration(
                          labelText: 'Vehicle license',
                          hintText: 'Upload license photo',
                          suffixIcon: Icon(Icons.upload_outlined)),
                      onChanged: checkValidateForTextField,
                    ),
                  ),
                ),
                SizedBox(
                  height: resposiveHeight(16),
                ),
                TextFormField(
                  autovalidateMode: validateMode,
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Email', hintText: 'Enter your name'),
                  validator: AppValidate.validateEmail,
                  onChanged: checkValidateForTextField,
                ),
                SizedBox(
                  height: resposiveHeight(16),
                ),
                TextFormField(
                  autovalidateMode: validateMode,
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: 'Enter your Phone number'),
                  validator: AppValidate.validatePhoneNumber,
                  onChanged: checkValidateForTextField,
                ),
                SizedBox(
                  height: resposiveHeight(16),
                ),
                TextFormField(
                  autovalidateMode: validateMode,
                  controller: _nationalIdNumberController,
                  decoration: InputDecoration(
                      labelText: 'ID number',
                      hintText: 'Enter national ID number'),
                  validator: (value) {
                    if (value == null || value.isEmpty == true) {
                      return "empty Id number are not allowed";
                    }
                    return null;
                  },
                  onChanged: checkValidateForTextField,
                ),
                SizedBox(
                  height: resposiveHeight(16),
                ),
                BlocListener<CheckImageWithGeminiViewModel,
                    CheckImageWithGeminiStates>(
                  bloc: widget.checkImageViewModel,
                  listener: (context, state) {
                    if (state is CheckImageNationalIdLoadingState) {
                      EasyLoading.showInfo('Check of image is in progress');
                    } else if (state is CheckImageNationalIdValidateState) {
                      EasyLoading.dismiss();
                      EasyLoading.showSuccess(state.nationalIdValidate ?? '');
                      if (state.nationalIdValidate!.contains('true')) {
                        _nationalIdImageNameController.text = image2!.path;
                        _nationalIdNumberController.text =
                            state.nationalId ?? '';
                      } else {
                        image2 = null;
                      }
                    } else if (state is CheckImageNationalIdErrorState) {
                      EasyLoading.dismiss();
                      EasyLoading.showError(state.error);
                    }
                  },
                  child: InkWell(
                    onTap: () async {
                      if (dropDownValue == null) {
                        EasyLoading.showError("Please select country");
                        return;
                      }
                      image2 = await getImage();
                      widget.checkImageViewModel
                          .analyzeNationalId(image2!, dropDownValue!['name']);
                    },
                    child: TextFormField(
                      enabled: false,
                      autovalidateMode: validateMode,
                      controller: _nationalIdNumberController,
                      decoration: InputDecoration(
                        labelText: 'ID image',
                        hintText: 'Upload ID image',
                        suffixIcon: Icon(Icons.upload_outlined),
                      ),
                      // validator: AppValidate.validateMobile,
                      onChanged: checkValidateForTextField,
                    ),
                  ),
                ),
                SizedBox(
                  height: resposiveHeight(16),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        autovalidateMode: validateMode,
                        controller: _passwordController,
                        decoration: InputDecoration(
                            labelText: 'Password', hintText: 'Enter Password'),
                        validator: AppValidate.validatePassword,
                        onChanged: checkValidateForTextField,
                      ),
                    ),
                    SizedBox(
                      width: resposiveWidth(8),
                    ),
                    Expanded(
                      child: TextFormField(
                        autovalidateMode: validateMode,
                        controller: _rePasswordController,
                        decoration: InputDecoration(
                            labelText: 'Confirm Password',
                            hintText: 'Confirm Password'),
                        validator: (value) {
                          if (value! != _passwordController.text) {
                            return 'passwords do not match';
                          }
                          return null;
                        },
                        onChanged: checkValidateForTextField,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: resposiveHeight(8),
                ),
                GenderSelection(
                  selectedGender: selectedGender,
                  onGenderSelected: (value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                ),
                SizedBox(
                  height: resposiveHeight(8),
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: validateMode == AutovalidateMode.disabled
                          ? AppColors.primaryColor
                          : AppColors.greyColor,
                    ),
                    onPressed: () {
                      if ((validateMode == AutovalidateMode.always) &&
                          (dropDownValue == null) &&
                          (selectedGender == null) &&
                          (vehicleType == null)) {
                        null;
                      } else {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            validateMode = AutovalidateMode.disabled;
                          });
                          ApplyRequestModel request = ApplyRequestModel(
                            vehicleType: vehicleType,
                            vehicleNumber: _vehicleNumberController.text,
                            rePassword: _rePasswordController.text,
                            password: _passwordController.text,
                            phone: '+${_phoneNumberController.text}',
                            email: _emailController.text,
                            NIDImg: image2,
                            NID: _nationalIdNumberController.text
                                .padLeft(14, '0'),
                            gender: selectedGender,
                            firstName: _firstLegalNameController.text,
                            lastName: _secondLegalNameController.text,
                            country: dropDownValue!['name'],
                            vehicleLicense: image1,
                          );
                          widget.applyViewModel.apply(request);

                          setState(() {
                            validateMode = AutovalidateMode.always;
                          });
                        } else {
                          setState(() {
                            validateMode = AutovalidateMode.always;
                          });
                        }
                      }
                    },
                    child: Text(
                      'Continue',
                      style: AppTextStyles.inter500_16
                          .copyWith(color: AppColors.whiteColor),
                    )),
                SizedBox(
                  height: resposiveHeight(8),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void checkValidateForTextField(value) {
    if (_formKey.currentState!.validate()) {
      setState(() {
        validateMode = AutovalidateMode.disabled;
      });
    } else {
      setState(() {
        validateMode = AutovalidateMode.always;
      });
    }
  }

  Future<File> getImage() async {
    final ImagePicker _picker = ImagePicker();
// Pick an image
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
//TO convert Xfile into file
    File file = File(image!.path);
//print(‘Image picked’);
    return file;
  }
}
