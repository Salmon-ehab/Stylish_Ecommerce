import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

import '../../../../../../core/utils/app_color.dart';

class AddressDetialsWidget extends StatelessWidget {
  const AddressDetialsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
          height: MyResponsive.height(context, 79),
          width: MyResponsive.width(context, 241),
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 6),
                    blurRadius: 14,
                    spreadRadius: -8,
                    color: AppColor.blackColor.withOpacity(.25)),
                BoxShadow(
                    offset: const Offset(0, -4),
                    blurRadius: 9,
                    spreadRadius: -7,
                    color: AppColor.blackColor.withOpacity(.25)),
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(S.of(context).address,
                  style:
                      Styles.text12W500.copyWith(color: AppColor.blackColor)),
                    const  SizedBox(height: 4),
              Text(S.of(context).typeAddhere,
                  style:
                      Styles.text12W400.copyWith(color: AppColor.blackColor)),
            ],
          ),
        );
  }
}