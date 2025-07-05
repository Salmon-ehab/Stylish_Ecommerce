import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/widgets/custom_salary_container.dart';

class OrderDetailsSalary extends StatelessWidget {
  const OrderDetailsSalary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyResponsive.height(context, 288),
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColor.backGroundColor),
      child:const Column(
        children: [
        //   CustomSalaryContainer(),
           Spacer(),
        ],
      ),
    );
  }
}
