import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/core/router/pages_routes.dart';
import 'package:tracking_app/main_view.dart';

class RoutesGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRoutes.mainView:
        return MaterialPageRoute(
            builder: (context) => MainView(), settings: settings);

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