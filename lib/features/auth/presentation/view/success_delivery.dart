import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tracking_app/core/constants/app_assets.dart';
import 'package:tracking_app/core/constants/app_colors.dart';
import 'package:tracking_app/core/constants/keys.dart';
import 'package:tracking_app/core/extentions/media_query_extensions.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';
import 'package:tracking_app/core/theme/app_theme.dart';

class SuccessDelivery extends StatelessWidget {
  const SuccessDelivery({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: context.hp(8)),
              Center(
                child: SvgPicture.asset(
                  SvgAsset.backgroundSuccessDelivery,
                  width: context.wp(26),
                  height: context.hp(26),
                ),
              ),
              SizedBox(height: context.sp(32)),
              Text(
                LocaleKeys.successDelivery_thank_you.tr(),
                style: AppTheme.lightTheme.textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w500, color: AppColors.green),
                textAlign: TextAlign.center,
              ),
              Text(
                LocaleKeys.successDelivery_order_delivered_success.tr(),
                style: AppTheme.lightTheme.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.sp(48)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    key: const Key(TestKeys.successDelivery),
                    onPressed: () {
                      // TODO: Complete button action upon full flow setup
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.pink,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      padding: const EdgeInsets.symmetric(vertical: 13),
                    ),
                    child: Text(
                      LocaleKeys.Authentication_Done.tr(),
                      style: AppTheme.lightTheme.textTheme.titleSmall!
                          .copyWith(color: AppColors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
