import 'package:flutter/material.dart';
import 'package:tracking_app/core/widgets/custom_app_bar.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/order_details_view_body.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(
          title: "Order Details", isVisible: false, context: context),
      body: OrderDetailsViewBody(),
    );
  }
}
