import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_assets.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import 'package:url_launcher/url_launcher.dart';
part 'address_section_communications_functions.dart';

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
              left: responsiveWidth(4),
              top: responsiveHeight(8),
              bottom: responsiveHeight(8)),
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
                  AppTextStyles.roboto500_13.copyWith(color: Color(0xff535353)),
            ),
            subtitle: Row(
              children: [
                SvgPicture.asset(SvgImags.locationIcon),
                Expanded(
                  child: Text(
                      overflow: TextOverflow.clip,
                      address,
                      style: AppTextStyles.inter400_13
                          .copyWith(color: Color(0xff0C1015))),
                ),
              ],
            ),
            trailing: Row(
              spacing: responsiveWidth(4),
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                    onTap: () async {
                      await _callPhoneNumber('+20 1124107203');
                    },
                    child: SvgPicture.asset(SvgImags.callIcon)),
                InkWell(
                    onTap: () async {
                      await _launchWhatsApp(phoneNumber: '+20 1124107203');
                    },
                    child: SvgPicture.asset(SvgImags.whatsappIcon)),
              ],
            ),
          ),
        )
      ],
    );
  }
}
