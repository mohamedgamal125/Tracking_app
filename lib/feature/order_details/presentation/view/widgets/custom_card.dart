import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/text_styles.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.title, required this.value});
  final String title;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: responsiveWidth(8),
          right: responsiveWidth(8),
          top: responsiveHeight(16),
          bottom: responsiveHeight(16)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x40535353), // 0x40 = 25% opacity in hex
            offset: Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: AppTextStyles.roboto500_13
                  .copyWith(color: Color(0xff0C1015))),
          Text(value,
              style: AppTextStyles.roboto500_16
                  .copyWith(color: Color(0xff535353))),
        ],
      ),
    );
  }
}
