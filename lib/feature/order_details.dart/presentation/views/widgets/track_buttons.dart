import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/widgets/custom_button_order.dart';

class TrackButtons extends StatelessWidget {
  const TrackButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButtonOrder(
          title: "Cancel Order",
          onPressed: () {},
        ),
        const SizedBox(width: 22),
        CustomButtonOrder(
          title: "Track Driver",
          onPressed: () {},
        ),
      ],
    );
  }
}
