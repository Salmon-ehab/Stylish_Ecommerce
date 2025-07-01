import 'package:dartz/dartz.dart';
import 'package:shop_ecommerce/core/errors/failure.dart';
import 'package:shop_ecommerce/feature/home/data/models/slider_model.dart';

abstract class GetSliderRepo {
  Future<Either<Failure, List<SliderModel>>> getSliders();
}
