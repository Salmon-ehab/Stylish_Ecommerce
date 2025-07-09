import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/widgets/custom_button.dart';
import 'package:shop_ecommerce/core/widgets/custom_salary_container.dart';
import 'package:shop_ecommerce/feature/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:shop_ecommerce/feature/check_out/presentation/views/check_out_view.dart';

class CustomSalaryCart extends StatelessWidget {
  const CustomSalaryCart({super.key, required this.isCartEmpty});
  final bool isCartEmpty;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyResponsive.height(context, 288),
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
                label: "Checkout",
                onTap: () {
                  isCartEmpty
                      ? ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Your Cart is Empty!",
                              style: TextStyle(color: AppColor.appNameColor),
                            ),
                            backgroundColor:
                                AppColor.white2, 
                            duration: Duration(seconds: 2),
                          ),
                        )
                      : MyNavigator.goTo(screen: () => const CheckOutView());
                }),
          )
        ],
      ),
    );
  }
}
