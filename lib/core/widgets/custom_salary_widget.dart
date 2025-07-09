import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';

class CustomSalaryWidget extends StatelessWidget {
  const CustomSalaryWidget(
      {super.key,
      this.isNeeded = true,
      this.salary,
      required this.quantity,
      required this.onIncrease,
      required this.onDecrease,  });
  final bool? isNeeded;
  final int quantity;
  final double? salary;

  final VoidCallback onIncrease;
  final VoidCallback onDecrease;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isNeeded == true && salary != null
            ? Text('₹ ${quantity * salary!} ',
                style: Styles.text20W600.copyWith(color: AppColor.appNameColor))
            : const SizedBox.shrink(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: onDecrease,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: quantity == 1
                      ? AppColor.pinkColor2
                      : AppColor.appNameColor, // لون وردي فاتح
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.remove,
                  color: AppColor.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Text('$quantity',
                  style:
                      Styles.text24W800.copyWith(fontWeight: FontWeight.w400)),
            ),
            InkWell(
              onTap: onIncrease,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: AppColor.appNameColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Icon(
                  Icons.add,
                  color: AppColor.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
