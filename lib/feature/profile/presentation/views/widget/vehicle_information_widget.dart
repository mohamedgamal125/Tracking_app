import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/text_styles.dart';
import '../../../../../core/router/pages_routes.dart';
import '../../../domain/entity/profile_response_entity.dart';

class VehicleInformationWidget extends StatelessWidget {
  const VehicleInformationWidget({super.key, required this.userData});
  final DriverEntity userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(16),
        vertical: responsiveHeight(8),
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
              child:ListTile(
                title: Column(
                  children: [
                    Text('Vehicle info'),
                    Text(userData.vehicleType ?? ''),
                    Text(userData.vehicleNumber ?? ''),
                  ],
                ),
              ),

              // Column(
              //   children: [
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Text(
              //           userData.firstName ?? '',
              //           style: AppTextStyles.inter500_18,
              //         ),
              //         SizedBox(width: responsiveWidth(8)),
              //         SizedBox(
              //           width: responsiveWidth(24),
              //           height: responsiveHeight(24),
              //           child: InkWell(
              //             onTap: () {
              //               Navigator.pushReplacementNamed(
              //                 context,
              //                 PagesRoutes.editProfile,
              //                 arguments: userData,
              //               );
              //             },
              //             child:Icon(Icons.edit),
              //           ),
              //         ),
              //       ],
              //     ),
              //     Text(
              //       userData.email ?? '',
              //       style: AppTextStyles.inter500_18.copyWith(
              //         color: AppColors.greyDarkColor,
              //       ),
              //     ),
              //     Text(
              //       userData.email ?? '',
              //       style: AppTextStyles.inter500_18.copyWith(
              //         color: AppColors.greyDarkColor,
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ),
        ],
      ),
    );
  }
}
