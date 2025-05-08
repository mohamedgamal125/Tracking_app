import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/feature/order_details/presentation/cubits/states_cubit.dart';
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
          },
        );
      },
    );
  }
}
