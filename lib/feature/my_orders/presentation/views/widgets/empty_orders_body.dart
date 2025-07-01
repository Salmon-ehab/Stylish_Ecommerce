import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/constant.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';

class EmptyOrdersBody extends StatelessWidget {
  const EmptyOrdersBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            SvgAssets.emptyOrderIcon,
            height: MyResponsive.height(context, 167),
            width: MyResponsive.width(context, 140),
            fit: BoxFit.fill,
          ),
          SizedBox(height: MyResponsive.height(context, 41)),
          const Text(
            "You don't have any active orders at this time",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                height: 1,
                fontWeight: FontWeight.w500,
                fontFamily: Constants.leagueSpartan,
                color: AppColor.appNameColor),
          )
        ],
      ),
    );
  }
}
