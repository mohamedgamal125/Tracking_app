import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import 'package:tracking_app/feature/home/domain/entites/pending_orders_response_entity.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity order;
  final VoidCallback onReject;
  final VoidCallback onAccept;

  const OrderCard({
    required this.order,
    required this.onReject,
    required this.onAccept,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final store = order.store;
    final user = order.user;
    return Container(
      margin: EdgeInsets.only(bottom: responsiveHeight(12)),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.blackColor.withOpacity(0.05),
            blurRadius: 12,
            spreadRadius: 1,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Flower Order',
            style: AppTextStyles.inter500_14,
          ),
          SizedBox(height: responsiveHeight(8)),
          Text(
            'Pickup Address',
            style: AppTextStyles.inter400_12.copyWith(
              color: AppColors.greyDarkColor,
            ),
          ),
          SizedBox(height: responsiveHeight(8)),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.blackColor.withOpacity(0.05),
                  blurRadius: 12,
                  spreadRadius: 1,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                store?.image != null && store!.image!.isNotEmpty
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(store.image!),
                      )
                    : CircleAvatar(
                        backgroundColor: AppColors.greyColor,
                      ),
                SizedBox(width: responsiveWidth(8)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        store?.name ?? '',
                        style: AppTextStyles.inter400_14.copyWith(
                          color: AppColors.greyDarkColor,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 16,
                          ),
                          Expanded(
                            child: Text(
                              store?.address ?? '',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: responsiveHeight(12)),
          Text(
            'User Address',
            style: AppTextStyles.inter400_12.copyWith(
              color: AppColors.greyColor,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 12,
                  spreadRadius: 1,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                user?.photo != null && user!.photo!.isNotEmpty
                    ? CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile-user.png'),
                      )
                    : CircleAvatar(
                        backgroundColor: AppColors.greyColor,
                      ),
                SizedBox(width: responsiveWidth(8)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${user?.firstName ?? ''} ${user?.lastName ?? ''}',
                        style: AppTextStyles.inter400_14.copyWith(
                          color: AppColors.greyDarkColor,
                        ),
                      ),
                      // if (order.shippingAddress != null)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 16,
                          ),
                          SizedBox(width: responsiveWidth(4)),
                          Expanded(
                            child: Text(
                              order.shippingAddress?.street ?? '',
                              style: AppTextStyles.roboto400_14,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: responsiveHeight(8)),
          Row(
            children: [
              Text(
                'EGP ${order.totalPrice}',
                style: AppTextStyles.inter600_14,
              ),
              SizedBox(width: responsiveWidth(8)),
              Expanded(
                child: SizedBox(
                  height: responsiveHeight(36),
                  width: responsiveWidth(112),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.whiteColor,
                      side: BorderSide(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    onPressed: onReject,
                    child: Text(
                      'Reject',
                      style: AppTextStyles.inter500_14.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: responsiveWidth(8)),
              Expanded(
                child: SizedBox(
                  height: responsiveHeight(36),
                  width: responsiveWidth(112),
                  child: ElevatedButton(
                    onPressed: onAccept,
                    child: Text(
                      'Accept',
                      style: AppTextStyles.inter500_14.copyWith(
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
