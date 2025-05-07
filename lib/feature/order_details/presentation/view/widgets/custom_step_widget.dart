import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';

class CustomStepWidget extends StatelessWidget {
  final int stepCount;
  final int currentStep;

  const CustomStepWidget({
    super.key,
    required this.stepCount,
    required this.currentStep,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(stepCount, (index) {
        return Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: responsiveWidth(8)),
            height: responsiveHeight(4.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: index <= currentStep ? Colors.green : Color(0xffA6A6A6),
            ),
          ),
        );
      }),
    );
  }
}
