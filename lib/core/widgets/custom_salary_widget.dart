import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/utils/styles.dart';

class CustomSalaryWidget extends StatefulWidget {
  const CustomSalaryWidget({super.key, this.isNeeded = true});
  final bool? isNeeded;
  @override
  State<CustomSalaryWidget> createState() => _CustomSalaryWidgetState();
}

class _CustomSalaryWidgetState extends State<CustomSalaryWidget> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        widget.isNeeded == true
            ? Text('${_quantity * 100} \$',
                style: Styles.text20W600.copyWith(color: AppColor.appNameColor))
            : const SizedBox.shrink(),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  if (_quantity > 1) {
                    _quantity--;
                  }
                });
              },
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: _quantity == 1
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
              child: Text('$_quantity',
                  style:
                      Styles.text24W800.copyWith(fontWeight: FontWeight.w400)),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  _quantity++;
                });
              },
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
