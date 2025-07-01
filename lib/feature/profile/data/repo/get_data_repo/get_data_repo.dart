import 'package:dartz/dartz.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/feature/auth/data/models/user_model_from_api.dart';

abstract class GetDataRepo {
  Future<Either<Failure,UserModelFromApi>> getData();
}