import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';

import 'package:shop_ecommerce/core/widgets/custom_image_item.dart';
import 'package:shop_ecommerce/core/widgets/total_order_widget.dart';

class CustomShoppingItem extends StatelessWidget {
  const CustomShoppingItem({super.key, required this.shoppingDetailsBody});
  final Widget shoppingDetailsBody;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyResponsive.height(context, 191),
      width: double.infinity,
      padding: const EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
      margin: const EdgeInsetsDirectional.only(bottom: 23),
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
        children: [
          SizedBox(
            height: MyResponsive.height(context, 125),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomImageItem(),
                Expanded(child: shoppingDetailsBody)
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            color: Color(0xffBBBBBB),
          ),
          const TotalOrderWidget()
        ],
      ),
    );
  }
}
