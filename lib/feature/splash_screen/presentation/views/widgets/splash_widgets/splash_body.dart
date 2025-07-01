import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_ecommerce/core/cache/cache_data.dart';
import 'package:shop_ecommerce/core/cache/cache_helper.dart';
import 'package:shop_ecommerce/core/cache/cache_key.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';
import 'package:shop_ecommerce/core/widgets/bottom_nav_bar.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/sign_in_view.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:shop_ecommerce/feature/splash_screen/presentation/views/onboarding_view.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
   void startTimer(context) async {
    await Future.delayed(const Duration(seconds: 3), () {
      CacheData.firstTime = CacheHelper.getData(key: CacheKey.firstTime);
      if (CacheData.firstTime != null) {
        CacheData.accessToken = CacheHelper.getData(key: CacheKey.accessToken);
        if (CacheData.accessToken != null) {
          UserCubit.get(context).getUserDataFromAPI();
          MyNavigator.goTo(screen: () => const BottomNavBarWidget(), isReplace: true);
        } else {
          MyNavigator.goTo(screen: () => const SignInView(), isReplace: true);
        }
      } else // first time
      {
        MyNavigator.goTo(screen: () => const OnboardingView(), isReplace: true);
      }
    });
  }
  @override
  void initState() {
    super.initState();
    startTimer(context);
    // SplashCubit.get(context).startTimer(context);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            SvgAssets.appLogo,
            height: MyResponsive.height(context, 100),
            width: MyResponsive.width(context, 124),
          ),
          const SizedBox(width: 10),
          const Text(
            "Stylish",
            style: TextStyle(
                fontFamily: 'LibreCaslonText-Bold',
                fontSize: 40,
                color: AppColor.appNameColor),
          )
        ],
      ),
    );
  }
}
