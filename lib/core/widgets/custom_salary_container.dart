import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';
import 'package:shop_ecommerce/feature/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:shop_ecommerce/feature/cart/presentation/manager/cart_cubit/cart_state.dart';
import 'package:shop_ecommerce/feature/cart/presentation/views/widgets/salary_row_details.dart';

class CustomSalaryContainer extends StatelessWidget {
  const CustomSalaryContainer({super.key, required this.totalSalary});
  final double totalSalary;
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<CartCubit,CartState>(
      builder:(context,state){
        return Column(
        children: [
          const Divider(
            color: Color(0xffCACACA),
          ),
          const SizedBox(height: 18),
           SalaryRowDetails(title: "Subtotal", salary:totalSalary),
          const SalaryRowDetails(title: "Tax and Fees", salary: 3.00),
          const SalaryRowDetails(title: "Delivery Fee", salary: 2.00),
          const Divider(
            color: Color(0xffCACACA),
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total Order", style: Styles.text17W500),
              Text(
                "₹ ${totalSalary+5.00}",
                style: Styles.text16W600.copyWith(color: AppColor.appNameColor),
              )
            ],
          ),
          // const Spacer(),
        ],
      );
      } 
    );
  }
}
