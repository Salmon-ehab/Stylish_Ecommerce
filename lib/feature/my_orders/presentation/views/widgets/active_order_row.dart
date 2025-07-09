import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/widgets/custom_button_order.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/cancel_order_cubit/cancel_order_cubit.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/cancel_order_cubit/cancel_order_state.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/complete_order_cubit/complete_order_cubit.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/complete_order_cubit/complete_order_state.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/get_order_cubit/get_order_cubit.dart'; // import هذا الكلاس

class ActiveOrderRow extends StatelessWidget {
  const ActiveOrderRow({super.key, required this.orderId});
  final int orderId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BlocListener<CancelOrderCubit, CancelOrderState>(
          listenWhen: (previousState, currentState) {
            return (currentState is CancelOrderSuccessState &&
                    previousState is! CancelOrderSuccessState) ||
                (currentState is CancelOrderFailureState &&
                    previousState is! CancelOrderFailureState);
          },
          listener: (context, state) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            if (state is CancelOrderSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.responseModel.message),
                  duration: const Duration(seconds: 2),
                ),
              );
              GetOrderCubit.get(context).fetchOrders();
            } else if (state is CancelOrderFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  duration: const Duration(seconds: 3),
                  backgroundColor: Colors.red,
                ),
              );
              // BlocProvider.of<GetOrderCubit>(context).getOrders();
            }
          },
          child: CustomButtonOrder(
            title: "Cancel",
            height: 21,
            onPressed: () {
              CancelOrderCubit.get(context).cancelOrder(orderId: orderId);
            },
          ),
        ),
        BlocListener<CompleteOrderCubit, CompleteOrderState>(
          listenWhen: (previousState, currentState) {
            return (currentState is CompleteOrderSuccessState &&
                    previousState is! CompleteOrderSuccessState) ||
                (currentState is CompleteOrderFailureState &&
                    previousState is! CompleteOrderFailureState);
          },
          listener: (context, state) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            if (state is CompleteOrderSuccessState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.responseModel.message),
                  duration: const Duration(seconds: 2),
                ),
              );
              GetOrderCubit.get(context).fetchOrders();
            } else if (state is CompleteOrderFailureState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  duration: const Duration(seconds: 3),
                  backgroundColor: Colors.red,
                ),
              );}
          },
          child: CustomButtonOrder(
              title: "Complete",
              height: 21,
              onPressed: () {
                CompleteOrderCubit.get(context)
                    .fetchOrderCompleted(orderId: orderId);
              }),
        )
      ],
    );
  }
}
