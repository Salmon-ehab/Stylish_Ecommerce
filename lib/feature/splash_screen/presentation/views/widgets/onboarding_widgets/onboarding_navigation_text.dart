import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/get_start_view.dart';
import 'package:shop_ecommerce/feature/splash_screen/data/onboarding_data/onboarding_content.dart';
import 'package:shop_ecommerce/feature/splash_screen/data/onboarding_data/onboarding_model.dart';
import 'package:shop_ecommerce/feature/splash_screen/presentation/manager/onboarding_cubit.dart';
import 'package:shop_ecommerce/feature/splash_screen/presentation/views/widgets/onboarding_widgets/smooth_page_indicator.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class OnboardingNavigationText extends StatelessWidget {
  final OnboardingModel onboardingModel;

  const OnboardingNavigationText({super.key, required this.onboardingModel});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (onboardingModel.currentIndex! > 0)
          TextButton(
            onPressed: () {
              OnboardingCubit.get(context).previousPage();
            },
            child: Text(
              S.of(context).prev,
              style: Styles.text14W600.copyWith(color: AppColor.grey2),
            ),
          )
        else
          const SizedBox(),
        SmoothPageIndicatorWidget(
            pageController: onboardingModel.pageController!),
        if (onboardingModel.currentIndex! < onboardingContent.length - 1)
          TextButton(
            onPressed: () {
              OnboardingCubit.get(context).nextPage();
            },
            child: Text(
              S.of(context).Next,
              style: Styles.text14W600.copyWith(color: AppColor.appNameColor),
            ),
          )
        else
          TextButton(
            onPressed: () {
              MyNavigator.goToOff(
                  screen: () => const GetStartView(), isReplaceOffAll: true);
            },
            child: Text(
              S.of(context).GetStarted,
              style: Styles.text14W600.copyWith(color: AppColor.appNameColor),
            ),
          ),
      ],
    );
  }
}
