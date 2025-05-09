import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/feature/order_details/presentation/cubits/states_cubit.dart';
import 'package:tracking_app/feature/order_details/presentation/cubits/update_order_state_cubit/update_order_state_cubit.dart';
import 'package:tracking_app/feature/order_details/presentation/view/widgets/custom_elevated_button.dart';

class ElevatedButtonBlocBuilder extends StatelessWidget {
  const ElevatedButtonBlocBuilder({
    super.key,
    required this.bottonStatus,
  });

  final List<String> bottonStatus;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatesCubit, int>(
      builder: (context, state) {
        return CustomElevatedButton(
          bottonStatus: bottonStatus,
          index: state,
          onPressed: () {
            context.read<StatesCubit>().changeState();
            _updateOrderStateFun(state, context);
          },
        );
      },
    );
  }

  void _updateOrderStateFun(int state, BuildContext context) {
     if (state == 4) {
      context.read<UpdateOrderStateCubit>().updateOrderState(
        ' 678a9bb63745562ff48ce07b',
        {
          'status': 'completed',
        },
      );
    }
  }
}
