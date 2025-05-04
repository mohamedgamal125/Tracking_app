import 'package:flutter/material.dart';
import 'package:tracking_app/core/router/pages_routes.dart';
import 'package:tracking_app/feature/apply/presentation/view/on_boarding_view.dart';
import 'package:tracking_app/feature/apply/presentation/view/success_apply_view.dart';
import 'package:tracking_app/feature/auth/presentation/views/email_verification_screen.dart';
import 'package:tracking_app/feature/auth/presentation/views/forget_paswerd_screen.dart';
import 'package:tracking_app/main_view.dart';

import '../../feature/auth/presentation/views/reset_password_screen.dart';


class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.mainView:
        return MaterialPageRoute(
            builder: (context) => MainView(), settings: settings);

      case PagesRoutes.successApplyView:
        return MaterialPageRoute(
          builder: (context) => const SuccessApplyView(),
          settings: settings,
        );
      case PagesRoutes.onBoarding:
        return MaterialPageRoute(builder: (context) => OnBoardingScreen(), settings: settings);

      case PagesRoutes.forgetPassword:
        return MaterialPageRoute(builder: (context) => ForgetPasswordScreen(), settings: settings);

      case PagesRoutes.emailVerification:
        return MaterialPageRoute(builder: (context) => EmailVerificationScreen(), settings: settings);

      case PagesRoutes.resetPassword:
        return MaterialPageRoute(builder: (context) => ResetPasswordScreen(), settings: settings);
      default:
        return unDefinedRoute();
    }
  }
}

Route<dynamic> unDefinedRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Un defined route"),
          centerTitle: true,
        ),
        body: const Center(child: Text("Un defined route")),
      );
    },
  );
}
