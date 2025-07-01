import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_ecommerce/core/errors/app_exception.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/core/network/api_consumer.dart';
import 'package:shop_ecommerce/core/network/end_points.dart';
import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';
import 'package:shop_ecommerce/feature/home/data/repo/get_product_repo/get_product_repo.dart';

class GetProductsRepoImple implements GetProductRepo {
  final ApiConsumer apiConsumer;

  GetProductsRepoImple({required this.apiConsumer});
  @override
  Future<Either<Failure, List<ProductModel>>> getProducts() async {
    try {
      List<ProductModel> products = [];
      final response =
          await apiConsumer.get(EndPoints.getProducts, isProtected: true);
      final List<dynamic> productsJsonList = response['products'];

      products = productsJsonList
          .map((json) => ProductModel.fromJson(json
              as Map<String, dynamic>)) 
          .toList();
      return right(products);
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
