import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import '../../../domain/entity/profile_response_entity.dart';

class UserInformationWidget extends StatelessWidget {
  const UserInformationWidget({super.key, required this.userData});

  final DriverEntity userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: responsiveWidth(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Container(
              padding: EdgeInsets.only(
                  left: responsiveWidth(12),
                  top: responsiveHeight(12),
                  bottom: responsiveHeight(12),
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
                  CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage(
                        userData.photo ?? '',
                      scale: .9
                    ),
                  ),
                  SizedBox(
                    width: responsiveWidth(8),
                  ),
                  Expanded(
                    flex:6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${userData.firstName ?? ''} ${userData.lastName ?? ''}',
                          style: AppTextStyles.inter600_18,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: responsiveHeight(8),
                        ),
                        Text(
                          userData.email ?? '',
                          style: AppTextStyles.inter400_16,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: responsiveHeight(8),
                        ),
                        Text(
                          userData.phone ?? '',
                          style: AppTextStyles.inter400_16,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                      child: Icon(Icons.arrow_forward_ios)),
                ],
              )),
        ],
      ),
    );
  }
}
