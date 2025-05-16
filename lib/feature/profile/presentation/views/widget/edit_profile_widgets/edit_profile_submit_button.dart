import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import 'package:tracking_app/layout/presentation/views/layout_screen.dart';

import '../../../cubit/edit_profile_cubit/edit_profile_state.dart';
import '../../../cubit/edit_profile_cubit/edit_profile_view_model.dart';

class EditProfileSubmitButton extends StatelessWidget {
  final AutovalidateMode validateMode;
  final GlobalKey<FormState> formKey;
  final ValueChanged<AutovalidateMode> onValidateModeChanged;
  final EditProfileViewModel editProfileViewModel;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  const EditProfileSubmitButton({
    Key? key,
    required this.validateMode,
    required this.formKey,
    required this.onValidateModeChanged,
    required this.editProfileViewModel,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileViewModel, EditProfileState>(
      bloc: editProfileViewModel,
      listener: (context, state) async {
        switch (state) {
          case EditProfileLoadingState():
            log('loading');
          case EditProfileSuccessState():
            log('success');
            EasyLoading.showSuccess("Profile Edit successfully");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LayoutScreen(initialIndex: 2),
              ),
            );
          case EditProfileErrorState():
            log('error');
            EasyLoading.showError(state.message);
          default:
        }
      },
      builder: (context, state) {
        if (state is EditProfileLoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        } else {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
              validateMode == AutovalidateMode.disabled
                  ? AppColors.primaryColor
                  : AppColors.greyColor,
            ),
            onPressed: () {
              if (validateMode == AutovalidateMode.always) return;

              if (formKey.currentState!.validate()) {
                onValidateModeChanged(AutovalidateMode.disabled);

                editProfileViewModel.editProfile({
                  'firstName': firstName,
                  'lastName': lastName,
                  'email': email,
                  'phone': phone,
                });

                onValidateModeChanged(AutovalidateMode.always);
              } else {
                onValidateModeChanged(AutovalidateMode.always);
              }
            },
            child: Text(
              'update',
              style: AppTextStyles.roboto500_16.copyWith(
                color: AppColors.whiteColor,
              ),
            ),
          );
        }
      },
    );
  }
}
