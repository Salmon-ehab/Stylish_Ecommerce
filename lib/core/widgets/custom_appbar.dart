import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar(
      {super.key, this.appbarColor = AppColor.white1, this.title});
  final Color? appbarColor;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: appbarColor,
      leading: Padding(
        padding: const EdgeInsetsDirectional.only(start: 20),
        child: IconButton(
            onPressed: () {
              MyNavigator.pop(context);
            },
            icon: Intl.defaultLocale == 'en'
                ? SvgPicture.asset(SvgAssets.arrowIcon)
                : Transform.rotate(
                    angle: 3.14, child: SvgPicture.asset(SvgAssets.arrowIcon))),
      ),
      centerTitle: true,
      title:title != null? Text(title!,style:Styles.text18W600,) :const SizedBox.shrink(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight); 
}
