import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_ecommerce/core/network/dio_consumer.dart';
import 'package:shop_ecommerce/core/utils/app_color.dart';
import 'package:shop_ecommerce/core/widgets/add_to_favorite_manager/add_to_favorit_cubit.dart/add_to_favorit_cubit.dart';
import 'package:shop_ecommerce/core/widgets/add_to_favorite_manager/add_to_favorit_cubit.dart/add_to_favorite_state.dart';
import 'package:shop_ecommerce/core/widgets/add_to_favorite_manager/add_to_favorite_repo/add_to_favorite_repo_imple.dart';
import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';
import 'package:shop_ecommerce/feature/profile/presentation/manager/user_cubit/user_cubit.dart'; // لكي نحدث بيانات المستخدم

class HeartIconWidget extends StatelessWidget {
  const HeartIconWidget({
    super.key,
    required this.productModel,
  });
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddToFavoritCubit(
          AddToFavoriteRepoImple(apiConsumer: DioConsumer(dio: Dio()))),
      child: BlocConsumer<AddToFavoritCubit, AddToFavoriteState>(
        listener: (context, state) {
          if (state is AddToFavoritSuccessState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Added to Favorite ❤️'),
                duration: Duration(seconds: 2),
              ),
            );
            UserCubit.get(context).getUserDataFromAPI();
          } else if (state is AddToFavoritFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                duration: const Duration(seconds: 2),
              ),
            );
          }
        },
        builder: (context, favAddState) {
          final AddToFavoritCubit addToFavoriteCubit =
              AddToFavoritCubit.get(context);
           bool isCurrentlyFavorite = productModel.isFavorite ?? false;

          return InkWell(
            onTap: () {
              if (!isCurrentlyFavorite) {
                productModel.isFavorite = true;
                addToFavoriteCubit.addToFavorite(productModel.id!);
              }
            },
            child: Container(
              width: 37,
              height: 37,
              decoration: const BoxDecoration(
                color: AppColor.grey8,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite,
                color: isCurrentlyFavorite ? Colors.red : Colors.white,
                size: 20,
              ),
            ),
          );
        },
      ),
    );
  }
}
