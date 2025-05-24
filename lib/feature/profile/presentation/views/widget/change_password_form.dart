import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/get_responsive_height_and_width.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../core/widgets/custom_validate.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/change_password_cubit/change_password_view-model.dart';

class ChangePasswordForm extends StatelessWidget {
  final bool currentTouched;
  final bool newTouched;
  final bool confirmTouched;
  final Color buttonColor;

  const ChangePasswordForm({
    super.key,
    required this.currentTouched,
    required this.newTouched,
    required this.confirmTouched,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<ChangePasswordViewModel>();
    var tr = S.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
      child: Form(
        key: viewModel.formKey,
        child: Column(
          children: [
            SizedBox(height: responsiveHeight(32)),
            _buildPasswordField(
              controller: viewModel.currentPasswordController,
              hint: tr.currentPassword,
              label: tr.currentPassword,
              touched: currentTouched,
              validator: AppValidate.validatePassword,
            ),
            SizedBox(height: responsiveHeight(24)),
            _buildPasswordField(
              controller: viewModel.newPasswordController,
              hint: tr.newPassword,
              label: tr.newPassword,
              touched: newTouched,
              validator: AppValidate.validatePassword,
            ),
            SizedBox(height: responsiveHeight(24)),
            _buildPasswordField(
              controller: viewModel.confirmPasswordController,
              hint: tr.confirmPassword,
              label: tr.confirmPassword,
              touched: confirmTouched,
              validator: viewModel.confirmPasswordValidator,
            ),
            SizedBox(height: responsiveHeight(84)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                elevation: 0,
              ),
              onPressed: () {
                if (viewModel.formKey.currentState!.validate()) {
                  viewModel.doIntent(ClickedChangePasswordIntent());
                }
              },
              child: Text(
                tr.update,
                style: AppTextStyles.roboto500_16.copyWith(
                  color: AppColors.whiteColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hint,
    required String label,
    required bool touched,
    required String? Function(String?) validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: true,
      autovalidateMode:
      touched ? AutovalidateMode.always : AutovalidateMode.disabled,
      decoration: InputDecoration(
        hintText: hint,
        label: Text(label),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.errorColor, width: 2),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.errorColor, width: 2),
        ),
      ),
    );
  }
}
