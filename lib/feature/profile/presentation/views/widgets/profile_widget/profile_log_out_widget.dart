import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shop_ecommerce/core/go_route/routes.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class ProfileLogOutWidget extends StatelessWidget {
  const ProfileLogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Divider(color: AppColor.appNameColor),
        const SizedBox(height: 42),
        InkWell(
            onTap: () {
              MyNavigator.goToOff(context, Routes.getStartView);
            },
            child: Row(children: [
              Transform.rotate(
                angle: Intl.defaultLocale == 'ar' ? 3.14 : 0,
                child: SvgPicture.asset(
                  SvgAssets.logoutIcon,
                  height: 24,
                  width: 24,
                ),
              ),
              const SizedBox(width: 18),
              Text(S.of(context).logOut, style: Styles.text18W500),
            ]))
      ],
    );
  }
}
