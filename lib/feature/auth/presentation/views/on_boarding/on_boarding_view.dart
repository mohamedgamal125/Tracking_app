import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/router/pages_routes.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/text_styles.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: responsiveWidth(16),vertical: responsiveHeight(8)),
          child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            // SizedBox(height: responsiveHeight(48),),
              Spacer(),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0),
              child: SizedBox(
              width: double.infinity,
              height: responsiveHeight(300),
              child: Center(
                child: Transform.scale(
                  scale: 1.7,
                  child: Lottie.asset(
                    'assets/animations/onboarding_animation.json',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
                        ),
            ),
            
              SizedBox(height: 8),
              Text(
                "Welcome to\nFlowery rider app",
                style: AppTextStyles.inter500_20,
              ),
              SizedBox(
                height: responsiveHeight(16),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, PagesRoutes.signIn);
                  },
                  child: Text(
                    "Login",
                    style: AppTextStyles.inter500_16
                        .copyWith(color: AppColors.whiteColor),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.whiteColor,
                    side: BorderSide(color: AppColors.greyDarkColor),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Apply now",
                    style: AppTextStyles.inter500_16
                        .copyWith(color: AppColors.greyDarkColor),
                  )),
              Spacer(),
              Center(child: Text("v 6.3.0 - (446)"))
            ],
          ),
        ),
      ),
    );
  }
}
