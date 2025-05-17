import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';

class DragIndicatorBar extends StatelessWidget {
  const DragIndicatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: responsiveWidth(80),
      height: responsiveHeight(4),
      decoration: ShapeDecoration(
        color: const Color(0xFF434343),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    );
  }
}
