import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tracking_app/core/constants/app_assets.dart';
import 'package:tracking_app/core/constants/app_colors.dart';
import 'package:tracking_app/core/constants/keys.dart';
import 'package:tracking_app/core/extentions/media_query_extensions.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/theme/app_theme.dart';

class SuccessApply extends StatelessWidget {
  const SuccessApply({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: context.hp(7)),
              Center(
                child: SvgPicture.asset(
                  SvgAsset.taskAlt,
                  width: context.wp(26),
                  height: context.hp(26),
                  colorFilter: const ColorFilter.mode(AppColors.pink, BlendMode.srcIn),
                ),
              ),
              Text(
                LocaleKeys.successApply_Your_application_has_been.tr(),
                style: AppTheme.lightTheme.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              Text(
                LocaleKeys.successApply_submitted.tr(),
                style: AppTheme.lightTheme.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.hp(2)),
              Text(
                LocaleKeys.successApply_Thank_you_for_providing_your_application.tr(),
                style: AppTheme.lightTheme.textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                LocaleKeys.successApply_we_will_review_your_application_and_will.tr(),
                style: AppTheme.lightTheme.textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                LocaleKeys.successApply_get_back_to_you_soon.tr(),
                style: AppTheme.lightTheme.textTheme.titleSmall!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.hp(3)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    key: const Key(TestKeys.successApplyLogin),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, Routes.login);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.pink,
                      shape:
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                    ),
                    child: Text(
                      LocaleKeys.successApply_Login.tr(),
                      style: AppTheme.lightTheme.textTheme.titleSmall!
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Stack(
                children: [
                  Opacity(
                    opacity: 0.35,
                    child: SvgPicture.asset(SvgAsset.backgroundSuccessApply),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Opacity(
                      opacity: 0.35,
                      child: SvgPicture.asset(SvgAsset.backgroundSuccessApply2),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
