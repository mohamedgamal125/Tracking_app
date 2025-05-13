import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_colors.dart';

class CustomVerifyTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final bool isError;

  const CustomVerifyTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: responsiveWidth(45),
      child: TextFormField(
        focusNode: focusNode,
        controller: controller,
        keyboardType: TextInputType.number,
        maxLength: 1,
        textAlign: TextAlign.center,
        onChanged: onChanged,
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: AppColors.lightWhiteColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: isError ? AppColors.errorColor: Colors.transparent,
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: isError ? AppColors.errorColor : Colors.transparent,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
