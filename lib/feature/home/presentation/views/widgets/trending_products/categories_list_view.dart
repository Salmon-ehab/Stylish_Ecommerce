import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shop_ecommerce/core/network/dio_consumer.dart';
import 'package:shop_ecommerce/feature/home/data/repo/get_category_repo/get_category_repo_imple.dart';
import 'package:shop_ecommerce/feature/home/presentation/manager/get_category_cubit/get_categories_cubit.dart';
import 'package:shop_ecommerce/feature/home/presentation/manager/get_category_cubit/get_category_state.dart'; // <--- تأكد من المسار الصحيح للـ State
import 'package:shop_ecommerce/feature/home/presentation/manager/get_product_cubit/get_product_cubit.dart';
import 'package:shop_ecommerce/feature/home/presentation/views/widgets/home_widgets/category_widget.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCategoriesCubit(
          GetCategoryRepoImple(apiConsumer: DioConsumer(dio: Dio())))
        ..getCategories(),
      child: BlocBuilder<GetCategoriesCubit, GetCategoryState>(
        builder: (context, state) {
          if (state is GetCategoryLoadingState) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: SizedBox(
                height: 75,
                width: double.infinity,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (context, _) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return const CircleAvatar(
                      radius: 28,
                    );
                  },
                ),
              ),
            );
          } else if (state is GetCategorySuccessState) {
            if (state.categories.isEmpty) {
              return const SizedBox(
                height: 75,
                width: double.infinity,
                child: Center(child: Text("No categories available.")),
              );
            }
            return SizedBox(
              height: 75,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: state.categories.length,
                separatorBuilder: (context, _) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  return CategoryWidget(
                      categoryModel: state.categories[index],
                      onTap: (categoryId) {
                        GetProductCubit.get(context)
                            .filterProductsByCategory(categoryId);
                      });
                },
              ),
            );
          } else if (state is GetCategoryErrorState) {
            return SizedBox(
              height: 75,
              width: double.infinity,
              child: Center(
                  child: Text("Failed to load categories: ${state.error}")),
            );
          }
          return const SizedBox(
            height: 75,
            width: double.infinity,
            child: Center(child: Text("Please wait...")),
          );
        },
      ),
    );
  }
}
