import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tracking_app/core/router/pages_routes.dart';
import 'package:tracking_app/core/router/routes_generator.dart';
import 'package:tracking_app/core/services/screen_size_service.dart';
import 'package:tracking_app/core/utils/theming.dart';

import 'main_view.dart';

void main() {
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
  MainAppContent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      onGenerateRoute: RoutesGenerator.onGenerateRoute,
      initialRoute: PagesRoutes.mainView,
    );
  }

  int sum(int a, int b)
  {
    return a+b;
  }
}
