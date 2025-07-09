import 'package:shop_ecommerce/feature/check_out/data/model/place_order_response_model.dart';

abstract class PlaceOrderState {}

class PlaceOrderInitialState extends PlaceOrderState{}

class PlaceOrderLoadingState extends PlaceOrderState{}

class PlaceOrderSuccessState extends PlaceOrderState{
  final PlaceOrderResponseModel placeOrderResponseModel;

  PlaceOrderSuccessState({required this.placeOrderResponseModel});
}

class PlaceOrderErrorState extends PlaceOrderState{
  final String error;

  PlaceOrderErrorState({required this.error});
}