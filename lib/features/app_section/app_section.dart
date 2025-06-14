import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tracking_app/core/constants/app_assets.dart';
import 'package:tracking_app/core/constants/app_colors.dart';
import 'package:tracking_app/core/routes/routes.dart';
import 'package:tracking_app/features/auth/data/models/request/edit_profile_request.dart';
import 'package:tracking_app/features/auth/data/models/response/edit_profile_response.dart';
import 'package:tracking_app/features/auth/presentation/view/edit_profile_screen.dart';
import 'package:tracking_app/features/home/presentation/view/pending_order_screen.dart';
import 'package:tracking_app/features/order/presentation/view/order_screen.dart';
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
    const OrderScreen(),
     EditProfileScreen(userData:EditProfileRequest(firstName: "amr",lastName: "nabil",email: "amira333@gmail.com",phone: "+201070498179",url: "https://www.pandaancha.mx/plds/articulos/froala/bing-image-creator-crea-imagenes-ia-bing-microsoft-edge-1-1200x1200-228971832.png") )
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
            label: LocaleKeys.Home_Categories.tr(),
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
