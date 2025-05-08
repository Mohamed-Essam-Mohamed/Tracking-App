import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/widget/undefined_route.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/features/auth/presentation/view/Success_apply.dart';
import 'package:tracking_app/features/auth/presentation/view/onboarding_screen.dart';

import 'animation_routes.dart';

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case Routes.onboarding:
       return AnimationRoute(page: const OnboardingScreen());
      case Routes.successApply:
        return AnimationRoute(page: const SuccessApply());

      default:
        return AnimationRoute(page: UndefinedRoute());
    }
  }
}
