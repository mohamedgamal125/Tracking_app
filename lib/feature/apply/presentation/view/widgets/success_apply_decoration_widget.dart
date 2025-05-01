import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracking_app/core/common/get_resposive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_assets.dart';

class SuccessApplyDecorationWidget extends StatelessWidget {
  const SuccessApplyDecorationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          SvgPicture.asset(
            SvgImags.decoration1,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          Positioned(
            bottom: resposiveHeight(0),
            left: resposiveWidth(78),
            child: SvgPicture.asset(
              SvgImags.decoration2,
              width: resposiveWidth(320.81),
              height: resposiveHeight(122.89),
              // fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
