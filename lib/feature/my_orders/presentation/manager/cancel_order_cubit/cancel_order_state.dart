import 'package:shop_ecommerce/core/models/response_model.dart';

abstract class CancelOrderState {}

class CancelOrderInitialState extends CancelOrderState {}

class CancelOrderLoadingState extends CancelOrderState {}

class CancelOrderSuccessState extends CancelOrderState {
  final ResponseModel responseModel;

  CancelOrderSuccessState({required this.responseModel});
}

class CancelOrderFailureState extends CancelOrderState {
  final String error;

  CancelOrderFailureState({required this.error});
}
