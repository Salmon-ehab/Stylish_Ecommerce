import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/network/dio_consumer.dart';
import 'package:shop_ecommerce/core/widgets/custom_appbar.dart';
import 'package:shop_ecommerce/feature/cart/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:shop_ecommerce/feature/check_out/data/repo/place_order_repo_imple.dart';
import 'package:shop_ecommerce/feature/check_out/presentation/manager/place_order_cubit/place_order_cubit.dart';
import 'package:shop_ecommerce/feature/check_out/presentation/views/widget/check_out_widgets/check_out_body.dart';

class CheckOutView extends StatelessWidget {
  const CheckOutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(title: "Checkout"),
      body: BlocProvider(
          create: (_) => PlaceOrderCubit(
              PlaceOrderRepoImple(
                  cartItemsOrder: CartCubit.get(context).items,
                  apiConsumer: DioConsumer(dio: Dio())),
              CartCubit.get(context)),
          child: const CheckOutBody()),
    );
  }
}
