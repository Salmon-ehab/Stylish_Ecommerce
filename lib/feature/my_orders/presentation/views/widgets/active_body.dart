import 'package:flutter/material.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/views/widgets/active_order_row.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/views/widgets/order_widget.dart';

class ActiveBody extends StatelessWidget {
  const ActiveBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: OrderWidget(orderStatusWidget: ActiveOrderRow())
        // EmptyOrdersBody()
        );
  }
}
