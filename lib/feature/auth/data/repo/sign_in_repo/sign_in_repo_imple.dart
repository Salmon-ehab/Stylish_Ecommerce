import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_ecommerce/core/cache/cache_helper.dart';
import 'package:shop_ecommerce/core/cache/cache_key.dart';
import 'package:shop_ecommerce/core/errors/app_exception.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/core/network/api_consumer.dart';
import 'package:shop_ecommerce/core/network/end_points.dart';
import 'package:shop_ecommerce/feature/auth/data/models/user_response_api.dart';
import 'package:shop_ecommerce/feature/auth/data/repo/sign_in_repo/sign_in_repo.dart';

class SignInRepoImple implements SignInRepo {
  final ApiConsumer apiConsumer;

  SignInRepoImple({required this.apiConsumer});
  @override
  Future<Either<Failure, UserResponseApi>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final response = await apiConsumer
          .post(EndPoints.login, data: {'email': email, 'password': password});
      UserResponseApi userResponseApi = UserResponseApi.fromJson(response);
      await CacheHelper.saveData(
          key: CacheKey.accessToken, value: userResponseApi.accessToken);
      await CacheHelper.saveData(
          key: CacheKey.refreshToken, value: userResponseApi.refreshToken);
     
      return Right(userResponseApi);
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {
      return Left(Failure("try again!"));
    }
  }
}
