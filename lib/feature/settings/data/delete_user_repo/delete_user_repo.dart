import 'package:dartz/dartz.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/core/models/response_model.dart';

abstract class DeleteUserRepo {
  Future<Either<Failure,ResponseModel>> deleteUser();
}