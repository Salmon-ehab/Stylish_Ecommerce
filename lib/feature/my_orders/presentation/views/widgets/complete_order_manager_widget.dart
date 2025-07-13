import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/helper/app_snack_bar.dart';
import 'package:shop_ecommerce/core/widgets/custom_button_order.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/complete_order_cubit/complete_order_cubit.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/complete_order_cubit/complete_order_state.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/get_order_cubit/get_order_cubit.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class CompleteOrderManagerWidget extends StatelessWidget {
  const CompleteOrderManagerWidget({super.key, required this.orderId});
 final int orderId;
  @override
  Widget build(BuildContext context) {
    return  BlocListener<CompleteOrderCubit, CompleteOrderState>(
          listenWhen: (previousState, currentState) {
            return (currentState is CompleteOrderSuccessState &&
                    previousState is! CompleteOrderSuccessState) ||
                (currentState is CompleteOrderFailureState &&
                    previousState is! CompleteOrderFailureState);
          },
          listener: (context, state) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            if (state is CompleteOrderSuccessState) {
              AppSnackBar.showSuccess(
                  context: context, message: state.responseModel.message);
              GetOrderCubit.get(context).fetchOrders();
            } else if (state is CompleteOrderFailureState) {
              AppSnackBar.showError(context: context, message: state.error);
            }
          },
          child: Expanded(
            child: CustomButtonOrder(
                title: S.of(context).complete,
                height: 21,
                onPressed: () {
                  CompleteOrderCubit.get(context)
                      .fetchOrderCompleted(orderId: orderId);
                }),
          ),
        )
      ;
  }
}