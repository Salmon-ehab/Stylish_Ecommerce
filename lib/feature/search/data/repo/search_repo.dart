import 'package:dartz/dartz.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<ProductModel>>> searchItems({required String quiery});
}
