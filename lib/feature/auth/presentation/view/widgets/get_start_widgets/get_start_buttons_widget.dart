import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/cache/cache_helper.dart';
import 'package:shop_ecommerce/core/cache/cache_key.dart';
import 'package:shop_ecommerce/core/go_route/routes.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/widgets/custom_button.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/widgets/get_start_widgets/custom_get_start_button.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class GetStartButtonsWidget extends StatelessWidget {
  const GetStartButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37),
          child: Text(
            S.of(context).getStartTitle1,
            style: Styles.text34W600,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 24),
          child: Text(
            S.of(context).getStartTitle2,
            style: Styles.text14W400,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 55),
          child: CustomButton(
            label: S.of(context).login,
            fontSize: 23,
            onTap: () async {
              await CacheHelper.saveData(key: CacheKey.firstTime, value: false);
              MyNavigator.goTo(context,Routes.signInView);
            },
          ),
        ),
        const Padding(
          padding: EdgeInsetsDirectional.only(
              start: 55, end: 55, bottom: 34, top: 15),
          child: CustomGetStartButton(),
        )
      ],
    );
  }
}
