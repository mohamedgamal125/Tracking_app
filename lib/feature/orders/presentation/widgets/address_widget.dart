import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_assets.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/text_styles.dart';

class AddressWidget extends StatelessWidget {
  AddressWidget(
      {super.key,
      required this.imgUrl,
      required this.name,
      required this.address, required this.label});

  final String? imgUrl;
  final String name;
  final String address;
  final String label;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,style: AppTextStyles.roboto400_12.copyWith(color: AppColors.greyColor),),
          Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            width:responsiveWidth(320) ,
            height: responsiveHeight(70),
            child: Card(
              color: AppColors.whiteColor,
              elevation: 1.5,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                    child: CircleAvatar(
                      child: imgUrl==null||imgUrl!.isEmpty?SvgPicture.asset(SvgImags.flowerlyLogo):Image.network(imgUrl!),
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: AppTextStyles.inter400_13
                              .copyWith(color: AppColors.greyColor),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              SvgImags.locationIcon,
                              height: responsiveHeight(12),
                              width: responsiveWidth(12),
                            ),
                            Text(
                              address,
                              style: AppTextStyles.inter400_13,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
