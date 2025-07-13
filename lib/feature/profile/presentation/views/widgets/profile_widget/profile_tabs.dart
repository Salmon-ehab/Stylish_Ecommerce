import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/go_route/routes.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';
import 'package:shop_ecommerce/feature/profile/presentation/views/widgets/profile_widget/profile_log_out_widget.dart';
import 'package:shop_ecommerce/feature/profile/presentation/views/widgets/profile_widget/profile_tabs_widget.dart';
import '../../../../../../generated/l10n.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        ProfileTabsWidget(
            iconPath: SvgAssets.myProfileIcon,
            tabTitle: S.of(context).myProfile,
            onTap: () {
              MyNavigator.goTo(context, Routes.myProfileView);
            }),
        ProfileTabsWidget(
            iconPath: SvgAssets.myOrdersIcon,
            tabTitle: S.of(context).myOrders,
            onTap: () {
              MyNavigator.goTo(context, Routes.myOrderView);
            }),
        ProfileTabsWidget(
            iconPath: SvgAssets.myFavoritesIcon,
            tabTitle: S.of(context).myfavorites,
            onTap: () {
              MyNavigator.goTo(context, Routes.myFavoriteView);
            }),
        ProfileTabsWidget(
            iconPath: SvgAssets.settingIcon,
            tabTitle: S.of(context).settings,
            onTap: () {
              MyNavigator.goTo(context, Routes.settingView);
            }),
        const ProfileLogOutWidget()
      ],
    );
  }
}
