import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_ecommerce/core/errors/app_exception.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/core/network/api_consumer.dart';
import 'package:shop_ecommerce/core/network/end_points.dart';
import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';
import 'package:shop_ecommerce/feature/home/data/repo/get_best_seller_repo/get_best_seller_repo.dart';

class GetBestSellerRepoImple implements GetBestSellerRepo {
  final ApiConsumer apiConsumer;

  GetBestSellerRepoImple({required this.apiConsumer});
  @override
  Future<Either<Failure, List<ProductModel>>> getBestSeller() async {
    try {
      List<ProductModel> products = [];
      final response =
          await apiConsumer.get(EndPoints.getBestSeller, isProtected: true);
      for (var bestSellerProduct in response["best_seller_products"]) {
        products.add(ProductModel.fromJson(bestSellerProduct));
      }
      return right(products);
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
