import 'package:flutter/material.dart';
import 'package:tracking_app/core/utils/app_colors.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import 'package:tracking_app/feature/orders/presentation/widgets/address_widget.dart';
import 'package:tracking_app/feature/orders/presentation/widgets/status_widget.dart';

class FlowerOrderWidget extends StatelessWidget {
  const FlowerOrderWidget({super.key, required this.addressWidget, required this.statusWidget});

  final AddressWidget addressWidget;
  final StatusWidget statusWidget;
  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1), // Shadow color
            spreadRadius: 1, // How wide the shadow spreads
            blurRadius: 6,   // How blurry the shadow is
            offset: Offset(0, 3), // x and y offset
          ),
        ],
      ),
      
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text("Flower order",style: AppTextStyles.inter500_14,),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                statusWidget,
                Text("# 123456",style: AppTextStyles.inter600_16,)
              ],
            ),

            addressWidget,
            addressWidget
          ],
        ),
      ),

    );
  }
}
