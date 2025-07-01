import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/constant.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';

class CustomAppLogo extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColor.white1,
        title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          SvgAssets.appLogo,
          height: 31,
          width: 38,
          fit: BoxFit.fill,
        ),
        const SizedBox(width: 5),
        Text("Stylish",
            style: Styles.text18W700.copyWith(fontFamily: Constants.libreFont))
      ],
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
