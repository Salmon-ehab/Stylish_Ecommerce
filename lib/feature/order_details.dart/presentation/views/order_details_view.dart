import 'package:flutter/material.dart';
import 'package:shop_ecommerce/core/widgets/custom_appbar.dart';
import 'package:shop_ecommerce/feature/my_orders/data/models/order_entity.dart';
import 'package:shop_ecommerce/feature/order_details.dart/presentation/views/widgets/order_details_body.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.orderEntity});
  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppbar(title:S.current.orderDetails),
      body: OrderDetailsBody(orderEntity: orderEntity),
    );
  }
}
