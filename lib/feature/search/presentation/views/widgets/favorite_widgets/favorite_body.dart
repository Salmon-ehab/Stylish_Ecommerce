import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_ecommerce/core/network/dio_consumer.dart';
import 'package:shop_ecommerce/core/widgets/custom_product_widget.dart';
import 'package:shop_ecommerce/feature/profile/data/repo/get_data_repo/get_data_imple.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/user_cubit/user_cubit.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/user_cubit/user_state.dart';

class FavoriteBody extends StatelessWidget {
  const FavoriteBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
      child: BlocProvider(
        create: (context) => UserCubit(GetDataRepoImple(DioConsumer(dio: Dio())))..getUserDataFromAPI(), 
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            if (state is UserLoadingState) {
              return GridView.builder( // <--- تم التغيير من SliverGrid إلى GridView.builder
                padding: EdgeInsets.zero, // <--- مهم: لإزالة أي padding إضافي
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.55,
                ),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
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
              );
            } else if (state is UserSuccessState) {
              if (state.userModel.favoriteProducts!.isEmpty) {
                return const Center( // <--- تم التغيير من SliverFillRemaining إلى Center
                  child: Text("No Favorite products found."),
                );
              }
              return GridView.builder( // <--- تم التغيير من SliverGrid إلى GridView.builder
                padding: EdgeInsets.zero, // <--- مهم: لإزالة أي padding إضافي
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.55,
                ),
                itemCount: state.userModel.favoriteProducts!.length,
                itemBuilder: (BuildContext context, int index) {
                  return CustomProductWidget(
                      productModel: state.userModel.favoriteProducts![index]);
                },
              );
            } else if (state is UserErrorState) {
              return Center( // <--- تم التغيير من SliverFillRemaining إلى Center
                child: Text("Failed to load products: ${state.error}"),
              );
            }
            return const Center(child: Text("Please wait..."));
          },
        ),
      ),
    );
  }
}