import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/png.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({super.key, required this.orderStatusWidget});
  final Widget orderStatusWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyResponsive.height(context, 106),
      width: double.infinity,
      margin: const EdgeInsetsDirectional.only(start: 19, end: 19, top: 19),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 4,
                spreadRadius: 0,
                color: AppColor.blackColor.withOpacity(.25))
          ]),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              PngAssets.productImage,
              height: MyResponsive.height(context, 106),
              width: MyResponsive.width(context, 103),
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(width: 11),
          Expanded(
              child: Padding(
            padding:
                const EdgeInsetsDirectional.only(top: 12, end: 15, bottom: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Mens Starry", style: Styles.text16W500),
                    Text("\$ 50",
                        style: Styles.text12W500
                            .copyWith(color: AppColor.blackColor)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("15/05/2005 1:30 pm",
                        style: Styles.text10W400
                            .copyWith(color: AppColor.blackColor)),
                    Text("1 item",
                        style: Styles.text10W400
                            .copyWith(color: AppColor.blackColor)),
                  ],
                ),
               orderStatusWidget
              ],
            ),
          ))
        ],
      ),
    );
  }
}
