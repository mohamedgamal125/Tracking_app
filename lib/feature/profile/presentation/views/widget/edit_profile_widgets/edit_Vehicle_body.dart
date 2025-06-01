import 'dart:developer';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../apply/presentation/cubits/apply_view_model/apply_states.dart';
import '../../../../../apply/presentation/cubits/apply_view_model/apply_view_model.dart';
import '../../../../../apply/presentation/cubits/check_image_with_gemini_view_model/check_image_with_gemini_states.dart';
import '../../../../../apply/presentation/cubits/check_image_with_gemini_view_model/check_image_with_gemini_view_model.dart';
import '../../../../../apply/presentation/view/widgets/vehicle_type_drop_down_widget.dart';
import '../../../../domain/entity/profile_response_entity.dart';
import '../../../cubit/edite_vehicle_cubit/edit_vehicle_view_model.dart';

class EditVehicleBody extends StatefulWidget {
  const EditVehicleBody({
    super.key,
    required this.editVehicleViewModel,
    required this.userData,
    required this.applyViewModel,
    required this.checkImageViewModel,
  });
  final CheckImageWithGeminiViewModel checkImageViewModel;
  final ApplyViewModel applyViewModel;
  final EditVehicleViewModel editVehicleViewModel;
  final DriverEntity userData;

  @override
  State<EditVehicleBody> createState() => _EditVehicleBodyState();
}

class _EditVehicleBodyState extends State<EditVehicleBody> {
  final TextEditingController _licenseImageNameController =
      TextEditingController();
  // final TextEditingController _vehicleNumberController =
  //     TextEditingController();
  String? vehicleType;
  AutovalidateMode validateMode = AutovalidateMode.always;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//  Map<String, dynamic>? dropDownValue;

  File? image1;
  @override
  void initState() {
    super.initState();
    //  vehicleType = widget.userData.vehicleType;
    widget.applyViewModel.getAllVehicles();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(24)),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: validateMode,
          child: Column(
            children: [
              SizedBox(height: responsiveHeight(24)),
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
                      //  hint: widget.userData.,
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
              SizedBox(height: responsiveHeight(12)),
              // TextFormField(
              //   autovalidateMode: validateMode,
              //   controller: _vehicleNumberController,
              //   decoration: InputDecoration(
              //       labelText: 'Vehicle Number',
              //       hintText: widget.userData.vehicleNumber),
              //   validator: (value) {
              //     if (value == null || value.isEmpty == true) {
              //       return "empty Vehicle Number are not allowed";
              //     }
              //     return null;
              //   },
              //   // onChanged: checkValidateForTextField,
              // ),
              // SizedBox(height: responsiveHeight(12)),
              BlocListener<CheckImageWithGeminiViewModel,
                  CheckImageWithGeminiStates>(
                bloc: widget.checkImageViewModel,
                listener: (context, state) {
                  if (state is CheckImageLicenseLoadingState) {
                    EasyLoading.show(status: 'Check of image is in progress');
                  } else if (state is CheckImageLicenseValidateState) {
                    EasyLoading.dismiss();
                    EasyLoading.showInfo(state.licenseValidate ?? '');
                    if (state.licenseValidate!.contains('true')) {
                      _licenseImageNameController.text = image1!.path;
                      log(_licenseImageNameController.text);
                    } else {
                      image1 = null;

                      // _licenseImageNameController.text = '';

                      return;
                    }
                  } else if (state is CheckImageLicenseErrorState) {
                    EasyLoading.dismiss();
                    EasyLoading.showError(state.error);
                  }
                },
                child: InkWell(
                  onTap: () async {
                    image1 = await getImage();
                    final sizeInMB = await image1!.length() / (1024 * 1024);
                    if (sizeInMB > 1) {
                      EasyLoading.showError(
                          'Image too large. Please select an image under 1MB.');
                      log(' large image');
                      return;
                    } else {
                      // widget.checkImageViewModel.analyzeDrivingLicense(
                      //     image1!, dropDownValue!['name']);
                      log('done image');
                    }
                  },
                  child: TextFormField(
                    enabled: false,
                    autovalidateMode: validateMode,
                    //  controller: _licenseImageNameController,
                    decoration: InputDecoration(
                        labelText: 'Vehicle license',
                        hintText: 'Upload license photo',
                        suffixIcon: Icon(Icons.upload_outlined)),
                    onChanged: checkValidateForTextField,
                  ),
                ),
              ),
              SizedBox(height: responsiveHeight(36)),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor
                      // validateMode == AutovalidateMode.disabled
                      //     ? AppColors.primaryColor
                      //     : AppColors.greyColor,
                      ),
                  onPressed: () {
                    if (vehicleType == null) {
                      EasyLoading.showError('Please select vehicle type');
                      return;
                    }

                    if (image1 == null) {
                      EasyLoading.showError('Please upload license image');
                      return;
                    }

                    if (_formKey.currentState!.validate()) {
                      setState(() {
                        validateMode = AutovalidateMode.disabled;
                      });

                      Map<String, dynamic> data = {
                        'name': vehicleType,
                        'image': image1,
                      };

                      widget.editVehicleViewModel.editVehicle(data);
                      log(data['name']);
                      setState(() {
                        validateMode = AutovalidateMode.always;
                      });
                    } else {
                      setState(() {
                        validateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  child: Text(
                    'Continue',
                    style: AppTextStyles.inter500_16
                        .copyWith(color: AppColors.whiteColor),
                  )),
            ],
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
