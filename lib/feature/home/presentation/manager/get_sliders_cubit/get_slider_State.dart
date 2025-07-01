
import 'package:shop_ecommerce/feature/home/data/models/slider_model.dart';

abstract class GetSliderState {}

class GetSliderInitState extends GetSliderState {}

class GetSliderSuccessState extends GetSliderState {
  final List<SliderModel> sliders;

  GetSliderSuccessState({required this.sliders});
}

class GetSliderLoadingState extends GetSliderState {}

class GetSliderErrorState extends GetSliderState {
  String error;
  GetSliderErrorState({required this.error});
}
