import 'package:dartz/dartz.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/feature/home/data/models/category_model.dart';

abstract class GetCategoryRepo {
Future<Either<Failure,List<CategoryModel>>> getCategories();
}