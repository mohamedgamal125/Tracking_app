import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../core/services/localization_service.dart';

class LanguageTileWidget extends StatelessWidget {
  final String title;
  final String value;

  const LanguageTileWidget({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: responsiveHeight(12)),
      child: Container(
        height: responsiveHeight(56),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: RadioListTile<String>(
          value: value,
          groupValue: context.watch<LocaleProvider>().locale.languageCode,
          onChanged: (val) async {
            context.read<LocaleProvider>().changeLocale(Locale(val!));
          },
          title: Text(
            title,
            style: AppTextStyles.outfitMedium_16.copyWith(color: Colors.black),
          ),
          activeColor: AppColors.primaryColor,
          contentPadding: EdgeInsets.symmetric(horizontal: responsiveWidth(16)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          tileColor: Colors.transparent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    );
  }
}
