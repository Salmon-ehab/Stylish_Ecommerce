import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';

class CustomWelcomeText extends StatelessWidget {
  const CustomWelcomeText({super.key, required this.welcomeText});
  final String welcomeText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
          start: 32,
          end: MyResponsive.width(context, 158),
          top: MyResponsive.height(context, 25),
          bottom: MyResponsive.height(context, 33)),
      child:  Text(
       welcomeText,
        style: Styles.text36W700,
      ),
    );
  }
}
