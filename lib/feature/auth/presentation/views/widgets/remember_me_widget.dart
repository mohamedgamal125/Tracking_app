import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/text_styles.dart';
import '../../../../../generated/l10n.dart';

class RememberMeWidget extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;

  const RememberMeWidget({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          checkColor: AppColors.whiteColor,
          activeColor: AppColors.primaryColor,
          value: value,
          onChanged: onChanged,
        ),
        SizedBox(width: responsiveWidth(1)),
        Text(S.of(context).rememberMe, style: AppTextStyles.inter400_14),
      ],
    );
  }
}
