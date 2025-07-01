import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';
import 'package:shop_ecommerce/feature/cart/presentation/views/cart_view.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/home_view.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/trending_view.dart';
import 'package:shop_ecommerce/feature/profile/presentation/views/profile_view.dart';

class BottomNavBarWidget extends StatefulWidget {
  const BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  int _currentIndex = 0;
  List<Widget> screens = const [
    HomeView(),
    TrendingView(),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            MyNavigator.goTo(screen: ()=>const CartView());
          },
          backgroundColor: AppColor.appNameColor,
          shape: const CircleBorder(),
          child: SvgPicture.asset(SvgAssets.bagIcon),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: AppColor.appNameColor,
          unselectedItemColor: AppColor.blackColor,
          backgroundColor: AppColor.backGroundColor,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle:
              Styles.text12W500.copyWith(color: AppColor.appNameColor),
          unselectedLabelStyle:
              Styles.text12W500.copyWith(color: AppColor.blackColor),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                SvgAssets.homeNavIcon,
                colorFilter: ColorFilter.mode(
                  _currentIndex == 0
                      ? AppColor.appNameColor
                      : AppColor.blackColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                SvgAssets.shoppingNavIcon,
                colorFilter: ColorFilter.mode(
                  _currentIndex == 1
                      ? AppColor.appNameColor
                      : AppColor.blackColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Items',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                SvgAssets.profileNavIcon,
                colorFilter: ColorFilter.mode(
                  _currentIndex == 2
                      ? AppColor.appNameColor
                      : AppColor.blackColor,
                  BlendMode.srcIn,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
        body: IndexedStack(
          index: _currentIndex,
          children: screens,
        ));
  }
}
