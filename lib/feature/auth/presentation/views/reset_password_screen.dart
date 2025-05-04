import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/widgets/custom_validate.dart';

import '../../../../../../core/di/injectable_initializer.dart';
import '../../../../../../core/router/pages_routes.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/common/get_responsive_height_and_width.dart';
import '../cubit/reset_password_cubit/reset_password_state.dart';
import '../cubit/reset_password_cubit/reset_password_view_model.dart';


class ResetPasswordScreen extends StatefulWidget {
  late String email;

  ResetPasswordScreen({super.key});
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();
  AutovalidateMode validateMode = AutovalidateMode.disabled;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    widget.email = ModalRoute.of(context)!.settings.arguments as String;

    debugPrint("the email is ${widget.email}");
    return BlocProvider(
      create: (context) => getIt<ResetPasswordViewModel>(),
      child: BlocListener<ResetPasswordViewModel, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error), backgroundColor: AppColors.errorColor,)
            );
          } else if (state is ResetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.response.message!),
                backgroundColor: AppColors.greenColor,
              ),
            );
            Navigator.pushReplacementNamed(context, PagesRoutes.onBoarding);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: buildCustomAppBar(
            isVisible: false,
            context: context,
            title: "Password",
          ),

          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsiveWidth(16),
              vertical: responsiveHeight(24),
            ),

            child: Form(
              autovalidateMode: validateMode,
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Reset password',
                        maxLines: 1,
                        style: AppTextStyles.inter500_18.copyWith(
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(height: responsiveHeight(16)),
                      Text(
                        'Password must not be empty and must contain 6 characters with upper case letter and one number at least ',
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.inter400_14.copyWith(
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),
                  buildFormFields(),
                  buildSubmitButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFormFields() {
    return Padding(
      padding:  EdgeInsets.only(top: responsiveHeight(18)),
      child: Column(
        children: [
          TextFormField(
            autovalidateMode: validateMode,
            validator: AppValidate.validatePassword,
            onChanged: (value) {
              if (formKey.currentState!.validate()) {
                setState(() {
                  validateMode = AutovalidateMode.disabled;
                });
              } else {
                setState(() {
                  validateMode = AutovalidateMode.always;
                });
              }
            },
            controller: passwordController,
            decoration: const InputDecoration(
              labelText: 'New Password',
              hintText: 'Enter your Password',
            ),
          ),
          SizedBox(height: responsiveHeight(16)),
          TextFormField(
            autovalidateMode: validateMode,
            validator: (value) {
              if (value! != passwordController.text) {
                return 'passwords do not match';
              }
              return null;
            },
            onChanged: (value) {
              if (formKey.currentState!.validate()) {
                setState(() {
                  validateMode = AutovalidateMode.disabled;
                });
              } else {
                setState(() {
                  validateMode = AutovalidateMode.always;
                });
              }
            },
            controller: confirmPasswordController,
            decoration: const InputDecoration(
              labelText: 'Confirm Password',
              hintText: 'Confirm Password',
            ),
          ),
          SizedBox(height: responsiveHeight(30)),
        ],
      ),
    );
  }

  Widget buildSubmitButton() {
    return BlocBuilder<ResetPasswordViewModel, ResetPasswordState>(
      builder: (context, state) {
        if (state is ResetPasswordLoading) {
          return Center(
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
              if (validateMode == AutovalidateMode.always) {
                null;
              } else {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    validateMode = AutovalidateMode.disabled;
                  });

                  context.read<ResetPasswordViewModel>().resetPassword(
                    widget.email.trim(),
                    confirmPasswordController.text.trim(),
                  );
                } else {
                  setState(() {
                    validateMode = AutovalidateMode.always;
                  });
                }
              }
            },
            child: Text(
              'Continue',
              style: AppTextStyles.roboto500_16.copyWith(color: AppColors.whiteColor),
            ),
          );
        }
      },
    );
  }
}
