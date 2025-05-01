import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tracking_app/core/common/get_resposive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_assets.dart';

class SuccessApplyDecorationWidget extends StatelessWidget {
  const SuccessApplyDecorationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(SvgImags.decoration1),
        Positioned(
            bottom: resposiveHeight(9),
            left: resposiveWidth(35),
            child: SvgPicture.asset(SvgImags.decoration2)),
      ],
    );
  }
}
