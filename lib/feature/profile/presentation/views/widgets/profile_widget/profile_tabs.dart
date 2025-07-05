import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/get_start_view.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/views/my_order_view.dart';
import 'package:shop_ecommerce/feature/profile/presentation/views/my_profile_view.dart';
import 'package:shop_ecommerce/feature/profile/presentation/views/widgets/profile_widget/profile_tabs_widget.dart';
import 'package:shop_ecommerce/feature/my_favorite/presentation/views/favorite_view.dart';
import 'package:shop_ecommerce/feature/settings/presentation/views/setting_view.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        ProfileTabsWidget(
            iconPath: SvgAssets.myProfileIcon,
            tabTitle: "My Profile",
            onTap: () {
              MyNavigator.goTo(screen: () => const MyProfileView());
            }),
        ProfileTabsWidget(
            iconPath: SvgAssets.myOrdersIcon,
            tabTitle: "My Orders",
            onTap: () {
              MyNavigator.goTo(screen: () => const MyOrderView());
            }),
        ProfileTabsWidget(
            iconPath: SvgAssets.myFavoritesIcon,
            tabTitle: "My Favorites",
            onTap: () {
              MyNavigator.goTo(screen: () => const FavoriteView());
            }),
        ProfileTabsWidget(
            iconPath: SvgAssets.settingIcon,
            tabTitle: "Settings",
            onTap: () {
              MyNavigator.goTo(screen: () => const SettingView());
            }),
        const SizedBox(height: 20),
        const Divider(color: AppColor.appNameColor),
        const SizedBox(height: 42),
        InkWell(
          onTap: () {
            MyNavigator.goToOff(
                screen: () => const GetStartView(), isReplaceOffAll: true);
          },
          child: Row(
            children: [
              Transform.rotate(
                angle: Intl.defaultLocale == 'ar' ? 3.14 : 0,
                child: SvgPicture.asset(
                  SvgAssets.logoutIcon,
                  height: 24,
                  width: 24,
                ),
              ),
              const SizedBox(width: 18),
              const Text("Log Out", style: Styles.text18W500),
            ],
          ),
        ),
      ],
    );
  }
}
