import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/di/injectable_initializer.dart';
import 'package:tracking_app/core/utils/text_styles.dart';
import 'package:tracking_app/feature/apply/presentation/cubits/apply_view_model/apply_view_model.dart';
import 'package:tracking_app/feature/apply/presentation/view/apply_view_body.dart';

class ApplyView extends StatelessWidget {
  ApplyView({super.key});

  ApplyViewModel applyViewModel = getIt.get<ApplyViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => applyViewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Apply',
            style: AppTextStyles.inter500_20,
          ),
        ),
        body: ApplyViewBody(applyViewModel: applyViewModel),
      ),
    );
  }
}
