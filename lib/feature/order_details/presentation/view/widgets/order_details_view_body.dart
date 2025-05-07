import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/custom_step_widget.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/order_status_widget.dart';

class OrderDetailsViewBody extends StatefulWidget {
  const OrderDetailsViewBody({super.key});

  @override
  State<OrderDetailsViewBody> createState() => _OrderDetailsViewBodyState();
}

class _OrderDetailsViewBodyState extends State<OrderDetailsViewBody> {
  int index = 0;
  List<String> statusList = [
    'Accepted',
    'Picked',
    ' Out for delivery',
    'Arrived',
    'Delivered'
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: responsiveWidth(8)),
      child: Column(
        children: [
          CustomStepWidget(
            stepCount: 5,
            currentStep: index,
          ),
          SizedBox(height: responsiveHeight(24)),
          OrderStatusWidget(statusList: statusList, index: index),
          SizedBox(height: responsiveHeight(16)),
        ],
      ),
    );
  }
}
