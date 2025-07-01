import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/views/widgets/order_widget.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/views/widgets/status_order_row.dart';

class CompletedBody extends StatelessWidget {
  const CompletedBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
        child: OrderWidget(
            orderStatusWidget: StatusOrderRow(
                icon: SvgAssets.completedIcon, title: "Order delivered"))
        // EmptyOrdersBody()
        );
  }
}
