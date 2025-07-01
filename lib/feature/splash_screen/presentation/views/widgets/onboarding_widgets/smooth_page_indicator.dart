import 'package:flutter/material.dart';

import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/feature/splash_screen/data/onboarding_data/onboarding_content.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SmoothPageIndicatorWidget extends StatelessWidget {
  const SmoothPageIndicatorWidget({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: pageController,
      count: onboardingContent.length,
      effect: CustomizableEffect(
        activeDotDecoration: DotDecoration(
          width: 40,
          height: 8,
          color: AppColor.dotColor,
          borderRadius: BorderRadius.circular(100),
        ),
        dotDecoration: DotDecoration(
          width: 10,
          height:10,
          color: AppColor.dotColor.withOpacity(.2),
          borderRadius: BorderRadius.circular(100),
        ),
        spacing: 6,
      ),
    );
  }
}
