import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_assets.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/text_styles.dart';

class OrderDetailsSection extends StatelessWidget {
  const OrderDetailsSection(
      {super.key,
      required this.name,
      required this.price,
      required this.quantity,
      this.image});

  final String name;
  final String price;
  final String? image;
  final String? quantity;
  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: AppTextStyles.inter400_13.copyWith(color: Color(0xff535353)),
          ),
          subtitle: Expanded(
            child: Text(
              overflow: TextOverflow.clip,
              price,
              style:
                  AppTextStyles.roboto500_13.copyWith(color: Color(0xff0C1015)),
            ),
          ),
          trailing: Text(
            "X$quantity",
            style: AppTextStyles.roboto500_13
                .copyWith(color: AppColors.primaryColor),
          )),
    );
  }
}
