import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.bottonStatus,
    required this.index,
    required this.onPressed,
  });

  final List<String> bottonStatus;
  final int index;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: responsiveHeight(96),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Color(0x33000000), // 20% opacity = 0x33
          offset: Offset(0, 0),
          blurRadius: 4,
          spreadRadius: 0,
        )
      ]),
      padding: EdgeInsets.only(
          left: responsiveWidth(24),
          right: responsiveWidth(24),
          top: responsiveHeight(16),
          bottom: responsiveHeight(16)),
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            bottonStatus[index],
            style: AppTextStyles.inter500_16.copyWith(color: Colors.white),
          )),
    );
  }
}
