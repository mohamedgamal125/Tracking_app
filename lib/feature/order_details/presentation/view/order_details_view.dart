import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tracking_app/core/di/injectable_initializer.dart';
import 'package:tracking_app/core/widgets/custom_app_bar.dart';
import 'package:tracking_app/feature/order_details/presentation/cubits/states_cubit.dart';
import 'package:tracking_app/feature/order_details/presentation/cubits/update_order_state_cubit/update_order_state_cubit.dart';
import 'package:tracking_app/feature/order_details/presentation/cubits/update_order_state_cubit/update_order_state_states.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StatesCubit(),
        ),
        BlocProvider(
          create: (context) => getIt.get<UpdateOrderStateCubit>(),
        ),
      ],
      child: Scaffold(
        appBar: buildCustomAppBar(
          title: "Order Details",
          isVisible: false,
          context: context,
        ),
        body: BlocListener<UpdateOrderStateCubit, UpdateOrderStateStates>(
            listener: (context, state) {
              if (state is UpdateOrderStateLoading) {
                EasyLoading.show();
              } else if (state is UpdateOrderStateSuccess) {
                EasyLoading.dismiss();
              } else if (state is UpdateOrderStateError) {
                EasyLoading.dismiss();
                EasyLoading.showError(
                  state.message,
                );
              }
            },
            child: OrderDetailsViewBody()),
        bottomNavigationBar:
            ElevatedButtonBlocBuilder(bottonStatus: bottonStatus),
      ),
    );
  }
}
