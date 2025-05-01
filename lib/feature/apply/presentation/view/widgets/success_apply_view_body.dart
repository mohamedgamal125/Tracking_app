import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tracking_app/core/common/get_resposive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_assets.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import 'package:tracking_app/feature/apply/presentation/view/widgets/success_apply_decoration_widget.dart';

class SuccessApplyViewBody extends StatelessWidget {
  const SuccessApplyViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: resposiveWidth(30)),
            child: Column(
              children: [
                SizedBox(
                  height: resposiveHeight(123.86),
                ),
                SvgPicture.asset(SvgImags.successApply),
                SizedBox(
                  height: resposiveHeight(64.86),
                ),
                Text(
                  'Your application has been submitted!',
                  style: AppTextStyles.inter600_18,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: resposiveHeight(16)),
                Text(
                    style: AppTextStyles.inter400_16,
                    textAlign: TextAlign.center,
                    'Thank you for providing your application, we will review your application and will get back to you soon.'),
                SizedBox(height: resposiveHeight(24)),
                ElevatedButton(
                    onPressed: () {},
                    child: Text('Login',
                        style: AppTextStyles.inter500_16
                            .copyWith(color: Colors.white))),
              ],
            ),
          ),
          Spacer(),
          SuccessApplyDecorationWidget(),
        ],
      ),
    );
  }
}
