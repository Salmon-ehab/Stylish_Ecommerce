import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/network/dio_consumer.dart';
import 'package:shop_ecommerce/feature/my_orders/data/repo/cancel_order_repo/cancel_order_repo_imple.dart';
import 'package:shop_ecommerce/feature/my_orders/data/repo/complete_order_repo/complete_order_repo_imple.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/cancel_order_cubit/cancel_order_cubit.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/complete_order_cubit/complete_order_cubit.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/get_order_cubit/get_order_cubit.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/get_order_cubit/get_order_state.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/views/widgets/active_order_row.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/views/widgets/empty_orders_body.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/views/widgets/order_widget.dart';

class ActiveBody extends StatelessWidget {
  const ActiveBody({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (_) => CancelOrderCubit(
                CancelOrderRepoImple(apiConsumer: DioConsumer(dio: Dio())))),
        BlocProvider(
            create: (_) => CompleteOrderCubit(
                CompleteOrderRepoImple(apiConsumer: DioConsumer(dio: Dio()))))
      ],
      child:
          BlocBuilder<GetOrderCubit, GetOrderState>(builder: (context, state) {
        if (state is GetOrderLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetOrderFailureState) {
          return Text(state.error);
        } else if (state is GetOrderSuccessState) {
          final activeOrders = state.orderModel.orders?.active ?? [];
           if(activeOrders.isEmpty){
          return const Center(child: EmptyOrdersBody());
        }
          return ListView.builder(
              itemBuilder: (context, index) {
                final order = activeOrders[index];
                return OrderWidget(
                  orderStatusWidget: ActiveOrderRow(orderId: order.id ?? 0),
                  item: order.items.first,
                  date: order.orderDate ?? "", orderEntity: order,
                );
              },
              itemCount: activeOrders.length);
        } else {
          return const Center(child: EmptyOrdersBody());
        }
      }),
    );
  }
}
