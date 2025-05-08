import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tracking_app/core/constants/app_colors.dart';
import 'package:tracking_app/core/constants/keys.dart';
import 'package:tracking_app/core/extentions/media_query_extensions.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/core/theme/app_theme.dart';
import 'package:tracking_app/core/utils/widgets/lottie_onboarding_widget.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LottieOnboardingWidget(),
            Text(  LocaleKeys.onBoarding_welcome_to.tr(),style: AppTheme.lightTheme.textTheme.titleLarge,),
            Text(  LocaleKeys.onBoarding_flowery_rider_app.tr(),style: AppTheme.lightTheme.textTheme.titleLarge,),
            SizedBox(height: context.hp(3),),
            SizedBox(width: double.infinity,child: ElevatedButton(onPressed: () {

              Navigator.of(context).pushReplacementNamed(Routes.login);
            },
                key: Key(TestKeys.loginOnboarding),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.pink, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),), padding: const EdgeInsets.symmetric(vertical: 13),),
                child:  Text(LocaleKeys.onBoarding_login.tr(), style: AppTheme.lightTheme.textTheme.titleSmall!.copyWith(color: AppColors.white),)),),
            SizedBox(height: context.hp(2),),
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () {},
              key: Key(TestKeys.applyOnboarding),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.white, side: BorderSide(color: AppColors.gray.withValues(alpha: 0.9)), padding: const EdgeInsets.symmetric(vertical: 13), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25),),),
                child: Text(LocaleKeys.onBoarding_Apply.tr(), style: AppTheme.lightTheme.textTheme.titleSmall!.copyWith(color:AppColors.gray ),),
              ),
            )

          ],
        ),
      ),
    );
  }
}
