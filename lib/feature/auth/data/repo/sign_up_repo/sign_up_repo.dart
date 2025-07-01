import 'package:dartz/dartz.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/core/models/response_model.dart';
import 'package:shop_ecommerce/feature/auth/data/models/user_model_to_api.dart';

abstract class SignUpRepo {
  Future<Either<Failure, ResponseModel>> signUpWithEmailAndPassword(
      {required UserModelToApi userModel});
}
