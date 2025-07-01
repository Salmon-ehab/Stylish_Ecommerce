import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';

import '../../../../../core/utils/styles.dart';

class LanguageSwitcher extends StatelessWidget {
  final bool isEnglishSelected;
  final VoidCallback onToggle;

  const LanguageSwitcher({
    super.key,
    required this.isEnglishSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggle,
      child: Container(
        height: 36,
        width: MyResponsive.width(context, 102),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColor.appNameColor,
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: isEnglishSelected
                      ? AppColor.pinkColor2
                      : AppColor.appNameColor,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(Intl.defaultLocale == "en" ? 5 : 0),
                    right: Radius.circular(Intl.defaultLocale == "en" ? 0 : 5),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'AR',
                  style: Styles.text20W400.copyWith(
                    color: isEnglishSelected
                        ? AppColor.blackColor
                        : AppColor.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: isEnglishSelected
                      ? AppColor.appNameColor
                      : AppColor.pinkColor2,
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(Intl.defaultLocale == "en" ? 0 : 5),
                    right: Radius.circular(Intl.defaultLocale == "en" ? 5 : 0),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  'EN',
                  style: Styles.text20W400.copyWith(
                    color: isEnglishSelected
                        ? AppColor.white
                        : AppColor.blackColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
