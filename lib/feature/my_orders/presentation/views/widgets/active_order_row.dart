import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/widgets/custom_button_order.dart';

class ActiveOrderRow extends StatelessWidget {
  const ActiveOrderRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButtonOrder(
          title: "Cancel",
          height: 21,
       
          onPressed: () {},
        ),
        CustomButtonOrder(
            title: "Track Driver", height: 21,  onPressed: () {}),
      ],
    );
  }
}
