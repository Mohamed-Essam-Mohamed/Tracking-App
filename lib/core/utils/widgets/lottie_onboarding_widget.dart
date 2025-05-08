import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tracking_app/core/constants/app_assets.dart';
import 'package:tracking_app/core/extentions/media_query_extensions.dart';

class LottieOnboardingWidget extends StatelessWidget {
  const LottieOnboardingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(-310, 0),
      child: Lottie.asset(
        LottieAsset.onBoarding,
        height: context.hp(58),
        repeat: true,
        fit: BoxFit.cover,
      ),
    );
  }
}
