import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/feature/splash_screen/data/onboarding_data/onboarding_model.dart';


class OnboardingContentWidget extends StatelessWidget {
  const OnboardingContentWidget({super.key, required this.onboardingModel});
 final OnboardingModel onboardingModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  SvgPicture.asset(
                    onboardingModel.image,
                    height: MyResponsive.height(context, 300),
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    onboardingModel.title,
                    style: Styles.text24W800,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    onboardingModel.subTitle,
                    style: Styles.text14W600,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
  }
}