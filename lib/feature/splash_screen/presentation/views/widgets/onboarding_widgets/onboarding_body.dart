import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/get_start_view.dart';
import 'package:shop_ecommerce/feature/splash_screen/data/onboarding_data/onboarding_content.dart';
import 'package:shop_ecommerce/feature/splash_screen/data/onboarding_data/onboarding_model.dart';
import 'package:shop_ecommerce/feature/splash_screen/presentation/views/widgets/onboarding_widgets/onboarding_content_widget.dart';
import 'package:shop_ecommerce/feature/splash_screen/presentation/views/widgets/onboarding_widgets/onboarding_navigation_text.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

import '../../../../../../core/utils/styles.dart';


class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key, required this.onboardingModel});
  final OnboardingModel onboardingModel;
  @override
  
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsetsDirectional.only(bottom: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            onboardingModel.currentIndex! < onboardingContent.length - 1
                ? Padding(
                    padding: const EdgeInsetsDirectional.only(end: 18),
                    child: Row(
                      children: [
                        const Spacer(),
                        TextButton(
                            onPressed: () {
                              MyNavigator.goTo(
                                  screen: () => const GetStartView(),
                                  isReplace: true);
                            },
                            child: Text(
                              S.of(context).skip,
                              style: Styles.text18W600,
                            ))
                      ],
                    ),
                  )
                : const SizedBox(
                    height: 18,
                  ),
            OnboardingContentWidget(onboardingModel: onboardingModel),
            OnboardingNavigationText(onboardingModel: onboardingModel)
          ],
        ),
      ),
    );
  }
}
