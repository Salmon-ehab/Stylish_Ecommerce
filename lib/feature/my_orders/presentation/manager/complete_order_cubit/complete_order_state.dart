import 'package:shop_ecommerce/core/models/response_model.dart';

abstract class CompleteOrderState {}

class CompleteOrderInitialState extends CompleteOrderState {}

class CompleteOrderLoadingState extends CompleteOrderState {}

class CompleteOrderSuccessState extends CompleteOrderState {
  final ResponseModel responseModel;

  CompleteOrderSuccessState({required this.responseModel});
}

class CompleteOrderFailureState extends CompleteOrderState {
  final String error;

  CompleteOrderFailureState({required this.error});
}
