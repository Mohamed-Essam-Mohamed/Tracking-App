import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/core/constants/app_assets.dart';
import 'package:tracking_app/core/constants/app_colors.dart';
import 'package:tracking_app/core/di/service_locator.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/features/home/presentation/view/pending_order_screen.dart';
import 'package:tracking_app/features/my_orders/presentation/view/driver_orders_screen.dart';
import 'package:tracking_app/features/profile/presentation/view/profile_screen.dart';
import 'package:tracking_app/features/profile/presentation/view_model/profile/profile_cubit.dart';
import 'package:tracking_app/features/profile/presentation/view_model/profile/profile_state.dart';
import 'package:tracking_app/generated/locale_keys.g.dart';

Future<void> logout(BuildContext context) async {
  final pref = await SharedPreferences.getInstance();
  pref.setBool('isLoggedIn', false);
  Navigator.of(context).pushReplacementNamed(Routes.login);
}

class AppSection extends StatefulWidget {
  const AppSection({super.key});

  @override
  State<AppSection> createState() => _AppSectionState();
}

class _AppSectionState extends State<AppSection> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    const HomeScreen(),
    const MyOrdersPage(),
    BlocProvider<ProfileCubit>(
      create: (context) => serviceLocator<ProfileCubit>()..doIntent(GetProfileAction()),
      child: const ProfileScreen(),
    ),
  ];

  Key _cartKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: [
            _pages[0],
            _pages[1],
            _pages[2],
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (selectedIndex) {
          setState(() {
            _currentIndex = selectedIndex;

            // 👇 Regenerate cart key on cart tab tap
            // if (_currentIndex == 2) {
            //   _cartKey = UniqueKey();
            // }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: _iconBar(SvgAsset.home1),
            activeIcon: _activeIconBar(SvgAsset.home1),
            label: LocaleKeys.Home_Home.tr(),
          ),
          BottomNavigationBarItem(
            icon: _iconBar(SvgAsset.order),
            activeIcon: _activeIconBar(SvgAsset.order),
            label: LocaleKeys.Home_Orders.tr(),
          ),
          BottomNavigationBarItem(
            icon: _iconBar(SvgAsset.person),
            activeIcon: _activeIconBar(SvgAsset.person),
            label: LocaleKeys.Home_Cart.tr(),
          ),
        ],
      ),
    );
  }

  Widget _iconBar(String image) {
    return SvgPicture.asset(
      image,
      height: 27,
      width: 27,
    );
  }

  Widget _activeIconBar(String image) {
    return SvgPicture.asset(
      image,
      height: 27,
      width: 27,
      color: AppColors.pink[AppColors.colorCode50],
    );
  }
}