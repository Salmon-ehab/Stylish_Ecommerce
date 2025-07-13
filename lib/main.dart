import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shop_ecommerce/core/go_route/app_router.dart';
import 'package:shop_ecommerce/core/network/dio_consumer.dart';
import 'package:shop_ecommerce/core/services/service_locator.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/constants/constant_fonts.dart';
import 'package:shop_ecommerce/feature/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:shop_ecommerce/feature/profile/data/repo/get_data_repo/get_data_imple.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:shop_ecommerce/feature/search/data/repo/search_repo_imple.dart';
import 'package:shop_ecommerce/feature/search/presentation/manager/search_cubit.dart';
import 'package:shop_ecommerce/feature/search/presentation/views/widgets/search_widget.dart/search_body.dart';
import 'package:shop_ecommerce/feature/settings/presentation/manager/language_manager/language_cubit.dart';
import 'package:shop_ecommerce/feature/settings/presentation/manager/language_manager/language_state.dart';
import 'package:shop_ecommerce/generated/l10n.dart';
import 'core/cache/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await setUpServiceLocator();
  final languageCubit = LanguageCubit();
  languageCubit.getSavedLanguage();

  runApp(
    BlocProvider(
      create: (_) => languageCubit,
      child: const ShopApp(),
    ),
  );
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CartCubit(),
        ),
        BlocProvider<UserCubit>(
          create: (context) =>
              UserCubit(GetDataRepoImple(DioConsumer(dio: Dio()))),
        ),
        BlocProvider(
            create: (_) => SearchCubit(
                SearchRepoImple(apiConsumer: DioConsumer(dio: Dio()))),
            child: const SearchBody()),
      ],
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            locale: state.locale,
            supportedLocales: S.delegate.supportedLocales,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColor.backGroundColor,
              appBarTheme: const AppBarTheme(color: AppColor.backGroundColor),
              fontFamily: Constants.appFont,
              useMaterial3: true,
            ),
          );
        },
      ),
    );
  }
}
