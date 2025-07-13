import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';
import 'package:shop_ecommerce/feature/check_out/presentation/views/widget/check_out_widgets/address_detials_widget.dart';

class AddressWidget extends StatelessWidget {
  const AddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       const AddressDetialsWidget(),
        Container(
          height: MyResponsive.height(context, 79),
          width: MyResponsive.width(context, 78),
          decoration: BoxDecoration(
              color: AppColor.appNameColor,
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
          child: Center(
              child: SvgPicture.asset(SvgAssets.locationIcon,
                  height: 41, width: 33)),
        )
      ],
    );
  }
}
