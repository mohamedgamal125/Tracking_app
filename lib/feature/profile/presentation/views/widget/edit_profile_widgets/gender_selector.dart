import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import 'package:tracking_app/core/utils/constants.dart';

import '../../../../../../generated/l10n.dart';

class EditProfileGenderSelector extends StatelessWidget {
  final String selectedGender;
  final ValueChanged<String> onGenderChanged;

  const EditProfileGenderSelector({
    super.key,
    required this.selectedGender,
    required this.onGenderChanged,
  });

  @override
  Widget build(BuildContext context) {
    var tr = S.of(context);
    return Row(
      children: [
        Text(tr.gender, style: AppTextStyles.inter500_18),
        SizedBox(width: kHorizontalPadding),
        Radio<String>(
          value: 'female',
          activeColor: AppColors.primaryColor,
          groupValue: selectedGender,
          onChanged: (value) {
            if (value != null) onGenderChanged(value);
          },
        ),
        Text(tr.female, style: AppTextStyles.inter400_14),
        Radio<String>(
          value: 'male',
          activeColor: AppColors.primaryColor,
          groupValue: selectedGender,
          onChanged: (value) {
            if (value != null) onGenderChanged(value);
          },
        ),
        Text(tr.male, style: AppTextStyles.inter400_14),
      ],
    );
  }
}
