import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';

class CustomShoppingItemDetails extends StatelessWidget {
  const CustomShoppingItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: 10, end: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Women’s Casual Wear",
              style: Styles.text14W600.copyWith(color: AppColor.blackColor)),
          Row(
            children: [
              Text("4.8",
                  style:
                      Styles.text12W500.copyWith(color: AppColor.blackColor)),
              const SizedBox(width: 5),
              SvgPicture.asset(
                SvgAssets.starIcon,
                height: 11,
                width: 11,
              ),
            ],
          ),
          Text("1 item",
              style: Styles.text12W500.copyWith(color: AppColor.blackColor)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("\$ 34.00",
                  style:
                      Styles.text16W600.copyWith(color: AppColor.blackColor)),
                 const Spacer(),

              Text("\$ 64.00",
                  style: Styles.text12W500.copyWith(
                    color: AppColor.grey9,
                    decoration: TextDecoration.lineThrough,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
