import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_ecommerce/core/errors/app_exception.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/core/network/api_consumer.dart';
import 'package:shop_ecommerce/core/network/end_points.dart';
import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';
import 'package:shop_ecommerce/feature/search/data/repo/search_repo.dart';

class SearchRepoImple implements SearchRepo {
  final ApiConsumer apiConsumer;

  SearchRepoImple({required this.apiConsumer});
  @override
  Future<Either<Failure, List<ProductModel>>> searchItems(
      {required String quiery}) async {
    try {
      final response = await apiConsumer.get("${EndPoints.searchItem}$quiery",
          isProtected: true);
      final List data = response["products"];
      final products = data.map((e) => ProductModel.fromJson(e)).toList();
      return Right(products);
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
