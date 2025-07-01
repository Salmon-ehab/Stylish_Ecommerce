import 'package:device_preview/device_preview.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:shop_ecommerce/core/network/dio_consumer.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/constant.dart';
import 'package:shop_ecommerce/feature/profile/data/repo/get_data_repo/get_data_imple.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:shop_ecommerce/feature/splash_screen/presentation/views/splash_view.dart';
import 'package:shop_ecommerce/generated/l10n.dart';
import 'core/cache/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(DevicePreview(builder: (context) => const ShopApp()));
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserCubit(GetDataRepoImple(DioConsumer(dio: Dio()))),
      child: GetMaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        locale: const Locale("en"),
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.backGroundColor,
          appBarTheme: const AppBarTheme(color: AppColor.backGroundColor),
          fontFamily: Constants.appFont,
          useMaterial3: true,
        ),
        home: const SplashView(),
      ),
    );
  }
}
