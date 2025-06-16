import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/router/pages_routes.dart';
import 'package:tracking_app/core/utils/constant_manager.dart';
import 'package:tracking_app/feature/home/domain/entites/pending_orders_response_entity.dart';
import 'package:tracking_app/feature/order_details/presentation/cubits/states_cubit.dart';
import 'package:tracking_app/feature/order_details/presentation/cubits/update_order_state_cubit/update_order_state_cubit.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/custom_elevated_button.dart';
// import 'package:tracking_app/feature/order_details/presentation/view/widgets/success_view.dart';

class ElevatedButtonBlocBuilder extends StatelessWidget {
  const ElevatedButtonBlocBuilder({
    super.key,
    required this.bottonStatus,
    required this.order,
  });

  final List<String> bottonStatus;
  final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    CollectionReference orders =
        FirebaseFirestore.instance.collection(AppConstants.orderCollection);
    int index = context.select((StatesCubit cubit) => cubit.state);

    return BlocBuilder<StatesCubit, int>(
      builder: (context, state) {
        return CustomElevatedButton(
            bottonStatus: bottonStatus,
            index: state,
            onPressed: () {
              context.read<StatesCubit>().changeState();
              _updateOrderStatusInFirebase(orders, index);

              _updateOrderStateFun(state, context);
            });
      },
    );
  }

  void _updateOrderStatusInFirebase(
      CollectionReference<Object?> orders, int index) {
    orders.doc('${order.id}').set({AppConstants.orderStatus: index});
  }

  void _updateOrderStateFun(int state, BuildContext context) {
    if (state == 4) {
      context.read<UpdateOrderStateCubit>().updateOrderState(
        '${order.id}',
        {
          AppConstants.orderState: "completed",
        },
      );

     // Navigator.pushNamed(context, PagesRoutes.SuccessView);
    }
  }
}
