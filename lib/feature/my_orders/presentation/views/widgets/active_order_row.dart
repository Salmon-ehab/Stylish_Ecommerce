import 'package:flutter/material.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/views/widgets/cancel_order_manager_widget.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/views/widgets/complete_order_manager_widget.dart'; // import هذا الكلاس

class ActiveOrderRow extends StatelessWidget {
  const ActiveOrderRow({super.key, required this.orderId});
  final int orderId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CancelOrderManagerWidget(orderId: orderId),
        const SizedBox(width: 2),
        CompleteOrderManagerWidget(orderId: orderId)
      ],
    );
  }
}
