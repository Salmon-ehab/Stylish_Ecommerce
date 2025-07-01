import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/helper/my_responsive.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/core/widgets/custom_button.dart';
import 'package:shop_ecommerce/feature/cart/presentation/views/widgets/salary_row_details.dart';
import 'package:shop_ecommerce/feature/order_details.dart/presentation/views/order_details_view.dart';
import 'package:shop_ecommerce/feature/order_details.dart/presentation/views/widgets/track_buttons.dart';

class CustomSalaryContainer extends StatelessWidget {
  const CustomSalaryContainer({super.key, this.isNeeded =false});
  final bool? isNeeded;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MyResponsive.height(context, 288),
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColor.backGroundColor),
      child: Column(
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
          const Spacer(),
         isNeeded ==true?  Padding(
            padding:const EdgeInsetsDirectional.only(start: 16, end: 10, bottom: 10),
            child: CustomButton(label: "Checkout",onTap: (){
              MyNavigator.goTo(screen: ()=>const OrderDetailsView());
            }),
          ) :const Padding(
            padding: EdgeInsetsDirectional.only( bottom: 15),
            child:  TrackButtons(),
          )
        ],
      ),
    );
  }
}
