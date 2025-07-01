import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_ecommerce/core/errors/app_exception.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/core/network/api_consumer.dart';
import 'package:shop_ecommerce/core/network/end_points.dart';
import 'package:shop_ecommerce/feature/home/data/models/category_model.dart';
import 'package:shop_ecommerce/feature/home/data/repo/get_category_repo/get_category_repo.dart';

class GetCategoryRepoImple extends GetCategoryRepo {
  final ApiConsumer apiConsumer;

  GetCategoryRepoImple({required this.apiConsumer});
  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    try {
      List<CategoryModel> categories = [];
      final response =
          await apiConsumer.get(EndPoints.getCategories, isProtected: true);
      for (var category in response["categories"]) {
        categories.add(CategoryModel.fromJson(category));
      }
      return right(categories);
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
