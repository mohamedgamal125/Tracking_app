import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_assets.dart';
import 'package:tracking_app/core/utils/text_styles.dart';

class AddressSection extends StatelessWidget {
  const AddressSection(
      {super.key,
      required this.sectionTitle,
      required this.name,
      required this.address,
      this.image});
  final String sectionTitle;
  final String name;
  final String address;
  final String? image;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          sectionTitle,
          style: AppTextStyles.inter500_18,
        ),
        SizedBox(height: responsiveHeight(16)),
        Container(
          padding: EdgeInsets.only(
              left: responsiveWidth(16),
              top: responsiveHeight(16),
              bottom: responsiveHeight(16)),
          decoration: BoxDecoration(
              color: Colors.white,
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
                    child: Image.asset(
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
                  AppTextStyles.inter400_13.copyWith(color: Color(0xff535353)),
            ),
            subtitle: Row(
              children: [
                SvgPicture.asset(SvgImags.locationIcon),
                Text(
                  address,
                  style: AppTextStyles.inter400_13
                      .copyWith(color: Color(0xff0C1015)),
                ),
              ],
            ),
            trailing: Row(
              spacing: responsiveWidth(4),
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgPicture.asset(SvgImags.callIcon),
                SvgPicture.asset(SvgImags.whatsappIcon),
              ],
            ),
          ),
        )
      ],
    );
  }
}
