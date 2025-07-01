import 'package:shop_ecommerce/feature/home/data/models/product_model.dart';

abstract class GetProductState {}

class GetProductInitState extends GetProductState {}

class GetProductSuccessState extends GetProductState {
  final List<ProductModel> products;

  GetProductSuccessState({required this.products});
}

class GetProductLoadingState extends GetProductState {}

class GetProductErrorState extends GetProductState {
  String error;
  GetProductErrorState({required this.error});
}
