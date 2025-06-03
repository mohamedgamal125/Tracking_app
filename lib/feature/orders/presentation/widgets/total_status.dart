import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import 'package:tracking_app/feature/orders/presentation/widgets/status_widget.dart';

import '../../../../core/common/get_responsive_height_and_width.dart';

class TotalStatus extends StatelessWidget {
  const TotalStatus({super.key, required this.total, required this.statusWidget});

  final int total;
  final StatusWidget statusWidget;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(

          width: responsiveWidth(155),
          height:responsiveHeight(75) ,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: AppColors.lightPinkColor
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(total.toString(),style: AppTextStyles.roboto500_18,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: statusWidget,
              ),
            ],
          ),
          
        ),
      ],
    );
  }
}
