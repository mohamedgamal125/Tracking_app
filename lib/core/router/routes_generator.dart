import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/router/pages_routes.dart';
import 'package:tracking_app/feature/apply/presentation/view/apply_view.dart';
import 'package:tracking_app/feature/apply/presentation/view/success_apply_view.dart';
import 'package:tracking_app/feature/auth/presentation/views/forget_password/email_verification_screen.dart';
import 'package:tracking_app/feature/auth/presentation/views/forget_password/forget_paswerd_screen.dart';
import 'package:tracking_app/feature/auth/presentation/views/sign_in/sign_in_screen.dart';
import 'package:tracking_app/feature/order_details/presentation/view/order_details_view.dart';
import 'package:tracking_app/feature/order_details/presentation/view/route_view.dart';
import 'package:tracking_app/layout/presentation/views/layout_screen.dart';
import 'package:tracking_app/main_view.dart';

import '../../feature/auth/presentation/views/on_boarding/on_boarding_view.dart';
import '../../feature/auth/presentation/views/forget_password/reset_password_screen.dart';
import '../../feature/home/domain/entites/pending_orders_response_entity.dart';
import '../../feature/order_details/presentation/cubits/routes_cubit/routes_cubit.dart';
import '../di/injectable_initializer.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.signIn:
        return MaterialPageRoute(
          builder: (context) => SignInScreen(),
          settings: settings,
        );

      case PagesRoutes.mainView:
        return MaterialPageRoute(
          builder: (context) => MainView(),
          settings: settings,
        );

      case PagesRoutes.successApplyView:
        return MaterialPageRoute(
          builder: (context) => const SuccessApplyView(),
          settings: settings,
        );
      case PagesRoutes.applyView:
        return MaterialPageRoute(
          builder: (context) => ApplyView(),
          settings: settings,
        );
      case PagesRoutes.onBoarding:
        return MaterialPageRoute(
          builder: (context) => OnBoardingScreen(),
          settings: settings,
        );

      case PagesRoutes.forgetPassword:
        return MaterialPageRoute(
          builder: (context) => ForgetPasswordScreen(),
          settings: settings,
        );

      case PagesRoutes.emailVerification:
        return MaterialPageRoute(
            builder: (context) => EmailVerificationScreen(),
            settings: settings);

      case PagesRoutes.orderDetails:
        return MaterialPageRoute(
            builder: (context) => OrderDetailsView(), settings: settings);

      case PagesRoutes.resetPassword:
        return MaterialPageRoute(
          builder: (context) => ResetPasswordScreen(),
          settings: settings,
        );
      case PagesRoutes.layoutView:
        return MaterialPageRoute(
          builder: (context) => LayoutScreen(),
          settings: settings,
        );
      case PagesRoutes.routeView:
        final args = settings.arguments as Map<String, dynamic>;
        final OrderEntity order = args['order'];
        final String selectedAddress = args['selectedAddress'];
        return MaterialPageRoute(
          builder: (context) => BlocProvider<RouteCubit>(
            create: (_) => getIt<RouteCubit>()..loadRoute(),
            child: RouteView(
              order: order,
              selectedAddress: selectedAddress,
            ),
          ),
          settings: settings,
        );
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
