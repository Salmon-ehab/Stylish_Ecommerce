import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';

class TotalOrderWidget extends StatelessWidget {
  const TotalOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Order (1)   :",
                  style:
                      Styles.text12W500.copyWith(color: AppColor.blackColor)),
              Text("\$ 34.00",
                  style: Styles.text12W600.copyWith(color: AppColor.blackColor))
            ],
          );
  }
}