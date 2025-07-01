import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_ecommerce/core/network/dio_consumer.dart';
import 'package:shop_ecommerce/core/widgets/custom_product_widget.dart';
import 'package:shop_ecommerce/feature/home/data/repo/get_best_seller_repo/get_best_seller_repo_imple.dart';
import 'package:shop_ecommerce/feature/home/presentation/manager/get_best_seller_cubit/get_best_seller_cubit.dart';
import 'package:shop_ecommerce/feature/home/presentation/manager/get_best_seller_cubit/get_best_seller_state.dart'; // تأكد من المسار الصحيح للـ State

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
            ScaffoldMessenger.of(blocContext).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (blocContext, state) {
          if (state is GetBestSellerLoadingState) {
            return SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.55,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  );
                },
                childCount: 6,
              ),
            );
          } else if (state is GetBestSellerSuccessState) {
            if (state.products.isEmpty) {
              return const SliverFillRemaining(
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
              child: Center(
                  child: Text("Failed to load products: ${state.error}")),
            );
          }
          return const SliverFillRemaining(
            child: Center(child: Text("Please wait...")),
          );
        },
      ),
    );
  }
}
