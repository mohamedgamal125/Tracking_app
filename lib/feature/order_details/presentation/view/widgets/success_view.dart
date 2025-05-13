import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/text_styles.dart';

import '../../../../../core/router/pages_routes.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../generated/assets.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 80,bottom: 32),
              child: SvgPicture.asset(SvgImags.successView),
            ),

            Text("Thank You!!",style: AppTextStyles.roboto500_18.copyWith(fontSize: 20,color: AppColors.greenColor),),
            SizedBox(height: 8,),
            Text("The order delivered\n      successfully",style: AppTextStyles.roboto500_18.copyWith(fontSize: 20),),
          
            Padding(
              padding: EdgeInsets.symmetric(vertical:18),
              child: ElevatedButton(
                  onPressed: (){
                    
                    Navigator.pushReplacementNamed(context, PagesRoutes.layoutView);
                  },

                  child: Text("Done",style: AppTextStyles.inter500_14.copyWith(color: AppColors.whiteColor),)

              ),
            )
          ],
        ),
      ),
    );
  }
}
