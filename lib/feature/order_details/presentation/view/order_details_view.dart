import 'package:flutter/material.dart';
import 'package:tracking_app/core/widgets/custom_app_bar.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/custom_elevated_button.dart';
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
      bottomNavigationBar: CustomElevatedButton(
        bottonStatus: bottonStatus,
        index: index,
        onPressed: () {
          if (index < bottonStatus.length - 1) {
            setState(() {
              index++;
            });
          }
        },
      ),
    );
  }
}
