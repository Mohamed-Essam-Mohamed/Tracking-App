import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/common/widget/undefined_route.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/features/app_section/app_section.dart';
import 'package:tracking_app/features/auth/presentation/view/email_verification_screen.dart';
import 'package:tracking_app/features/auth/presentation/view/forget_password_screen.dart';
import 'package:tracking_app/features/auth/presentation/view/reset_password_screen.dart';
import 'package:tracking_app/features/auth/presentation/view_model/forget_password/forget_password_cubit.dart';

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
      // case Routes.onboarding:
      // return AnimationRoute(page: const HelloAuthScreen());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => ForgetPasswordScreen());

      case Routes.emailVerification:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: arg as ForgetPasswordCubit,
                  child: EmailVerificationScreen(),
                ));
      case Routes.resetPassword:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: arg as ForgetPasswordCubit,
                  child: ResetPasswordScreen(),
                ));
      default:
        return null;
    }
  }
}
