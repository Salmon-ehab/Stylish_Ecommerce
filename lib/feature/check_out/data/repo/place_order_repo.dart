import 'package:dartz/dartz.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/feature/check_out/data/model/place_order_response_model.dart';

abstract class PlaceOrderRepo {
  Future<Either<Failure,PlaceOrderResponseModel>> placeOrder();
}