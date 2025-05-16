import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_assets.dart';
import 'package:url_launcher/url_launcher.dart';
part 'address_section_communications_functions.dart';

class CommunicationWidget extends StatelessWidget {
  const CommunicationWidget({
    super.key,
    required this.phoneNumber,
    required this.whatsAppNumber,
  });
  final String phoneNumber;
  final String whatsAppNumber;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: responsiveWidth(4),
      mainAxisSize: MainAxisSize.min,
      children: [
        // SizedBox(width: responsiveWidth(8)),
        InkWell(
            onTap: () async {
              await _callPhoneNumber(phoneNumber);
              log(phoneNumber + ' ny phine number');
            },
            child: SvgPicture.asset(
              SvgImages.callIcon,
              height: responsiveHeight(20),
              width: responsiveWidth(20),
            )),
        InkWell(
            onTap: () async {
              await _launchWhatsApp(phoneNumber: whatsAppNumber);
            },
            child: SvgPicture.asset(
              SvgImages.whatsappIcon,
              height: responsiveHeight(25),
              width: responsiveWidth(25),
              fit: BoxFit.contain,
            )),
      ],
    );
  }
}
