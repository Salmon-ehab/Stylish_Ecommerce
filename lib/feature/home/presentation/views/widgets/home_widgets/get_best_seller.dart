import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/helper/app_snack_bar.dart';
import 'package:shop_ecommerce/core/network/dio_consumer.dart';
import 'package:shop_ecommerce/core/widgets/custom_product_widget.dart';
import 'package:shop_ecommerce/feature/home/data/repo/get_best_seller_repo/get_best_seller_repo_imple.dart';
import 'package:shop_ecommerce/feature/home/presentation/manager/get_best_seller_cubit/get_best_seller_cubit.dart';
import 'package:shop_ecommerce/feature/home/presentation/manager/get_best_seller_cubit/get_best_seller_state.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/widgets/shimmer_product_widget.dart'; // تأكد من المسار الصحيح للـ State

class GetBestSeller extends StatelessWidget {
  const GetBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetBestSellerCubit(
        GetBestSellerRepoImple(apiConsumer: DioConsumer(dio: Dio())),
      )..getBestSellerProducts(),
      child: BlocConsumer<GetBestSellerCubit, GetBestSellerState>(
        listener: (blocContext, state) {
          if (state is GetBestSellerErrorState) {
            AppSnackBar.showError(context: context, message: state.error);
          }
        },
        builder: (blocContext, state) {
          if (state is GetBestSellerLoadingState) {
            return const ShimmerProductWidget();
          } else if (state is GetBestSellerSuccessState) {
            if (state.products.isEmpty) {
              return const SliverFillRemaining(
                hasScrollBody: false,
                child: Center(child: Text("No best seller products found.")),
              );
            }
            return SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.55,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return CustomProductWidget(
                      productModel: state.products[index]);
                },
                childCount: state.products.length,
              ),
            );
          } else if (state is GetBestSellerErrorState) {
            return SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                  child: Text("Failed to load products: ${state.error}")),
            );
          }
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(child: Text("UnExpected Error...")),
          );
        },
      ),
    );
  }
}
