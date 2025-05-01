import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tracking_app/core/di/injectable_initializer.dart';
import 'package:tracking_app/core/router/pages_routes.dart';
import 'package:tracking_app/core/router/routes_generator.dart';
import 'package:tracking_app/core/services/screen_size_service.dart';
import 'package:tracking_app/core/services/shared_preference_services.dart';
import 'package:tracking_app/core/utils/theming.dart';

import 'core/services/bloc_observer.dart';
import 'core/services/easy_loading_service.dart';
import 'main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  Bloc.observer = MyBlocObserver();
  ConfigLoading().showLoading();
  await SharedPreferenceServices.init();
  runApp(InitApp());
}

class InitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) {
          ScreenSizeService.init(context);

          return MainAppContent();
        },
      ),
      builder: EasyLoading.init(),
    );
  }
}

class MainAppContent extends StatelessWidget {
  const MainAppContent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      onGenerateRoute: RoutesGenerator.onGenerateRoute,
      initialRoute: PagesRoutes.successApplyView,
    );
  }

  int sum(int a, int b) {
    return a + b;
  }
}
