import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_ecommerce/core/errors/app_exception.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/core/models/response_model.dart';
import 'package:shop_ecommerce/core/network/api_consumer.dart';
import 'package:shop_ecommerce/core/network/end_points.dart';
import 'package:shop_ecommerce/core/widgets/add_to_favorite_manager/add_to_favorite_repo/add_to_favorite_repo.dart';

class AddToFavoriteRepoImple implements AddToFavoriteRepo {
  final ApiConsumer apiConsumer;

  AddToFavoriteRepoImple({required this.apiConsumer});
  @override
  Future<Either<Failure, ResponseModel>> addToFavorite(
      {required int productId}) async {
    try {
      final response = await apiConsumer
          .post(EndPoints.addToFavorite, data: {'product_id': productId},isProtected: true);
      ResponseModel responseModel = ResponseModel.fromJson(response);

      return Right(responseModel);
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {
      return Left(Failure("try again!"));
    }
  }
}
