import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_icons.dart';

import '../../../../core/router/pages_routes.dart';
import '../../../../core/services/shared_preference_services.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/constant_manager.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../core/widgets/custom_validate.dart';
import '../cubit/change_password_cubit/change_password_state.dart';
import '../cubit/change_password_cubit/change_password_view-model.dart';


class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var viewModel = BlocProvider.of<ChangePasswordViewModel>(context);
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
                onTap: () {
                  Navigator.pop(context);
                },
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
            }
            if (state is ChangePasswordSuccessState) {
              EasyLoading.dismiss();
              EasyLoading.showSuccess("Password changed successfully");
              SharedPreferenceServices.deleteData(AppConstants.token);
              Navigator.pushNamedAndRemoveUntil(
                context,
                PagesRoutes.signIn,
                (route) => false,
              );
            }
            if (state is ChangePasswordLoadingState) {
              EasyLoading.show();
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
              child: Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    SizedBox(height: responsiveHeight(32)),
                    TextFormField(
                      validator: AppValidate.validatePassword,
                      obscuringCharacter: "*",
                      obscureText: true,
                      controller: viewModel.currentPasswordController,
                      decoration: InputDecoration(
                        hintText: "Current password",
                        label: Text("Current password"),
                      ),
                    ),
                    SizedBox(height: responsiveHeight(24)),
                    TextFormField(
                      obscuringCharacter: "*",
                      obscureText: true,
                      controller: viewModel.newPasswordController,
                      validator: AppValidate.validatePassword,
                      decoration: InputDecoration(
                        hintText: "New password",
                        label: Text("New password"),
                      ),
                    ),
                    SizedBox(height: responsiveHeight(24)),
                    TextFormField(
                      obscuringCharacter: "*",
                      obscureText: true,
                      validator: viewModel.confirmPasswordValidator,
                      controller: viewModel.confirmPasswordController,
                      decoration: InputDecoration(
                        hintText: "Confirm password",
                        label: Text("Confirm password"),
                      ),
                    ),
                    SizedBox(height: responsiveHeight(84)),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.greyColor,
                        elevation: 0,
                      ),
                      onPressed: () {
                        if (BlocProvider.of<ChangePasswordViewModel>(
                          context,
                        ).formKey.currentState!.validate()) {
                          viewModel.doIntent(ClickedChangePasswordIntent());
                        }
                      },
                      child: Text(
                        "update",
                        style: AppTextStyles.roboto500_16.copyWith(
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
