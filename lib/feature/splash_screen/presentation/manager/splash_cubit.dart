import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/cache/cache_helper.dart';
import 'package:shop_ecommerce/core/cache/cache_key.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/widgets/bottom_nav_bar.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/sign_in_view.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:shop_ecommerce/feature/splash_screen/presentation/views/onboarding_view.dart';

import '../../../../core/cache/cache_data.dart';

class SplashCubit extends Cubit<void> {
  SplashCubit() : super(null);
  static SplashCubit get(context) => BlocProvider.of(context);
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
}
