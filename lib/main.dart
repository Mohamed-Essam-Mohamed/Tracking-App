import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/core/constants/app_values.dart';
import 'package:tracking_app/core/di/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tracking_app/core/routes/route_generator.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/core/theme/app_theme.dart';
import 'package:tracking_app/core/utils/app_shared_preference.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    configureDependencies(),
    EasyLocalization.ensureInitialized(),
    SharedPreferencesUtils.init(),
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final prefs = await SharedPreferences.getInstance();
  final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
  final initialRoute = isLoggedIn ? Routes.appSection : Routes.forgetPassword;

  runApp(EasyLocalization(
    supportedLocales: AppValues.supportedLocales,
    fallbackLocale: AppValues.englishLocale,
    path: AppValues.pathTranslation,
    child: MyApp(initialRoute: initialRoute),
  ));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({super.key, required this.initialRoute});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.lightTheme,
      title: AppValues.appTitle,
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: initialRoute,
    );
  }
}
