import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/widgets/custom_button.dart';
import 'package:shop_ecommerce/core/widgets/custom_salary_container.dart';
import 'package:shop_ecommerce/feature/check_out/presentation/views/check_out_view.dart';

class CustomSalaryCart extends StatelessWidget {
  const CustomSalaryCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyResponsive.height(context, 288),
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColor.backGroundColor),
      child: Column(
        children: [
         const CustomSalaryContainer(),
        const Spacer(),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 16, end: 10, bottom: 10),
            child: CustomButton(
                label: "Checkout",
                onTap: () {
                  MyNavigator.goTo(screen: () => const CheckOutView());
                }),
          )
        ],
      ),
    );
  }
}
