import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/network/dio_consumer.dart';
import 'package:shop_ecommerce/core/widgets/custom_appbar.dart';
import 'package:shop_ecommerce/feature/my_orders/data/repo/get_order_repo/get_order_repo_imple.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/manager/get_order_cubit/get_order_cubit.dart';
import 'package:shop_ecommerce/feature/my_orders/presentation/views/widgets/my_order_body.dart';

class MyOrderView extends StatelessWidget {
  const MyOrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(
          title: "My Orders",
        ),
        body: BlocProvider(
            create: (_) => GetOrderCubit(
                GetOrderRepoImple(apiConsumer: DioConsumer(dio: Dio())))
              ..fetchOrders(),
            child: const MyOrderBody()));
  }
}
