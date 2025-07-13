import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/utils/svg.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/get_order_cubit/get_order_cubit.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/get_order_cubit/get_order_state.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/views/widgets/empty_orders_body.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/views/widgets/order_widget.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/views/widgets/status_order_row.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class CancelledBody extends StatelessWidget {
  const CancelledBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetOrderCubit, GetOrderState>(builder: (context, state) {
      if (state is GetOrderLoadingState) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is GetOrderFailureState) {
        return Text(state.error);
      } else if (state is GetOrderSuccessState) {
        final cancelOrders = state.orderModel.orders?.canceled ?? [];
         if(cancelOrders.isEmpty){
          return const Center(child: EmptyOrdersBody());
        }
        return ListView.builder(
            itemBuilder: (context, index) {
              final canceledOrder = cancelOrders[index];
              return OrderWidget(
                orderStatusWidget:  StatusOrderRow(
                    icon: SvgAssets.cancelledIcon, title: S.of(context).orderCanceled),
                item: canceledOrder.items.first,
                date: canceledOrder.orderDate ?? '', orderEntity: canceledOrder,
              );
            },
            itemCount: cancelOrders.length);
      } else {
        return const Center(child: EmptyOrdersBody());
      }
    });
  }
}
