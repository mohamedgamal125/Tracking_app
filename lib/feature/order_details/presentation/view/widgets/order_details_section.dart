import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_assets.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/text_styles.dart';

class OrderDetailsSection extends StatelessWidget {
  const OrderDetailsSection({
    super.key,
    required this.name,
    required this.price,
    required this.quantity,
    this.image,
  });

  final String name;
  final String price;
  final String? image;
  final String? quantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: responsiveWidth(8),
          right: responsiveWidth(8),
          top: responsiveHeight(16),
          bottom: responsiveHeight(16)
          ),
      margin: EdgeInsets.only(bottom: responsiveHeight(8)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color(0x40535353), // 25% opacity
            offset: Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 0,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🖼️ Image or fallback logo
          SizedBox(
            width: responsiveWidth(44),
            height: responsiveHeight(44),
            child: image != null
                ? Image.asset(
                    image!,
                    fit: BoxFit.cover,
                  )
                : SvgPicture.asset(
                    SvgImages.flowerlyLogo,
                    fit: BoxFit.contain,
                  ),
          ),
          SizedBox(width: responsiveWidth(12)),

          // 📝 Text Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  name,
                  style: AppTextStyles.inter400_13.copyWith(
                    color: const Color(0xff535353),
                  ),
                ),
                SizedBox(height: responsiveHeight(4)),
                Text(
                  price,
                  style: AppTextStyles.roboto500_13.copyWith(
                    color: const Color(0xff0C1015),
                  ),
                ),
              ],
            ),
          ),

          // 🔢 Quantity
          Text(
            "x$quantity",
            style: AppTextStyles.roboto500_13.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
