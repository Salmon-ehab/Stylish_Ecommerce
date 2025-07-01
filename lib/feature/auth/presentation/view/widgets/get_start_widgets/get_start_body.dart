import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/utils/png.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/widgets/custom_button.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/sign_in_view.dart';
import 'package:shop_ecommerce/feature/auth/presentation/view/widgets/get_start_widgets/custom_get_start_button.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class GetStartBody extends StatelessWidget {
  const GetStartBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(PngAssets.getStartViewImage),
                  fit: BoxFit.fill)),
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black,
                Colors.black.withOpacity(0.0),
              ],
              stops: const [0.0, 0.7],
            ),
          ),
        ),
        Column(
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
                onTap: () {
                  MyNavigator.goTo(
                      screen: () => const SignInView());
                },
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(
                  start: 55, end: 55, bottom: 34, top: 15),
              child: CustomGetStartButton(),
            )
          ],
        )
      ],
    );
  }
}
