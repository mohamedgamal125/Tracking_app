import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../core/services/localization_service.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/l10n.dart';
import 'lang_bottom_sheet_decoration_dash.dart';
import 'language_tile_widget.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: responsiveHeight(16),
        horizontal: responsiveWidth(24),
      ),
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Container(
                padding: EdgeInsets.symmetric(
                  vertical: responsiveHeight(16),
                  horizontal: responsiveWidth(16),
                ),
                height: responsiveHeight(220),
                width: responsiveWidth(375),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    spacing: responsiveHeight(16),
                    children: [
                      DragIndicatorBar(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).language,
                            style: AppTextStyles.outfit700_20.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                      LanguageTileWidget(
                        title: S.of(context).english,
                        value: 'en',
                      ),
                      LanguageTileWidget(
                        title: S.of(context).arabic,
                        value: 'ar',
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Row(
          children: [
            Icon(Icons.translate, size: 16),
            SizedBox(width: responsiveWidth(8)),
            Text(S.of(context).language, style: AppTextStyles.inter500_13),
            Spacer(),
            Text(
              context.watch<LocaleProvider>().locale.languageCode == 'en'
                  ? S.of(context).english
                  : S.of(context).arabic,
              style: AppTextStyles.inter400_12.copyWith(
                fontSize: 10,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
