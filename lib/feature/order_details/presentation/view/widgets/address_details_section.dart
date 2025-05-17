import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tracking_app/core/utils/app_colors.dart';

import '../../../../../core/common/get_responsive_height_and_width.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/text_styles.dart';
import 'communication_widget.dart';

class AddressDetailsSection extends StatelessWidget {
  const AddressDetailsSection(
      {super.key,
        required this.name,
        required this.address,
        required this.phone,
        this.image});
  final String name;
  final String address;
  final String? image;
  final String phone;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // height: responsiveHeight(40),
          padding: EdgeInsets.only(
              left: responsiveWidth(4),
              top: responsiveHeight(8),
              bottom: responsiveHeight(8)),
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Color(0x40535353), // 0x40 = 25% opacity in hex
                  offset: Offset(0, 0),
                  blurRadius: 4,
                  spreadRadius: 0,
                )
              ]),
          child: ListTile(
            leading: image != null
                ? SizedBox(
                height: responsiveHeight(44),
                width: responsiveWidth(44),
                child: Image.network(
                  image!,
                  fit: BoxFit.cover,
                ))
                : SizedBox(
                width: responsiveWidth(44),
                height: responsiveHeight(44),
                child: SvgPicture.asset(
                  SvgImags.flowerlyLogo,
                  fit: BoxFit.contain,
                )),
            title: Text(
              name,
              style:
              AppTextStyles.roboto500_13.copyWith(color: AppColors.greyDarkColor),
            ),
            subtitle: Row(
              children: [
                SvgPicture.asset(SvgImags.locationIcon),
                Expanded(
                  child: Text(
                      overflow: TextOverflow.ellipsis,
                      address,
                      style: AppTextStyles.inter400_13
                          .copyWith(color: AppColors.blackColor)),
                ),
              ],
            ),
            trailing: CommunicationWidget(
              phoneNumber: phone,
              whatsAppNumber: phone,
            ),
          ),
        )
      ],
    );
  }
}