import 'package:flutter/material.dart';
import 'package:tracking_app/feature/apply/presentation/view/widgets/success_apply_view_body.dart';

class SuccessApplyView extends StatelessWidget {
  const SuccessApplyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SuccessApplyViewBody(),
      ),
    );
  }
}


