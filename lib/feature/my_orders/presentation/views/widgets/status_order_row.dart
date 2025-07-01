import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/constant.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';

class StatusOrderRow extends StatelessWidget {
  const StatusOrderRow({super.key, required this.icon, required this.title});
  final String icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, height: 12, width: 12),
        const SizedBox(width: 5),
        Text(
          title,
          style: Styles.text14W300.copyWith(
              color: AppColor.appNameColor,
              fontFamily: Constants.leagueSpartan),
        )
      ],
    );
  }
}
