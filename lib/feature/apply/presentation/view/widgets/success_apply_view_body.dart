import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_assets.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import 'package:tracking_app/feature/apply/presentation/view/widgets/success_apply_decoration_widget.dart';

class SuccessApplyViewBody extends StatefulWidget {
  const SuccessApplyViewBody({
    super.key,
  });

  @override
  State<SuccessApplyViewBody> createState() => _SuccessApplyViewBodyState();
}

class _SuccessApplyViewBodyState extends State<SuccessApplyViewBody> {
  final AnimatedTextController controller = AnimatedTextController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: responsiveWidth(30)),
            child: Column(
              children: [
                SizedBox(
                  height: responsiveHeight(123.86),
                ),
                SvgPicture.asset(SvgImages.successApply),
                SizedBox(
                  height: responsiveHeight(64.86),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Your application has been submitted!',
                      textStyle: AppTextStyles.inter600_18,
                      textAlign: TextAlign.center,
                      speed: const Duration(milliseconds: 150),
                    ),
                  ],
                  controller: controller,
                  totalRepeatCount: 1,
                  repeatForever: false,
                ),
                // Text(
                //   'Your application has been submitted!',
                //   style: AppTextStyles.inter600_18,
                //   textAlign: TextAlign.center,
                // ),
                SizedBox(height: responsiveHeight(16)),
                Text(
                    style: AppTextStyles.inter400_16,
                    textAlign: TextAlign.center,
                    'Thank you for providing your application, we will review your application and will get back to you soon.'),
                SizedBox(height: responsiveHeight(24)),
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
