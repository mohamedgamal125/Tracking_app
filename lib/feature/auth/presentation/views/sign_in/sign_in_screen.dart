import 'package:flutter/material.dart';
import 'package:tracking_app/feature/auth/presentation/views/widgets/sign_in_view_body.dart';

import '../../../../../core/di/injectable_initializer.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/sign_in_cubit/sign_in_view_model.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  SignInViewModel signInViewModel = getIt.get<SignInViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(S.of(context).signIn)),
      body: SignInViewBody(signInViewModel: signInViewModel),
    );
  }
}
