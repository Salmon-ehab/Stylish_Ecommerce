import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';
import 'package:shop_ecommerce/core/widgets/text_head_line.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/get_start_view.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/views/my_order_view.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/user_cubit/user_state.dart';
import 'package:shop_ecommerce/feature/profile/presentation/views/my_profile_view.dart';
import 'package:shop_ecommerce/feature/profile/presentation/views/widgets/custom_profile_image.dart';
import 'package:shop_ecommerce/feature/profile/presentation/views/widgets/profile_widget/profile_tabs_widget.dart';
import 'package:shop_ecommerce/feature/search/presentation/views/favorite_view.dart';
import 'package:shop_ecommerce/feature/settings/presentation/views/setting_view.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocBuilder<UserCubit, UserState>(builder: (context, state) {
            return Column(
              children: [
                const SizedBox(height: 23),
                const TextHeadLine(title: "Profile"),
                const SizedBox(height: 32),
                CustomProfileImage(
                    image: state is UserSuccessState &&
                            state.userModel.imagePath != null
                        ? state.userModel.imagePath
                        : null),
                const SizedBox(height: 19),
                Text(
                  state is UserSuccessState
                      ? state.userModel.name!
                      : "User full Name",
                  style:
                      Styles.text18W600.copyWith(color: AppColor.appNameColor),
                ),
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
                    MyNavigator.goTo(
                        screen: () => const GetStartView(), isReplace: true);
                  },
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        SvgAssets.logoutIcon,
                        height: 24,
                        width: 24,
                      ),
                      const SizedBox(width: 18),
                      const Text("Log Out", style: Styles.text18W500),
                    ],
                  ),
                ),
              ],
            );
          })),
    );
  }
}
