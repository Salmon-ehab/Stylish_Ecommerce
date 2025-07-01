import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/core/models/response_model.dart';

abstract class UpdateRepo {
  Future<Either<Failure, ResponseModel>> updateProfile(
      {required String userName,required String phone, required XFile image});
}
