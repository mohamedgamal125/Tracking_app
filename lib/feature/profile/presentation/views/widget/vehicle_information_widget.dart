import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../../domain/entity/profile_response_entity.dart';

class VehicleInformationWidget extends StatelessWidget {
  const VehicleInformationWidget({super.key, required this.userData});

  final DriverEntity userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(16),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: responsiveHeight(16),
              bottom: responsiveHeight(24),
            ),
            child: Container(
                padding: EdgeInsets.only(
                    left: responsiveWidth(12),
                    top: responsiveHeight(8),
                    bottom: responsiveHeight(8),
                    right: responsiveWidth(12)),
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
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          S.of(context).vehicle_info,
                          style: AppTextStyles.inter600_18,
                        ),
                        Text(
                          userData.vehicleType ?? '',
                          style: AppTextStyles.inter400_16,
                        ),
                        Text(
                          userData.vehicleNumber ?? '',
                          style: AppTextStyles.inter400_16,
                        ),
                      ],
                    ),
                    Expanded(
                      child: SizedBox(
                        width: responsiveWidth(4),
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                )
                ),
          ),
        ],
      ),
    );
  }
}
