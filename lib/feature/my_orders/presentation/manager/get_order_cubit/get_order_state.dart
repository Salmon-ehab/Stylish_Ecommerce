import 'package:shop_ecommerce/feature/my_orders/data/models/order_model.dart';

abstract class GetOrderState {}

class GetOrderInitialState extends GetOrderState {}

class GetOrderLoadingState extends GetOrderState {}

class GetOrderSuccessState extends GetOrderState {
  final OrderModel orderModel;

  GetOrderSuccessState({required this.orderModel});
}

class GetOrderFailureState extends GetOrderState {
  final String error;

  GetOrderFailureState({required this.error});
}
