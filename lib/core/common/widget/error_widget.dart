import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tracking_app/core/constants/app_assets.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({this.height, this.width, this.onRetry, super.key});
  final double? height;
  final double? width;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(LottieAsset.empty, height: 150, repeat: true),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            LocaleKeys.profile_no_orders.tr(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}

class ErrorStateWidget extends StatelessWidget {
  const ErrorStateWidget(
      {this.height, this.width, this.onRetry, this.message, super.key});
  final double? height;
  final double? width;
  final String? message;
  final VoidCallback? onRetry;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Lottie.asset(LottieAsset.error, height: 110, repeat: true),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message ?? LocaleKeys.Error_general_error.tr(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
        OutlinedButton(
          onPressed: onRetry,
          child: Text(
            LocaleKeys.Retry.tr(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
