import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';

class ProfileTabsWidget extends StatelessWidget {
  const ProfileTabsWidget({
    super.key,
    required this.iconPath,
    required this.tabTitle,
    required this.onTap,
  });
  final String iconPath;
  final String tabTitle;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 18),
          Text(tabTitle, style: Styles.text18W500),
          const Spacer(),
          IconButton(
              onPressed: onTap,
              icon: Intl.defaultLocale == 'ar'
                  ? SvgPicture.asset(SvgAssets.arrowIcon)
                  : Transform.rotate(
                      angle: 3.14,
                      child: SvgPicture.asset(SvgAssets.arrowIcon)))
        ],
      ),
    );
  }
}
