import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/text_styles.dart';

import '../../../../../core/common/get_responsive_height_and_width.dart';
import '../../../../home/domain/entites/pending_orders_response_entity.dart';
import 'address_details_section.dart';
import '../../../../../core/utils/app_assets.dart';

class BottomInfoCard extends StatelessWidget {
  final OrderEntity? order;
  final bool reverse;

  const BottomInfoCard({
    super.key,
    required this.order,
    this.reverse = false,
  });

  @override
  Widget build(BuildContext context) {
    final pickupCard = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: responsiveWidth(24)),
          child: Text('Pickup address', style: AppTextStyles.inter400_12),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: responsiveWidth(20)),
          child: AddressDetailsSection(
            name: order?.store?.name ?? '',
            address: order?.store?.address ?? '',
            phone: order?.store?.phoneNumber ?? '',
            image: SvgImags.flowerlyLogo,
          ),
        ),
        SizedBox(height: responsiveHeight(16)),
      ],
    );

    final userCard = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Text('User address', style: AppTextStyles.inter400_12),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: responsiveWidth(20)),
          child: AddressDetailsSection(
            name: '${order?.user?.firstName ?? ''} ${order?.user?.lastName ?? ''}',
            address: order?.shippingAddress?.street ?? '',
            phone: order?.shippingAddress?.phone ?? '',
            image: order?.user?.photo,
          ),
        ),
        SizedBox(height: responsiveHeight(16)),
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: reverse ? [userCard, pickupCard] : [pickupCard, userCard],
    );
  }
}

