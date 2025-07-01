import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_ecommerce/core/widgets/add_to_favorite_manager/widget/heart_icon_widget.dart';
import 'package:shop_ecommerce/core/widgets/custom_product_widget.dart';
import 'package:shop_ecommerce/feature/home/presentation/manager/get_product_cubit/get_product_cubit.dart';
import 'package:shop_ecommerce/feature/home/presentation/manager/get_product_cubit/get_product_state.dart'; // تأكد من المسار الصحيح للـ State

class GetProductsBody extends StatelessWidget {
  const GetProductsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetProductCubit, GetProductState>(
      listener: (context, state) {
        if (state is GetProductErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        if (state is GetProductLoadingState) {
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
        } else if (state is GetProductSuccessState) {
          if (state.products.isEmpty) {
            return const SliverFillRemaining(
              child: Center(child: Text("No  products found.")),
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
                return Stack(
                  alignment: Alignment.topRight,
                  children: [
                    CustomProductWidget(productModel: state.products[index]),
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.only(end: 9, top: 11),
                      child: HeartIconWidget(
                       productModel: state.products[index],
                      ),
                    )
                  ],
                );
              },
              childCount: state.products.length,
            ),
          );
        } else if (state is GetProductErrorState) {
          return SliverFillRemaining(
            child:
                Center(child: Text("Failed to load products: ${state.error}")),
          );
        }
        return const SliverFillRemaining(
          child: Center(child: Text("Please wait...")),
        );
      },
    );
  }
}
