import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/feature/splash_screen/presentation/manager/onboarding_cubit.dart';
import 'package:shop_ecommerce/feature/splash_screen/presentation/views/widgets/onboarding_widgets/onboarding_pageview.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: const Scaffold(
        backgroundColor: AppColor.white1,
        body: OnboardingPageview(),
      ),
    );
  }
}
