import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.onTap,
      this.height = 55,
      required this.label,
      this.fontSize = 20});
  final void Function() onTap;
  final double? height;
  final String label;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColor.appNameColor,
            borderRadius: BorderRadius.circular(4)),
        child: Center(
            child: Text(
          label,
          style: Styles.text23W600.copyWith(fontSize: fontSize),
        )),
      ),
    );
  }
}
