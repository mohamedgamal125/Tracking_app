import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/text_styles.dart';

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({
    super.key,
    required this.statusList,
    required this.index,
    required this.orderNumber,
    required this.date,
  });

  final List<String> statusList;
  final int index;
  final String orderNumber;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: responsiveWidth(16),
          top: responsiveHeight(16),
          bottom: responsiveHeight(16)),
      width: responsiveWidth(343),
      // height: responsiveHeight(110),
      decoration: BoxDecoration(
          color: Color(0xffF9ECF0), borderRadius: BorderRadius.circular(10)),
      child: Column(
        spacing: responsiveHeight(8),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Status : ${statusList[index]}',
            style:
                AppTextStyles.inter600_16.copyWith(color: AppColors.greenColor),
          ),
          Text('Order ID : $orderNumber', style: AppTextStyles.inter500_16),
          Text(
            _formatDate(date),
            style: AppTextStyles.inter500_14.copyWith(
              color: Color(0xff535353),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String isoDate) {
    final date = DateTime.parse(isoDate).toLocal();
    return DateFormat('E, dd MMM yyyy, hh:mm a').format(date);
  }
}
