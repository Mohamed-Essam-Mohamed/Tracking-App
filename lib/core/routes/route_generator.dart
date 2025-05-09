import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracking_app/core/routes/animation_routes.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/features/app_section/app_section.dart';
import 'package:tracking_app/features/auth/presentation/view/apply_screen.dart';
import 'package:tracking_app/features/auth/presentation/view/login_screen.dart';
import 'package:tracking_app/features/auth/presentation/view/success_apply.dart';
import 'package:tracking_app/features/auth/presentation/view/onboarding_screen.dart';
import 'package:tracking_app/features/auth/presentation/view/email_verification_screen.dart';
import 'package:tracking_app/features/auth/presentation/view/forget_password_screen.dart';
import 'package:tracking_app/features/auth/presentation/view/reset_password_screen.dart';
import 'package:tracking_app/features/auth/presentation/view_model/forget_password/forget_password_cubit.dart';

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
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());

      case Routes.emailVerification:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: arg as ForgetPasswordCubit,
                  child: const EmailVerificationScreen(),
                ));
      case Routes.resetPassword:
        return MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: arg as ForgetPasswordCubit,
                  child: const ResetPasswordScreen(),
                ));
      default:
        return null;
    }
  }
}
