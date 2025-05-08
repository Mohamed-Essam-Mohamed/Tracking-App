import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/widget/undefined_route.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/features/auth/presentation/view/Success_apply.dart';
import 'package:tracking_app/features/auth/presentation/view/onboarding_screen.dart';

import '../../features/app_section/app_section.dart';
import '../../features/auth/presentation/view/apply_screen.dart';
import '../../features/onboarding.dart';
import '../../features/auth/presentation/view/login_screen.dart';
import 'animation_routes.dart';

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case Routes.onboarding:
       return AnimationRoute(page: const OnboardingScreen());
      case Routes.successApply:
        return AnimationRoute(page: const SuccessApply());
      case Routes.login:
        return AnimationRoute(page: const LoginScreen());
      case Routes.appSection:
        return AnimationRoute(page: const AppSection());
     case Routes.applyScreen:
      return AnimationRoute(page: const ApplyScreen());

      default:
        return null;
    }
  }
}
