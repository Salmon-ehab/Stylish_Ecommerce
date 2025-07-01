import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_ecommerce/core/errors/app_exception.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/core/models/response_model.dart';
import 'package:shop_ecommerce/core/network/api_consumer.dart';
import 'package:shop_ecommerce/core/network/end_points.dart';
import 'package:shop_ecommerce/feature/auth/data/models/user_model_to_api.dart';
import 'package:shop_ecommerce/feature/auth/data/repo/sign_up_repo/sign_up_repo.dart';

class SignUpImple implements SignUpRepo {
  final ApiConsumer apiConsumer;

  SignUpImple({required this.apiConsumer});
  @override
  Future<Either<Failure, ResponseModel>> signUpWithEmailAndPassword(
      {required UserModelToApi userModel}) async {
    try {
      final response = await apiConsumer.post(EndPoints.register, data: {
        "name": userModel.name,
        "password": userModel.password,
        "image": userModel.image,
        "email": userModel.email,
        "phone": userModel.phone
      });
      ResponseModel responseModel = ResponseModel.fromJson(response);
      if (responseModel.status == false) {
        return Left(Failure("Username already exists"));
      }
      return Right(responseModel);
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {
      return Left(Failure("Username already exists"));
    }
  }
}
