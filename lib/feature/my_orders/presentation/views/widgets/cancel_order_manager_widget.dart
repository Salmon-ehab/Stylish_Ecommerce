import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/helper/app_snack_bar.dart';
import 'package:shop_ecommerce/core/widgets/custom_button_order.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/cancel_order_cubit/cancel_order_cubit.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/cancel_order_cubit/cancel_order_state.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/get_order_cubit/get_order_cubit.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class CancelOrderManagerWidget extends StatelessWidget {
  const CancelOrderManagerWidget({super.key, required this.orderId});
final int orderId;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CancelOrderCubit, CancelOrderState>(
      listenWhen: (previousState, currentState) {
        return (currentState is CancelOrderSuccessState &&
                previousState is! CancelOrderSuccessState) ||
            (currentState is CancelOrderFailureState &&
                previousState is! CancelOrderFailureState);
      },
      listener: (context, state) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        if (state is CancelOrderSuccessState) {
          AppSnackBar.showSuccess(
              context: context, message: state.responseModel.message);
          GetOrderCubit.get(context).fetchOrders();
        } else if (state is CancelOrderFailureState) {
          AppSnackBar.showError(context: context, message: state.error);
        }
      },
      child: Expanded(
        child: CustomButtonOrder(
          title: S.of(context).cancel,
          height: 21,
          onPressed: () {
            CancelOrderCubit.get(context).cancelOrder(orderId: orderId);
          },
        ),
      ),
    );
  }
}
