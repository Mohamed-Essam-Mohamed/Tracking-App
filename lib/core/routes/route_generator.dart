import 'package:flutter/material.dart';
import 'package:tracking_app/core/common/widget/undefined_route.dart';
import 'package:tracking_app/core/routes/routes.dart';

import '../../features/auth/presentation/view/apply_screen.dart';
import '../../features/onboarding.dart';
import 'animation_routes.dart';

class RouteGenerator {
  static Route<dynamic>? getRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case Routes.onboarding:
       return AnimationRoute(page: const Onboarding());
     case Routes.applyScreen:
      return AnimationRoute(page: const ApplyScreen());

      default:
        return AnimationRoute(page: UndefinedRoute());
    }
  }
}
