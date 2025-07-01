import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/network/dio_consumer.dart';
import 'package:shop_ecommerce/feature/home/data/repo/get_product_repo/get_product_repo_imple.dart';
import 'package:shop_ecommerce/feature/home/presentation/manager/get_product_cubit/get_product_cubit.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/widgets/custom_app_logo.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/widgets/trending_products/trending_body.dart';

class TrendingView extends StatelessWidget {
  const TrendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetProductCubit(
          GetProductsRepoImple(apiConsumer: DioConsumer(dio: Dio())))
        ..getProducts(),
      child: const Scaffold(
        appBar: CustomAppLogo(),
        body: TrendingBody(),
      ),
    );
  }
}
