import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import '../../../domain/entity/profile_response_entity.dart';

class UserInformationWidget extends StatelessWidget {
  const UserInformationWidget({super.key, required this.userData});
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
              child:ListTile(
                title: Column(
                  children: [
                    Text('${userData.firstName ?? ''} ${userData.lastName ?? ''}'),
                    Text(userData.email ?? ''),
                    Text(userData.phone ?? ''),
                  ],
                ),
                leading: CircleAvatar(
                  child: Image.network(userData.photo ?? '',fit: BoxFit.cover,),
                ),
              ),

            ),
          ),
        ],
      ),
    );
  }
}
