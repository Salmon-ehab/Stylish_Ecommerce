import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_ecommerce/core/errors/app_exception.dart';
import 'package:shop_ecommerce/core/models/response_model.dart';
import 'package:shop_ecommerce/core/network/api_consumer.dart';
import 'package:shop_ecommerce/core/network/end_points.dart';
import 'package:shop_ecommerce/feature/my_orders/data/models/order_model.dart';
import 'package:shop_ecommerce/feature/my_orders/data/repo/get_order_repo/get_order_repo.dart';

class GetOrderRepoImple implements GetOrderRepo {
  final ApiConsumer apiConsumer;

  GetOrderRepoImple({required this.apiConsumer});
  @override
  Future<Either<ResponseModel, OrderModel>> getOrders() async {
    try {
      final response =
          await apiConsumer.get(EndPoints.getOrders, isProtected: true);
      final orderModel = OrderModel.fromJson(response);
      return Right(orderModel);
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(ResponseModel(status: false, message: error.message));
    } catch (e) {
      return Left(ResponseModel(status: false, message: e.toString()));
    }
  }
}
