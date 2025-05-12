import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tracking_app/feature/home/domain/entites/pending_orders_response_entity.dart';
import 'package:tracking_app/feature/order_details/presentation/cubits/update_order_state_cubit/update_order_state_cubit.dart';
import 'package:tracking_app/feature/order_details/presentation/cubits/update_order_state_cubit/update_order_state_states.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/order_details_view_body.dart';

class OrderDetailsViewBodyBlocListener extends StatelessWidget {
  const OrderDetailsViewBodyBlocListener({
    super.key, required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateOrderStateCubit, UpdateOrderStateStates>(
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
        child: OrderDetailsViewBody(order:order));
  }
}
