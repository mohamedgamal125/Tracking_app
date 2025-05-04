import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_icons.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import '../../../../core/router/pages_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_dialog.dart';
import '../../../../core/di/injectable_initializer.dart';
import '../cubit/verify_email_cubit/verify_email_state.dart';
import '../cubit/verify_email_cubit/verify_email_vew_model.dart';
import 'widgets/custom_verify_text_field.dart';
import 'widgets/resend_otp_button.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final formKey = GlobalKey<FormState>();
  final codeControllers = List.generate(6, (_) => TextEditingController());
  final focusNodes = List.generate(6, (_) => FocusNode());

  late VerifyEmailViewModel viewModel;
  late String email;

  bool isInvalidCode = false;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<VerifyEmailViewModel>();
  }

  String get _collectedCode => codeControllers.map((e) => e.text).join();

  void _onChanged(String value, int index) {
    setState(() {
      isInvalidCode = false;
    });

    if (value.length == 1 && index < codeControllers.length - 1) {
      FocusScope.of(context).requestFocus(focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(focusNodes[index - 1]);
    }

    final isAllFilled = codeControllers.every((controller) => controller.text.length == 1);
    if (isAllFilled) {
      viewModel.verifyEmail(_collectedCode);
    }
  }


  @override
  void dispose() {
    for (final controller in codeControllers) {
      controller.dispose();
    }
    for (final node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    email = ModalRoute.of(context)!.settings.arguments as String;

    return BlocProvider.value(
      value: viewModel,
      child: Scaffold(
        appBar: AppBar(title: const Text("Password")),
        body: BlocListener<VerifyEmailViewModel, VerifyEmailState>(
          listener: (context, state) {
            EasyLoading.dismiss();
            if (state is LoadingVerifyEmailState || state is LoadingResendEmailState) {
              EasyLoading.show();
            } else if (state is SuccessVerifyEmailState) {
              Navigator.pushNamed(context, PagesRoutes.resetPassword, arguments: email);
            } else if (state is ErrorVerifyEmailState) {
              setState(() {
                isInvalidCode = true;
              });
              DialogUtils.showMessage(
                context: context,
                title: "Error",
                message: "Invalid code",
                postActionName: "OK",
              );
            } else if (state is ErrorResendEmailState) {
              DialogUtils.showMessage(
                context: context,
                title: "Error",
                message: state.toString(),
                postActionName: "OK",
              );
            }
          },
          child: Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: responsiveWidth(16),
                vertical: responsiveHeight(16),
              ),
              child: Column(
                children: [
                  SizedBox(height: responsiveHeight(20)),
                  const Text("Email verification", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  const Text("Please enter your code that send to your email address"),
                  SizedBox(height: responsiveHeight(16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(codeControllers.length, (index) {
                      return CustomVerifyTextField(
                        controller: codeControllers[index],
                        focusNode: focusNodes[index],
                        onChanged: (value) => _onChanged(value, index),
                        isError: isInvalidCode,
                      );
                    }),
                  ),
                  if (isInvalidCode) ...[
                    SizedBox(height: responsiveHeight(8)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:  [
                        Icon(AppIcons.error, color: AppColors.errorColor, size: 16),
                        SizedBox(width: responsiveWidth(4)),
                        Text("Invalid code", style:AppTextStyles.inter500_13.copyWith(color: AppColors.errorColor)),
                      ],
                    ),
                  ],
                  SizedBox(height: responsiveHeight(16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Didn't receive code? "),
                      ResendOTPButton(
                        onResend: () => viewModel.resendCode(),
                      ),
                    ],
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
