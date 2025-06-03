import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:tracking_app/core/di/injectable_initializer.dart';
import 'package:tracking_app/core/router/pages_routes.dart';
import 'package:tracking_app/core/router/routes_generator.dart';
import 'package:tracking_app/core/services/screen_size_service.dart';
import 'package:tracking_app/core/services/shared_preference_services.dart';
import 'package:tracking_app/core/utils/constant_manager.dart';
import 'package:tracking_app/core/utils/theming.dart';
import 'package:tracking_app/firebase_options.dart';
import 'core/services/bloc_observer.dart';
import 'core/services/easy_loading_service.dart';
import 'core/services/localization_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'generated/l10n.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configureDependencies();
  Bloc.observer = MyBlocObserver();
  ConfigLoading().showLoading();
  await SharedPreferenceServices.init();

  runApp(
    ChangeNotifierProvider<LocaleProvider>(
      create: (_) => LocaleProvider(),
      child: const InitApp(),
    ),
  );
}

class InitApp extends StatelessWidget {
  const InitApp({super.key});

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
    final localeProvider = context.watch<LocaleProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      locale: localeProvider.locale,
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateRoute: RoutesGenerator.onGenerateRoute,
      // initialRoute: PagesRoutes.forgetPasswordو
      initialRoute:
      (SharedPreferenceServices.getData(AppConstants.token) != null &&
              (SharedPreferenceServices.getData(AppConstants.rememberMe)
                      as bool? ??
                  false))
          ? PagesRoutes.layoutView
          : PagesRoutes.onBoarding,
    );
  }
}