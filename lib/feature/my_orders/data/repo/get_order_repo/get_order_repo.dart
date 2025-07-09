import 'package:dartz/dartz.dart';
import 'package:shop_ecommerce/core/models/response_model.dart';
import 'package:shop_ecommerce/feature/my_orders/data/models/order_model.dart';

abstract class GetOrderRepo {
  Future<Either<ResponseModel,OrderModel>> getOrders();
}