

import 'package:shop_ecommerce/core/utils/svg.dart';
import 'package:shop_ecommerce/feature/splash_screen/data/onboarding_data/onboarding_model.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

List<OnboardingModel> onboardingContent = [
  OnboardingModel(
    image: SvgAssets.onboarding1,
    title: S.current.titleOnBoarding1,
    subTitle: S.current.subTitleOnboarding1,
  ),
  OnboardingModel(
    image: SvgAssets.onboarding3,
    title: S.current.titleOnBoarding2,
    subTitle: S.current.subTitleOnboarding2,
  ),
  OnboardingModel(
    image: SvgAssets.onboarding2,
    title: S.current.titleOnBoarding3,
    subTitle: S.current.subTitleOnboarding3,
  )
];
