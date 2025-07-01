import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_ecommerce/core/errors/app_exception.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/core/models/response_model.dart';
import 'package:shop_ecommerce/core/network/api_consumer.dart';
import 'package:shop_ecommerce/core/network/end_points.dart';
import 'package:shop_ecommerce/feature/profile/data/repo/update_profilr_repo/update_repo.dart';

class UpdateRepoImple implements UpdateRepo {
  final ApiConsumer apiConsumer;

  UpdateRepoImple({required this.apiConsumer});
  @override
  Future<Either<Failure, ResponseModel>> updateProfile(
      {required String userName,
      required String phone,
      required XFile image}) async {
    try {
      final response = await apiConsumer.put(EndPoints.updateProfile,
          data: {
            'name': userName,
            'phone': phone,
            'image':
                await MultipartFile.fromFile(image.path, filename: image.name)
          },
          isProtected: true,
          );
      ResponseModel responseModel = ResponseModel.fromJson(response);
      return Right(responseModel);
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
