import 'package:flutter/material.dart';
import 'package:shop_ecommerce/feature/splash_screen/data/onboarding_data/onboarding_content.dart';
import 'package:shop_ecommerce/feature/splash_screen/data/onboarding_data/onboarding_model.dart';
import 'package:shop_ecommerce/feature/splash_screen/presentation/manager/onboarding_cubit.dart';
import 'package:shop_ecommerce/feature/splash_screen/presentation/views/widgets/onboarding_widgets/onboarding_body.dart';

class OnboardingPageview extends StatelessWidget {
  const OnboardingPageview({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: OnboardingCubit.get(context).pageController,
        itemCount: onboardingContent.length,
        onPageChanged: (value) {
          OnboardingCubit.get(context).goToPage(value);
        },
        itemBuilder: (_, index) {
          return OnboardingBody(
            onboardingModel: OnboardingModel(
              image: onboardingContent[index].image,
              title: onboardingContent[index].title,
              subTitle: onboardingContent[index].subTitle,
              currentIndex: index,
              pageController: OnboardingCubit.get(context).pageController,
            ),
          );
        });
  }
}
