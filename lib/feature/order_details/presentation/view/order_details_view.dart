import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/get_responsive_height_and_width.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import 'package:tracking_app/core/widgets/custom_app_bar.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/order_details_view_body.dart';

class OrderDetailsView extends StatefulWidget {
  const OrderDetailsView({super.key});

  @override
  State<OrderDetailsView> createState() => _OrderDetailsViewState();
}

class _OrderDetailsViewState extends State<OrderDetailsView> {
  final List<String> bottonStatus = [
    'Arrived at Pickup point',
    'Start deliver',
    'Arrived to the user',
    'Delivered to the user',
    'Delivered to the user'
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
          title: "Order Details", isVisible: false, context: context),
      body: OrderDetailsViewBody(),
      bottomNavigationBar: Container(
        // height: responsiveHeight(96),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
          BoxShadow(
            color: Color(0x33000000), // 20% opacity = 0x33
            offset: Offset(0, 0),
            blurRadius: 4,
            spreadRadius: 0,
          )
        ]),
        padding: EdgeInsets.only(
            left: responsiveWidth(24),
            right: responsiveWidth(24),
            top: responsiveHeight(16),
            bottom: responsiveHeight(16)),
        child: ElevatedButton(
            onPressed: () {
              if (index < bottonStatus.length - 1) index++;
              setState(() {});
            },
            child: Text(
              bottonStatus[index],
              style: AppTextStyles.inter500_16.copyWith(color: Colors.white),
            )),
      ),
    );
  }
}
