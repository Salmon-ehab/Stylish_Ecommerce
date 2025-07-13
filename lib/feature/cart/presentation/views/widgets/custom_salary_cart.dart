import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/go_route/routes.dart';
import 'package:shop_ecommerce/core/helper/app_snack_bar.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/widgets/custom_button.dart';
import 'package:shop_ecommerce/core/widgets/custom_salary_container.dart';
import 'package:shop_ecommerce/feature/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class CustomSalaryCart extends StatelessWidget {
  const CustomSalaryCart({super.key, required this.isCartEmpty});
  final bool isCartEmpty;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyResponsive.height(context, 300),
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColor.backGroundColor),
      child: Column(
        children: [
          CustomSalaryContainer(totalSalary: CartCubit.get(context).subtotal),
          const Spacer(),
          Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 16, end: 10, bottom: 10),
            child: CustomButton(
                label: S.of(context).checkout,
                onTap: () {
                  isCartEmpty
                      ? AppSnackBar.showError(
                          context: context, message: "Your Cart is Empty!")
                      : MyNavigator.goTo(context, Routes.checkOutView);
                }),
          )
        ],
      ),
    );
  }
}
