import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/constant.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';

class CustomButtonOrder extends StatelessWidget {
  const CustomButtonOrder({
    super.key,
    required this.onPressed,
    required this.title,
    this.height = 26,
  });
  final void Function() onPressed;
  final String title;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.appNameColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        child: Text(title,
            style: Styles.text15W500
                .copyWith(fontFamily: Constants.leagueSpartan)),
      ),
    );
  }
}
