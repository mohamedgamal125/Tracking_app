import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/constant_manager.dart';

import '../../../../../core/common/get_responsive_height_and_width.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/text_styles.dart';
import 'communication_widget.dart';

class AddressDetailsSection extends StatelessWidget {
  const AddressDetailsSection({
    super.key,
    required this.name,
    required this.address,
    required this.phone,
    this.image,
  });

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
          height: responsiveHeight(80),
          padding: EdgeInsets.only(
            left: responsiveWidth(4),
            bottom: responsiveHeight(8),
          ),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: AppColors.greyDarkColor,
                offset: Offset(0, 0),
                blurRadius: 4,
                spreadRadius: 0,
              )
            ],
          ),
          child: ListTile(
            leading: SizedBox(
              width: responsiveWidth(50),
              height: responsiveHeight(50),
              child: _buildImage(image),
            ),
            title: Text(
              name,
              style: AppTextStyles.roboto500_13.copyWith(color: AppColors.greyDarkColor),
            ),
            subtitle: Row(
              children: [
                SvgPicture.asset(SvgImags.locationIcon),
                SizedBox(width: responsiveWidth(2)),
                Expanded(
                  child: Text(
                    overflow: TextOverflow.ellipsis,
                    address,
                    style: AppTextStyles.inter400_13.copyWith(color: AppColors.blackColor),
                  ),
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

  Widget _buildImage(String? image) {
    //default fallback image
    const defaultImage = ImageAssets.profileUser;

    if (image == null || image.isEmpty || image.contains('file://')) {
      return Image.asset(defaultImage, fit: BoxFit.cover);
    }

    if (image.endsWith('.svg')) {
      return SvgPicture.asset(image, fit: BoxFit.contain);
    }

    final fullImageUrl = (image.startsWith('http') || image.startsWith('https'))
        ? image
        : AppConstants.imagePath+image;

    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.network(
        fullImageUrl,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Image.asset(defaultImage),
      ),
    );
  }
}
