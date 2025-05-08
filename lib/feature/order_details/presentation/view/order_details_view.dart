import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/widgets/custom_app_bar.dart';
import 'package:tracking_app/feature/order_details/presentation/cubits/states_cubit.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/custom_elevated_button.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/elevate_button_bloc_builder.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/order_details_view_body.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  static const List<String> bottonStatus = [
    'Arrived at Pickup point',
    'Start deliver',
    'Arrived to the user',
    'Delivered to the user',
    'Delivered to the user'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => StatesCubit(),
      child: Scaffold(
        appBar: buildCustomAppBar(
          title: "Order Details",
          isVisible: false,
          context: context,
        ),
        body: const OrderDetailsViewBody(),
        bottomNavigationBar:
            ElevatedButtonBlocBuilder(bottonStatus: bottonStatus),
      ),
    );
  }
}
