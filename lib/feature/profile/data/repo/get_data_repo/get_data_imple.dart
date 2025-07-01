import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_ecommerce/core/errors/app_exception.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/core/network/api_consumer.dart';
import 'package:shop_ecommerce/core/network/end_points.dart';
import 'package:shop_ecommerce/feature/auth/data/models/user_model_from_api.dart';
import 'package:shop_ecommerce/feature/auth/data/models/user_response_api.dart';
import 'package:shop_ecommerce/feature/profile/data/repo/get_data_repo/get_data_repo.dart';

class GetDataRepoImple implements GetDataRepo {
  final ApiConsumer apiConsumer;
  GetDataRepoImple(this.apiConsumer) : super();
  @override
  Future<Either<Failure, UserModelFromApi>> getData() async {
    try {
      final response =
          await apiConsumer.get(EndPoints.getUserData, isProtected: true);
      UserResponseApi userResponseApi = UserResponseApi.fromJson(response);
      if (userResponseApi.status != null && userResponseApi.status == true) {
        if (userResponseApi.user != null) {
          return Right(userResponseApi.user!);
        } else {
          throw Exception("Login Failed\nTry Again later");
        }
      } else {
        throw Exception("Login Failed\nTry Again later");
      }
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
