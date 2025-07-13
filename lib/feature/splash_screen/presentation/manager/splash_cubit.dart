import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/cache/cache_helper.dart';
import 'package:shop_ecommerce/core/cache/cache_key.dart';
import 'package:shop_ecommerce/core/go_route/routes.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/user_cubit/user_cubit.dart';

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
       await UserCubit.get(context).getUserDataFromAPI();
        MyNavigator.goToOffAll(context, Routes.bottomNavBarView);
      } else {
        MyNavigator.goToOffAll(context, Routes.getStartView);
      }
    } else {
        MyNavigator.goToOffAll(context, Routes.onboardingView);
    }
  }
}
