import 'package:flutter/material.dart';
import 'package:tracking_app/core/router/pages_routes.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/extensions.dart';
import 'package:tracking_app/core/widgets/custom_validate.dart';
import '../../../../../../core/common/get_responsive_height_and_width.dart';
import '../../../../../../generated/l10n.dart';

class EditProfileTextFields extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;
  final AutovalidateMode validateMode;
  final VoidCallback onChanged;

  const EditProfileTextFields({
    super.key,
    required this.firstNameController,
    required this.lastNameController,
    required this.emailController,
    required this.phoneController,
    required this.passwordController,
    required this.validateMode,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                autovalidateMode: validateMode,
                controller: firstNameController,
                decoration: InputDecoration(labelText: tr.firstName),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "First name can't be empty";
                  }
                  return null;
                },
                onChanged: (_) => onChanged(),
              ),
            ),
            SizedBox(width: responsiveWidth(16)),
            Expanded(
              child: TextFormField(
                autovalidateMode: validateMode,
                controller: lastNameController,
                decoration: InputDecoration(labelText:tr.lastName),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Last name can't be empty";
                  }
                  return null;
                },
                onChanged: (_) => onChanged(),
              ),
            ),
          ],
        ),
        SizedBox(height: responsiveHeight(24)),
        TextFormField(
          autovalidateMode: validateMode,
          controller: emailController,
          decoration: InputDecoration(labelText: tr.email),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return tr.emailRequired;
            }
            if (!value.isValidEmail) {
              return tr.emailInvalid;
            }
            return null;
          },
          onChanged: (_) => onChanged(),
        ),
        SizedBox(height: responsiveHeight(24)),
        TextFormField(
          autovalidateMode: validateMode,
          controller: phoneController,
          decoration: InputDecoration(labelText: tr.phoneNumber),
          validator: AppValidate.validateMobile,
          onChanged: (_) => onChanged(),
        ),
        SizedBox(height: responsiveHeight(24)),
        TextFormField(
          controller: passwordController,
          readOnly: true,
          obscureText: true,
          obscuringCharacter: '★',
          decoration: InputDecoration(
            labelText: tr.password,
            suffixIcon:
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, PagesRoutes.changePassword);
              },
              child: Text(
                tr.change,
                style: TextStyle(
                  decoration: TextDecoration.none,
                    color: AppColors.blackColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
