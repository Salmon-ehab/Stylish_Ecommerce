import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_ecommerce/core/errors/app_exception.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/core/models/response_model.dart';
import 'package:shop_ecommerce/core/network/api_consumer.dart';
import 'package:shop_ecommerce/core/network/end_points.dart';
import 'package:shop_ecommerce/feature/my_orders/data/repo/cancel_order_repo/cancel_order_repo.dart';

class CancelOrderRepoImple implements CancelOrderRepo {
  final ApiConsumer apiConsumer;

  CancelOrderRepoImple({required this.apiConsumer});

  @override
  Future<Either<Failure, ResponseModel>> cancelOrder(
      {required int orderId}) async {
    try {
      final response = await apiConsumer
          .post("${EndPoints.cancelOrder}$orderId", isProtected: true,isFormData: false);
      final responseModel = ResponseModel.fromJson(response);
      return Right(responseModel);
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
