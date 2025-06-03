import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import 'package:tracking_app/feature/orders/domain/entity/order_entity.dart';

import '../../../../core/common/get_responsive_height_and_width.dart';
import '../../../../core/utils/app_assets.dart';

class StatusWidget extends StatelessWidget {
  const StatusWidget(
      {super.key, required this.statusEntity});

  final StatusEntity statusEntity;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Row(
        children: [
          statusEntity.flag
              ? SvgPicture.asset(
                  SvgImages.DoneIcon,
                  height: responsiveHeight(20),
                  width: responsiveWidth(20),
                )
              : SvgPicture.asset(
                  SvgImages.errorIcon,
                  height: responsiveHeight(25),
                  width: responsiveWidth(25),
                ),
          SizedBox(width: responsiveWidth(4)),
          Text(
            statusEntity.txt,
            style: AppTextStyles.inter500_16.copyWith(color: statusEntity.color),
          )
        ],
      ),
    );
  }
}
