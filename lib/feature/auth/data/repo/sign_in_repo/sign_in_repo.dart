import 'package:dartz/dartz.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/feature/auth/data/models/user_response_api.dart';

abstract class SignInRepo {
  Future<Either<Failure, UserResponseApi>> signInWithEmailAndPassword(
      {required String email, required String password});
}
