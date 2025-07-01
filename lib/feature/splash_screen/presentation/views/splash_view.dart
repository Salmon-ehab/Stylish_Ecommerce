import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/feature/splash_screen/presentation/manager/splash_cubit.dart';
import 'package:shop_ecommerce/feature/splash_screen/presentation/views/widgets/splash_widgets/splash_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> SplashCubit(),
      child: const Scaffold(
        backgroundColor: AppColor.white1,
        body: SplashBody(),
      ),
    );
  }
}