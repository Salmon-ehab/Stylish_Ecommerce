import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';

class DeliveryAddressWidget extends StatelessWidget {
  const DeliveryAddressWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(SvgAssets.locationIcon, height: 15, width: 12,color: AppColor.blackColor,),
       const SizedBox(width: 8),
        Text("Delivery Address",style: Styles.text14W600.copyWith(color: AppColor.blackColor))
      ],
    );
  }
}
