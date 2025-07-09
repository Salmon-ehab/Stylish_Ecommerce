import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/cache/cache_helper.dart';
import 'package:shop_ecommerce/core/cache/cache_key.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/widgets/bottom_nav_bar.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/get_start_view.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:shop_ecommerce/feature/splash_screen/presentation/views/onboarding_view.dart';

import '../../../../core/cache/cache_data.dart';

class SplashCubit extends Cubit<void> {
  SplashCubit() : super(null);
  static SplashCubit get(context) => BlocProvider.of(context);
  
  void startTimer(context) async {
    await Future.delayed(const Duration(seconds: 3));
         CacheData.firstTime = CacheHelper.getData(key: CacheKey.firstTime);
      if (CacheData.firstTime != null) {
        CacheData.accessToken = CacheHelper.getData(key: CacheKey.accessToken);
        if (CacheData.accessToken != null) {
          UserCubit.get(context).getUserDataFromAPI();
          MyNavigator.goToOff(
              screen: () => const BottomNavBarWidget(), isReplaceOffAll: true);
        } else {
          MyNavigator.goToOff(
              screen: () => const GetStartView(), isReplaceOffAll: true);
        }
      } else {
        MyNavigator.goToOff(
            screen: () => const OnboardingView(), isReplaceOffAll: true);
      }
  }
}
