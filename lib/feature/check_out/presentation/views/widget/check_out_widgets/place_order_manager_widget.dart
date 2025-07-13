import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/go_route/routes.dart';
import 'package:shop_ecommerce/core/helper/app_snack_bar.dart';
import 'package:shop_ecommerce/core/helper/my_navigator.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/widgets/custom_button.dart';
import 'package:shop_ecommerce/feature/check_out/presentation/manager/place_order_cubit/place_order_cubit.dart';
import 'package:shop_ecommerce/feature/check_out/presentation/manager/place_order_cubit/place_order_state.dart';
import 'package:shop_ecommerce/generated/l10n.dart';

class PlaceOrderManagerWidget extends StatelessWidget {
  const PlaceOrderManagerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PlaceOrderCubit, PlaceOrderState>(
        listener: (context, state) {
          if (state is PlaceOrderSuccessState) {
            AppSnackBar.showSuccess(
                context: context, message: "Order placed successfully!");
            MyNavigator.goToOff(context, Routes.myOrderView);
          } else if (state is PlaceOrderErrorState) {
            AppSnackBar.showError(context: context, message: state.error);
          }
        },
        child: Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: BlocBuilder<PlaceOrderCubit, PlaceOrderState>(
                builder: (context, state) {
              return state is PlaceOrderLoadingState
                  ?const Center(
                    child:  CircularProgressIndicator(
                        color: AppColor.appNameColor),
                  )
                  : CustomButton(
                      label: S.of(context).placeOrder,
                      onTap: () {
                        PlaceOrderCubit.get(context).placeOrder();
                      },
                    );
            })));
  }
}
