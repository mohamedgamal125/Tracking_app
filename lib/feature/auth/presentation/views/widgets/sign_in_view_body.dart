import 'dart:developer';

import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/app_icons.dart';
import 'package:tracking_app/core/utils/constant_manager.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import 'package:tracking_app/core/widgets/custom_validate.dart';
import 'package:tracking_app/feature/auth/presentation/views/widgets/remember_me_widget.dart';
import 'package:tracking_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../../core/router/pages_routes.dart';
import '../../../../../core/services/shared_preference_services.dart';
import '../../../domain/entity/sign_in_request.dart';
import '../../cubit/sign_in_cubit/sign_in_state.dart';
import '../../cubit/sign_in_cubit/sign_in_view_model.dart';

class SignInViewBody extends StatefulWidget {
  final SignInViewModel signInViewModel;

  const SignInViewBody({required this.signInViewModel, super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode validateMode = AutovalidateMode.disabled;
  bool rememberMe = false;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInViewModel, SignInState>(
      bloc: widget.signInViewModel,
      listener: (context, state) {
        switch (state) {
          case SignInLoadingState():
            EasyLoading.show();
          case SignInSuccessState():
            _saveToken(state);
            EasyLoading.dismiss();
            Navigator.pushReplacementNamed(context, PagesRoutes.onBoarding);
          case SignInErrorState():
            EasyLoading.dismiss();
            EasyLoading.showError(state.message);
          default:
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: responsiveWidth(16),
            vertical: responsiveHeight(32),
          ),
          child: Form(
            autovalidateMode: validateMode,
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  autovalidateMode: validateMode,
                  validator: AppValidate.validateEmail,
                  onChanged: onChange,
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: S.of(context).email,
                    hintText: S.of(context).enterYourPassword,
                  ),
                ),
                SizedBox(height: responsiveHeight(20)),
                TextFormField(
                  autovalidateMode: validateMode,
                  obscureText: !isPasswordVisible,
                  obscuringCharacter: '*',
                  enableSuggestions: false,
                  autocorrect: false,
                  validator: AppValidate.validatePassword,
                  onChanged: onChange,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: S.of(context).password,
                    hintText: S.of(context).enterYourPassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible ? AppIcons.passwordVisibility : AppIcons.passwordVisibilityOff,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: responsiveHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RememberMeWidget(
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value!;
                        });
                      },
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          PagesRoutes.forgetPassword,
                        );
                      },
                      child: Text(
                        S.of(context).forgetPassword,
                        style: AppTextStyles.inter400_12.copyWith(
                          color: AppColors.blackColor,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.blackColor,

                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: responsiveHeight(20)),
          Spacer(),
                ElevatedButton(
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
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          validateMode = AutovalidateMode.disabled;
                        });
                        var data = SignInRequest(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                        widget.signInViewModel.signIn(data);
                      } else {
                        setState(() {
                          validateMode = AutovalidateMode.always;
                        });
                      }
                    }
                  },
                  child: Text(
                    S.of(context).confirm,
                    style: AppTextStyles.inter500_16.copyWith(
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                Spacer(),
                // SizedBox(height: responsiveHeight(16)),
              ],
            ),
          ),
        );
      },
    );
  }

  void onChange(value) {
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

  void _saveToken(SignInSuccessState state) async {
    await SharedPreferenceServices.saveData(
      AppConstants.token,
      state.data.token,
    );
    await SharedPreferenceServices.saveData(
      AppConstants.rememberMe,
      rememberMe ? true : false,
    );
    log(SharedPreferenceServices.getData(AppConstants.token).toString());
    log(SharedPreferenceServices.getData(AppConstants.rememberMe).toString());
  }
}
