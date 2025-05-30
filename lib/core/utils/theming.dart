import 'package:flutter/material.dart';
import 'package:tracking_app/core/services/screen_size_service.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/text_styles.dart';


ThemeData theme() {
  final screenWidth = ScreenSizeService.width;
  final screenHeight = ScreenSizeService.height;

  return ThemeData(
    appBarTheme: const AppBarTheme(backgroundColor: Colors.white),
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: Colors.white,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedLabelStyle: AppTextStyles.inter400_12,
      selectedLabelStyle: AppTextStyles.inter400_12,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        minimumSize: Size(
          (343 / ScreenSizeService.baseWidth) * screenWidth,
          (48 / ScreenSizeService.baseHeight) * screenHeight,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.1),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintStyle: AppTextStyles.roboto400_14.copyWith(
        color: const Color(0xffA6A6A6),
      ),
      labelStyle: AppTextStyles.roboto400_12.copyWith(
        color: const Color(0xff535353),
      ),
      contentPadding: EdgeInsetsDirectional.fromSTEB(
        (16 / ScreenSizeService.baseWidth) * screenWidth,
        (4 / ScreenSizeService.baseHeight) * screenHeight,
        0,
        (4 / ScreenSizeService.baseHeight) * screenHeight,
      ),
      focusedBorder: textFieldInputBorderFocus(),
      enabledBorder: textFieldInputBorder(),
      border: textFieldInputBorder(),
      filled: true,
      fillColor: Colors.transparent,
      errorMaxLines: 2,
      errorStyle: AppTextStyles.roboto400_12.copyWith(color: Colors.red),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primaryColor,
        textStyle: AppTextStyles.inter500_16.copyWith(
          decoration: TextDecoration.underline,
          decorationColor: AppColors.primaryColor,
          decorationStyle: TextDecorationStyle.solid,
        ),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.all(AppColors.primaryColor),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.primaryColor,
      // circularTrackColor: AppColors.greyColor
    ),
  );
}

OutlineInputBorder textFieldInputBorder() {
  final screenWidth = ScreenSizeService.width;
  double responsiveRadius = (4 / 375.0) * screenWidth;
  double responsiveBorderWidth = (1 / 375.0) * screenWidth;

  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(responsiveRadius)),
    borderSide: BorderSide(
      color: AppColors.greyColor,
      width: responsiveBorderWidth,
    ),
  );
}

OutlineInputBorder textFieldInputBorderFocus() {
  final screenWidth = ScreenSizeService.width;
  double responsiveRadius = (4 / 375.0) * screenWidth;
  double responsiveBorderWidth = (1 / 375.0) * screenWidth;

  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(responsiveRadius)),
    borderSide: BorderSide(color: Colors.black, width: responsiveBorderWidth),
  );
}
