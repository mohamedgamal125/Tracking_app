import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/constans.dart';
import 'package:tracking_app/core/utils/text_styles.dart';

class GenderSelection extends StatelessWidget {
  final String? selectedGender;
  final Function(String?) onGenderSelected;

  const GenderSelection({
    Key? key,
    required this.selectedGender,
    required this.onGenderSelected,
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
          onChanged: onGenderSelected,
        ),
        Text("Female", style: AppTextStyles.inter400_14),
        Radio<String>(
          value: 'male',
          activeColor: AppColors.primaryColor,
          groupValue: selectedGender,
          onChanged: onGenderSelected,
        ),
        Text("Male", style: AppTextStyles.inter400_14),
      ],
    );
  }
}
