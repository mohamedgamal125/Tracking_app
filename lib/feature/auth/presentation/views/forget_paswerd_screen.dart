import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import '../../../../core/router/pages_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../core/widgets/custom_validate.dart';
import '../../../../core/di/injectable_initializer.dart';
import '../cubit/forget_password_cubit/forget_password_state.dart';
import '../cubit/forget_password_cubit/forget_password_view_model.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  late ForgetPasswordViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt.get<ForgetPasswordViewModel>();

    viewModel.email.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: viewModel,
      child: Scaffold(
        appBar: AppBar(title: const Text("Password")),
        body: BlocListener<ForgetPasswordViewModel, ForgetPasswordState>(
          listener: (context, state) {
            if (state is LoadingForgetPasswordState) {
              EasyLoading.show();
            } else {
              EasyLoading.dismiss();
              if (state is ErrorForgetPasswordState) {
                DialogUtils.showMessage(
                  context: context,
                  message: state.errorMessage.toString(),
                  title: "Error",
                  postActionName: "Ok",
                );
              } else if (state is SuccessForgetPasswordState) {
                Navigator.pushNamed(
                  context,
                  PagesRoutes.emailVerification,
                  arguments: viewModel.email.text,
                );
              }
            }
          },
          child: Form(
            key: viewModel.formForgetKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
              child: Column(
                children: [
                  SizedBox(height: responsiveHeight(32)),
                  Text("Forget password", style: AppTextStyles.inter500_18),
                  SizedBox(height: responsiveHeight(16)),
                  Text(
                    "Please enter your email associated to\nyour account",
                    textAlign: TextAlign.center,
                    style: AppTextStyles.inter400_14.copyWith(
                      color: AppColors.greyDarkColor,
                    ),
                  ),
                  SizedBox(height: responsiveHeight(24)),
                  TextFormField(
                    controller: viewModel.email,
                    validator: AppValidate.validateEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onTap: () {
                      if (!viewModel.hasInteractedWithEmail) {
                        setState(() {
                          viewModel.hasInteractedWithEmail = true;
                        });
                      }
                    },
                    decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Enter your email",
                      errorStyle: const TextStyle(color: AppColors.errorColor),
                      labelStyle: TextStyle(
                        color: viewModel.hasInteractedWithEmail &&
                            AppValidate.validateEmail(viewModel.email.text) != null
                            ? AppColors.errorColor
                            : AppColors.greyDarkColor,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: viewModel.hasInteractedWithEmail &&
                              AppValidate.validateEmail(viewModel.email.text) != null
                              ? AppColors.errorColor
                              : AppColors.greyDarkColor,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: viewModel.hasInteractedWithEmail &&
                              AppValidate.validateEmail(viewModel.email.text) != null
                              ? AppColors.errorColor
                              : AppColors.greyDarkColor,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: viewModel.hasInteractedWithEmail &&
                              AppValidate.validateEmail(viewModel.email.text) != null
                              ? AppColors.errorColor
                              : AppColors.greyDarkColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: responsiveHeight(40)),
                  ElevatedButton(
                    onPressed: () {
                      viewModel.doIntent(ContinueClickedIntent());
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(responsiveHeight(50)),
                    ),
                    child: Text(
                      "Confirm",
                      style: AppTextStyles.inter500_16
                          .copyWith(color: AppColors.whiteColor),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
