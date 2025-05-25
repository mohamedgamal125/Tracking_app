import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tracking_app/core/utils/app_colors.dart';

import '../../../../core/common/get_responsive_height_and_width.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/text_styles.dart';
import '../../domain/entity/order_entity.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({
    super.key,
    required this.entity,
  });

  final OrderDetailsEntity entity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Card(
        color: AppColors.whiteColor,
        elevation: 1.5,
        // Let the card take all available width
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            children: [
              CircleAvatar(
                radius: responsiveHeight(24),
                backgroundColor: Colors.transparent,
                child: (entity.imgUrl == null || entity.imgUrl!.isEmpty)
                    ? SvgPicture.asset(SvgImags.flowerImg)
                    : Image.network(entity.imgUrl!),
              ),
              const SizedBox(width: 12),
              // Expand the text area so it wraps/truncates instead of overflowing
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top row: name and “X amount”
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            entity.name!,
                            style: AppTextStyles.inter400_13
                                .copyWith(color: AppColors.greyColor),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "X${entity.amount!}",
                          style: AppTextStyles.inter500_13
                              .copyWith(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    // Price below
                    Text(
                      entity.price!,
                      style: AppTextStyles.inter400_13,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
