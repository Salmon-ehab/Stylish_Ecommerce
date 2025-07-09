import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:shop_ecommerce/core/widgets/custom_product_widget.dart';
import 'package:shop_ecommerce/core/widgets/text_head_line.dart';
import 'package:shop_ecommerce/feature/search/presentation/manager/search_cubit.dart';
import 'package:shop_ecommerce/feature/search/presentation/manager/search_state.dart';
import 'package:shop_ecommerce/feature/search/presentation/views/widgets/search_widget.dart/search_widget.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const SearchWidget(),
            const SizedBox(height: 17),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchSuccessState) {
                  return TextHeadLine(title: "${state.products.length} Items");
                }
                return const SizedBox();
              },
            ),
            const SizedBox(height: 17),
            BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                final products =
                    (state is SearchSuccessState) ? state.products : [];

                if (state is SearchFailureState) {
                  return Center(child: Text(state.error));
                }
                if (state is SearchSuccessState && products.isEmpty) {
                  return const Center(child: Text("There Is No Item"));
                }

                return Skeletonizer(
                  enabled: state is SearchLoadingState,
                  child: GridView.builder(
                    itemCount:
                        state is SearchLoadingState ? 2 : products.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 0.55,
                    ),
                    itemBuilder: (context, index) {
                      return CustomProductWidget(
                        productModel: state is SearchSuccessState
                            ? products[index]
                            : ProductModel(),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
