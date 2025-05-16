import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tracking_app/core/utils/app_icons.dart';
import 'package:tracking_app/feature/profile/presentation/views/widget/change_password_form.dart';

import '../../../../core/router/pages_routes.dart';
import '../../../../core/services/shared_preference_services.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constant_manager.dart';
import '../../../../core/utils/text_styles.dart';
import '../cubit/change_password_cubit/change_password_state.dart';
import '../cubit/change_password_cubit/change_password_view-model.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  Color buttonColor = AppColors.greyColor;
  bool _currentTouched = false;
  bool _newTouched = false;
  bool _confirmTouched = false;
  late final ChangePasswordViewModel _viewModel;

  @override
  void initState() {
    _viewModel = context.read<ChangePasswordViewModel>();

    _viewModel.currentPasswordController.addListener(() {
      if (!_currentTouched && _viewModel.currentPasswordController.text.isNotEmpty) {
        setState(() => _currentTouched = true);
      }
      checkValidation();
    });

    _viewModel.newPasswordController.addListener(() {
      if (!_newTouched && _viewModel.newPasswordController.text.isNotEmpty) {
        setState(() => _newTouched = true);
      }
      checkValidation();
    });

    _viewModel.confirmPasswordController.addListener(() {
      if (!_confirmTouched && _viewModel.confirmPasswordController.text.isNotEmpty) {
        setState(() => _confirmTouched = true);
      }
      checkValidation();
    });

    super.initState();
  }

  void checkValidation() {
    final isCurrentValid = _viewModel.currentPasswordController.text.length >= 6;
    final isNewValid = _viewModel.newPasswordController.text.length >= 6;
    final isConfirmValid = _viewModel.newPasswordController.text == _viewModel.confirmPasswordController.text;

    setState(() {
      buttonColor = (isCurrentValid && isNewValid && isConfirmValid)
          ? AppColors.primaryColor
          : AppColors.greyColor;
    });
  }

  @override
  void dispose() {
    _viewModel.currentPasswordController.removeListener(checkValidation);
    _viewModel.newPasswordController.removeListener(checkValidation);
    _viewModel.confirmPasswordController.removeListener(checkValidation);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.whiteColor,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Icon(AppIcons.back),
              ),
              Text("Reset password", style: AppTextStyles.inter700_20),
            ],
          ),
        ),
        body: BlocConsumer<ChangePasswordViewModel, ChangePasswordState>(
          listener: (context, state) {
            if (state is ChangePasswordErrorState) {
              EasyLoading.dismiss();
              EasyLoading.showError(state.errorMessage);
            } else if (state is ChangePasswordSuccessState) {
              EasyLoading.dismiss();
              EasyLoading.showSuccess("Password changed successfully");
              SharedPreferenceServices.deleteData(AppConstants.token);
              Navigator.pushNamedAndRemoveUntil(
                context,
                PagesRoutes.signIn,
                    (route) => false,
              );
            } else if (state is ChangePasswordLoadingState) {
              EasyLoading.show();
            }
          },
          builder: (context, state) {
            return ChangePasswordForm(
              currentTouched: _currentTouched,
              newTouched: _newTouched,
              confirmTouched: _confirmTouched,
              buttonColor: buttonColor,
            );
          },
        ),
      ),
    );
  }
}
