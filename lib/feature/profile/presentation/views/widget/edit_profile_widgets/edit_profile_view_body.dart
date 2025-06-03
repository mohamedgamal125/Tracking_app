import 'dart:io';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:flutter/material.dart';
import '../../../../domain/entity/profile_response_entity.dart';
import '../../../cubit/edit_profile_cubit/edit_profile_view_model.dart';
import '../../../cubit/upload_photo_cubit/upload_photo_view_model.dart';

import 'edit_profile_image_section.dart';
import 'edit_profile_submit_button.dart';
import 'edit_profile_text_fields.dart';
import 'gender_selector.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({
    super.key,
    required this.editProfileViewModel,
    required this.uploadPhotoViewModel,
    required this.userData,
  });

  final EditProfileViewModel editProfileViewModel;
  final UploadPhotoViewModel uploadPhotoViewModel;
  final DriverEntity userData;

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  late final TextEditingController _firstNameController =
      TextEditingController(text: widget.userData.firstName);
  late final TextEditingController _lastNameController =
      TextEditingController(text: widget.userData.lastName);
  late final TextEditingController _emailController =
      TextEditingController(text: widget.userData.email);
  late final TextEditingController _phoneController =
      TextEditingController(text: widget.userData.phone);
  final TextEditingController _passwordController =
      TextEditingController(text: '123456');

  AutovalidateMode validateMode = AutovalidateMode.always;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? selectedGender;
  File? imageFile;

  @override
  void initState() {
    // selectedGender = widget.userData.gender!;
    super.initState();
    if (widget.userData.gender == 'male' || widget.userData.gender == 'female') {
      selectedGender = widget.userData.gender;
    } else {
      selectedGender = 'male';
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(24)),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: validateMode,
          child: Column(
            children: [
              SizedBox(height: responsiveHeight(24)),
              EditProfileImageSection(
                userData: widget.userData,
                imageFile: imageFile,
                uploadPhotoViewModel: widget.uploadPhotoViewModel,
                onImageSelected: (file) => setState(() => imageFile = file),
              ),
              SizedBox(height: responsiveHeight(24)),
              EditProfileTextFields(
                firstNameController: _firstNameController,
                lastNameController: _lastNameController,
                emailController: _emailController,
                phoneController: _phoneController,
                passwordController: _passwordController,
                validateMode: validateMode,
                onChanged: checkValidateForTextField,
              ),
              SizedBox(height: responsiveHeight(24)),
              EditProfileGenderSelector(
                // selectedGender: selectedGender!,
                selectedGender: selectedGender ?? 'male',
                onGenderChanged: (value) => setState(() => selectedGender = value),
              ),
              SizedBox(height: responsiveHeight(24)),
              EditProfileSubmitButton(
                validateMode: validateMode,
                formKey: formKey,
                onValidateModeChanged: (mode) =>
                    setState(() => validateMode = mode),
                editProfileViewModel: widget.editProfileViewModel,
                firstName: _firstNameController.text,
                lastName: _lastNameController.text,
                email: _emailController.text,
                phone: _phoneController.text,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void checkValidateForTextField() {
    setState(() {
      validateMode = formKey.currentState!.validate()
          ? AutovalidateMode.disabled
          : AutovalidateMode.always;
    });
  }
}
