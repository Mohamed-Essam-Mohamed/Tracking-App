import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tracking_app/core/common/widget/custom_cache_network_image.dart';
import 'package:tracking_app/core/constants/app_assets.dart';
import 'package:tracking_app/core/constants/app_colors.dart';
import 'package:tracking_app/core/constants/app_values.dart';
import 'package:tracking_app/core/dialogs/app_dialogs.dart';
import 'package:tracking_app/core/extentions/media_query_extensions.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/core/theme/app_theme.dart';
import 'package:tracking_app/features/profile/presentation/view_model/profile/profile_cubit.dart';
import 'package:tracking_app/features/profile/presentation/view_model/profile/profile_state.dart';
import 'package:tracking_app/features/profile/presentation/widgets/language_bottom_sheet.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

const String defaultImage =
    "https://flower.elevateegy.com/uploads/5cf4ea12-59f7-4e5c-bee1-8c30d9fa77e8-mu3ti.jpeg";

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.Profile_Profile.tr(),
            style: AppTheme.lightTheme.textTheme.titleLarge),
        leading: const Icon(
          Icons.arrow_back_ios,
          size: 28,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          spacing: 24,
          children: [
            BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {
                if (state.isLogOutLoading) {
                  AppDialogs.showLoadingDialog(context);
                }
                if (state.isLogOutSuccess) {
                  context.pushNamed(Routes.login);
                }
              },
              builder: (context, state) {
                if (state.isGetProfileLoading || state.isGetProfileFailure) {
                  return const Skeletonizer(
                    child: Column(
                      spacing: 24,
                      children: [
                        InfoDriverWidget(
                          imageUrl: defaultImage,
                          email: 'OxJt2@example.com',
                          name: 'John Doe',
                          phone: '+20123456789',
                        ),
                        InfoVehicleWidget(
                          vehicleType: 'Truck',
                          vehicleId: '1234567890',
                        ),
                      ],
                    ),
                  );
                }
                return Column(
                  spacing: 24,
                  children: [
                    InfoDriverWidget(
                      imageUrl: state.profileData.driver.phone,
                      email: state.profileData.driver.email,
                      name:
                          '${state.profileData.driver.firstName} ${state.profileData.driver.lastName}',
                      phone: state.profileData.driver.phone,
                    ),
                    InfoVehicleWidget(
                      vehicleType: 'Truck',
                      vehicleId: state.profileData.driver.vehicleNumber,
                    ),
                  ],
                );
              },
            ),
            ButtonLang(
              leading: SvgPicture.asset(
                SvgAsset.translate,
                height: 20,
                width: 20,
                color: AppColors.black,
              ),
              trailing: Text(
                context.locale.languageCode == AppValues.english
                    ? LocaleKeys.profile_English.tr()
                    : LocaleKeys.profile_Arabic.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              title: LocaleKeys.profile_Language.tr(),
              onTap: () {
                _showBottomSheetLang(context);
              },
            ),
            ButtonLang(
              leading: const Icon(Icons.logout_sharp),
              trailing: const Icon(
                Icons.logout_sharp,
                size: 30,
              ),
              title: LocaleKeys.profile_Logout.tr(),
              onTap: () {
                context.read<ProfileCubit>().doIntent(LogoutAction());
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheetLang(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const LanguageBottomSheet(),
    );
  }
}

class InfoDriverWidget extends StatelessWidget {
  const InfoDriverWidget({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.email,
    required this.phone,
    this.onPressed,
  });
  final String imageUrl;
  final String name;
  final String email;
  final String phone;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListTile(
          leading: CustomCacheNetworkImage(
            imageUrl: imageUrl,
            height: 50,
            width: 50,
            isCircular: true,
            fit: BoxFit.cover,
          ),
          title: Text(
            name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            "$email\n$phone",
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.start,
          ),
          trailing: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}

class InfoVehicleWidget extends StatelessWidget {
  const InfoVehicleWidget({
    super.key,
    required this.vehicleType,
    required this.vehicleId,
    this.onPressed,
  });
  final String vehicleType;
  final String vehicleId;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: ListTile(
          title: Text(
            'Vehicle Info',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            "$vehicleType\n$vehicleId",
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.start,
          ),
          trailing: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.arrow_forward_ios,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonLang extends StatelessWidget {
  const ButtonLang({
    super.key,
    this.leading,
    required this.trailing,
    required this.title,
    required this.onTap,
  });

  final Widget? leading;
  final Widget trailing;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 8),
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            leading ?? const SizedBox.shrink(),
            const SizedBox(width: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: AppColors.black,
                  ),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            trailing,
          ],
        ),
      ),
    );
  }
}
