import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/feature/cart/presentation/views/widgets/salary_row_details.dart';

class CustomSalaryContainer extends StatelessWidget {
  const CustomSalaryContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Color(0xffCACACA),
        ),
        const SizedBox(height: 18),
        const SalaryRowDetails(title: "Subtotal", salary: "79.00"),
        const SalaryRowDetails(title: "Tax and Fees", salary: "3.00"),
        const SalaryRowDetails(title: "Delivery Fee", salary: "2.00"),
        const Divider(
          color: Color(0xffCACACA),
        ),
        const SizedBox(height: 18),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Order Total", style: Styles.text17W500),
            Text(
              "\$ 84.00",
              style: Styles.text16W600.copyWith(color: AppColor.appNameColor),
            )
          ],
        ),
        // const Spacer(),
      ],
    );
  }
}
