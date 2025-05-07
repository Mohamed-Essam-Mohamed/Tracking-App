import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/widget/undefined_route.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/features/app_section/app_section.dart';

import '../../features/auth/presentation/view/login_screen.dart';
import 'animation_routes.dart';

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.appSection:
        return MaterialPageRoute(builder: (_) => const AppSection());
      case Routes.onboarding:
      // return AnimationRoute(page: const HelloAuthScreen());

      default:
        return AnimationRoute(page: UndefinedRoute());
    }
  }
}
