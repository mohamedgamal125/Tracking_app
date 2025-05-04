import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/get_resposive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/text_styles.dart';

class WelcomeMessage extends StatelessWidget {
  const WelcomeMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: resposiveHeight(8),
        ),
        Text(
          'Welcome!!',
          style: AppTextStyles.inter500_20,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          'You want to be a delivery man? Join our team',
          style: AppTextStyles.inter500_16.copyWith(color: AppColors.greyColor),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
