import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';

class SalaryRowDetails extends StatelessWidget {
  const SalaryRowDetails(
      {super.key, required this.title, required this.salary});
  final String title;
  final String salary;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsetsDirectional.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: Styles.text16400),
          Text(
            "\$ $salary",
            style: Styles.text16W600,
          )
        ],
      ),
    );
  }
}
