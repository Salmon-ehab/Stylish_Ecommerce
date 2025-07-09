import 'package:dartz/dartz.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/core/models/response_model.dart';

abstract class CompleteOrderRepo {
  Future<Either<Failure, ResponseModel>> getCompleteOrder(
      {required int orderId});
}
