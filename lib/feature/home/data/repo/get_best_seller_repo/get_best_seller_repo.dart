import 'package:dartz/dartz.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';

abstract class GetBestSellerRepo {
  Future<Either<Failure,List< ProductModel>>> getBestSeller();
}