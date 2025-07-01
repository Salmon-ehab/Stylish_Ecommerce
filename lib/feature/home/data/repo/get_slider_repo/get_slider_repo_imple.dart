import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shop_ecommerce/core/errors/app_exception.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/core/network/api_consumer.dart';
import 'package:shop_ecommerce/core/network/end_points.dart';
import 'package:shop_ecommerce/feature/home/data/models/slider_model.dart';
import 'package:shop_ecommerce/feature/home/data/repo/get_slider_repo/get_slider_repo.dart';

class GetSliderRepoImple implements GetSliderRepo {
  final ApiConsumer apiConsumer;

  GetSliderRepoImple({required this.apiConsumer});
  @override
  Future<Either<Failure, List<SliderModel>>> getSliders() async {
    try {
      List<SliderModel> sliders = [];
      final response =
          await apiConsumer.get(EndPoints.getSliders, isProtected: true);
      for (var slider in response["sliders"]) {
        sliders.add(SliderModel.fromJson(slider));
      }
      return right(sliders);
    } on DioException catch (e) {
      final error = AppException.fromDio(e);
      return Left(Failure(error.message));
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
