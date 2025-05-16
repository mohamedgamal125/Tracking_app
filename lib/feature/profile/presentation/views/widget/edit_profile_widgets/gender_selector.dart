import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import 'package:tracking_app/core/utils/constants.dart';

class EditProfileGenderSelector extends StatelessWidget {
  final String selectedGender;
  final ValueChanged<String> onGenderChanged;

  const EditProfileGenderSelector({
    Key? key,
    required this.selectedGender,
    required this.onGenderChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text("Gender", style: AppTextStyles.inter500_18),
        SizedBox(width: kHorizontalPadding),
        Radio<String>(
          value: 'female',
          activeColor: AppColors.primaryColor,
          groupValue: selectedGender,
          onChanged: (value) {
            if (value != null) onGenderChanged(value);
          },
        ),
        Text("Female", style: AppTextStyles.inter400_14),
        Radio<String>(
          value: 'male',
          activeColor: AppColors.primaryColor,
          groupValue: selectedGender,
          onChanged: (value) {
            if (value != null) onGenderChanged(value);
          },
        ),
        Text("Male", style: AppTextStyles.inter400_14),
      ],
    );
  }
}
