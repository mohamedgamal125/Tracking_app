import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import 'package:tracking_app/feature/profile/presentation/cubit/edite_vehicle_cubit/edit_vehicle_view_model.dart';
import 'package:tracking_app/feature/profile/presentation/cubit/edite_vehicle_cubit/edit_vehivle_state.dart';
import 'package:tracking_app/layout/presentation/views/layout_screen.dart';

import '../../../../../../generated/l10n.dart';
import '../../../cubit/edit_profile_cubit/edit_profile_state.dart';
import '../../../cubit/edit_profile_cubit/edit_profile_view_model.dart';

class EditVehicleButton extends StatelessWidget {
  final AutovalidateMode validateMode;
  final GlobalKey<FormState> formKey;
  final ValueChanged<AutovalidateMode> onValidateModeChanged;
  final EditVehicleViewModel editVehicleViewModel;
  final String? name;

  final File? image;

  const EditVehicleButton(
      {Key? key,
      required this.validateMode,
      required this.formKey,
      required this.onValidateModeChanged,
      required this.editVehicleViewModel,
      required this.name,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditVehicleViewModel, EditVehicleState>(
      bloc: editVehicleViewModel,
      listener: (context, state) async {
        switch (state) {
          case EditVehicleLoadingState():
          case EditVehicleSuccessState():
            EasyLoading.showSuccess("Profile Edit successfully");
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LayoutScreen(initialIndex: 2),
              ),
            );
          case EditVehicleErrorState():
            EasyLoading.showError(state.message);
          default:
        }
      },
      builder: (context, state) {
        if (state is EditVehicleLoadingState) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          );
        } else {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: validateMode == AutovalidateMode.disabled
                  ? AppColors.primaryColor
                  : AppColors.greyColor,
            ),
            onPressed: () {
              if (validateMode == AutovalidateMode.always) return;
              if (formKey.currentState!.validate()) {
                onValidateModeChanged(AutovalidateMode.disabled);

                editVehicleViewModel.editVehicle({
                  'name': name,
                  'image': image,
                });

                onValidateModeChanged(AutovalidateMode.always);
              } else {
                onValidateModeChanged(AutovalidateMode.always);
              }
            },
            child: Text(
              S.of(context).update,
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
