import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/constants/constant_fonts.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class SignUpRichText extends StatelessWidget {
  const SignUpRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: MyResponsive.width(context, 29),
        end: MyResponsive.width(context, 87),
        top: MyResponsive.height(context, 11),
        bottom: MyResponsive.height(context, 28),
      ),
      child: RichText(
          text: TextSpan(
              style: Styles.text12W400.copyWith(fontFamily: Constants.appFont),
              children: [
            TextSpan(text: S.of(context).Byclickingthe),
            TextSpan(
                text: S.of(context).register,
                style: const TextStyle(color: AppColor.orange)),
            TextSpan(text: S.of(context).youAgreeto),
          ])),
    );
  }
}
